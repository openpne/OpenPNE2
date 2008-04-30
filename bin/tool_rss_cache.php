<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

if (OPENPNE_UNDER_MAINTENANCE) {
    exit;
}

//-------------config-------------//
// 一度に取得するRSSの件数
$rss_num = 100;
if (defined('RSS_CACHE_LIMIT') && intval(RSS_CACHE_LIMIT) > 0)
    $rss_num = intval(RSS_CACHE_LIMIT);

// 最後に取得したメンバーのIDを格納するファイル
$log = OPENPNE_VAR_DIR . '/log/rss_cache.log';

//RSS設定が空のメンバーに対してDELETE文を発行するか
$is_delete = false;
//ログ出力をするか
define('RSS_CACHE_DISPLAY_LOG', true);
//-------------config-------------//


require_once 'OpenPNE/RSS.php';
$rss = new OpenPNE_RSS();

$start_id = $end_id = 0;

touch($log);

// 前回最後にRSS取得したメンバーのID取得
if ($f = fopen($log, 'r+')) {
    rewind($f);
    if (flock($f, LOCK_EX)) {
        $start_id = intval(fread($f, 11));
    }
}

// rss のURLが入っている人を抽出
$c_member_list = db_c_member_list4exists_rssAc_member_id($start_id, $rss_num);
if ($c_member_list) {
    $lastone = end($c_member_list);
    $end_id = $lastone['c_member_id'];

    if (count($c_member_list) < $rss_num) {
        $end_id = 0;
    }
}

// 今回取得する最後のメンバーIDを記録
if ($f) {
    rewind($f);
    ftruncate($f, fwrite($f, $end_id));

    flock($f, LOCK_UN);
    fclose($f);
}

foreach ($c_member_list as $c_member) {
    if (!$items = $rss->fetch($c_member['rss'])) continue;

    $c_member_id = $c_member['c_member_id'];
    _log('get', $c_member_id);

    $insert_rss_list = array();
    foreach ($items as $item) {
        // DBに存在するデータが見つかったら以降は比較、取得は行わない
        if (db_rss_is_duplicated_rss_cache($c_member_id, $item['date'], $item['link'])) {
            break;
        }

        if (!db_rss_is_future_rss_item($item['date'])) {
            if ($id = db_rss_is_updated_rss_cache($c_member_id, $item['link'])) {
                // update
                db_rss_update_c_rss_cache($id,
                    $item['title'], $item['body'], $item['date'], $item['link']);
            } else {
                // insert
                $insert_rss_list[] = $item;
            }
        }
    }

    _log('insert', count($insert_rss_list) . " records");
    db_insert_c_rss_cache_list($c_member_id, $insert_rss_list);
}

// RSS設定が空のメンバーに対してDELETE
if ($is_delete) {
    $c_member_list = db_c_member_list4no_exists_rssAc_member_id($start_id, $end_id);
    db_delete_rss_cache4c_member_list($c_member_list);
}


//-------------------------------以下関数定義---------------------------//
/*
 * 一回のSQLでメンバー一人分のRSSキャッシュをINSERT
 */
function db_insert_c_rss_cache_list($c_member_id, $insert_rss_list)
{
    if (!$insert_rss_list) return false;

    $values_list = '';
    foreach ($insert_rss_list as $item) {
        $params = array(
            'c_member_id' => intval($c_member_id),
            'subject'     => $item['title'],
            'body'        => $item['body'],
            'r_datetime'  => $item['date'],
            'link'        => $item['link'],
            'cache_date'  => db_now(),
        );

        $values = array_map('db_quote', array_values($params));
        $values = implode(",", $values);

        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $values = "($values)";
            $sql = "INSERT INTO c_rss_cache" .
                    "(c_member_id, subject, body, r_datetime, link, cache_date)" .
                " VALUES $values";
            db_query($sql);
        } else {
            if ($values_list != '') $values_list .= ",";
            $values_list .= "($values)";
        }
    }

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] != 'pgsql') {
        $sql = "INSERT INTO c_rss_cache" .
                "(c_member_id, subject, body, r_datetime, link, cache_date)" .
            " VALUES $values_list";
        db_query($sql);
    }
}

function db_c_member_list4exists_rssAc_member_id($c_member_id, $limit)
{
    $sql = "SELECT c_member_id, rss FROM c_member" .
            " WHERE rss <> '' AND c_member_id > ?" .
            " ORDER BY c_member_id";
    $params = array(intval($c_member_id));
    return db_get_all_limit($sql, 0, $limit, $params);
}

function db_c_member_list4no_exists_rssAc_member_id($c_member_id_from, $c_member_id_to)
{
    $sql = "SELECT c_member_id, rss FROM c_member WHERE rss = ''";
    if (intval($c_member_id_from) > 0)
        $sql .= " AND c_member_id > " . intval($c_member_id_from);
    if (intval($c_member_id_to) > 0)
        $sql .= " AND c_member_id < " . intval($c_member_id_to);
    $sql .= " ORDER BY c_member_id";

    return db_get_all($sql);
}

function db_delete_rss_cache4c_member_list($c_member_list)
{
    $sql = "DELETE FROM c_rss_cache WHERE c_member_id IN (0";
    foreach ($c_member_list as $c_member) {
        _log('delete', $c_member['c_member_id']);
        $sql .= "," . intval($c_member['c_member_id']);
    }
    $sql .= ")";
    db_query($sql);
}

function _log($action, $message)
{
    if (RSS_CACHE_DISPLAY_LOG) {
        echo $action . ": " . $message . "<br>\n";
    }
}

?>
