<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_insert_c_rss_cache($c_member_id, $subject, $body, $date, $link)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'subject'     => $subject,
        'body'        => $body,
        'r_datetime'  => $date,
        'link'        => $link,
        'cache_date'  => db_now(),
    );
    return db_insert('c_rss_cache', $data);
}

function db_update_c_rss_cache($c_rss_cache_id, $subject, $body, $date, $link)
{
    $data = array(
        'subject'     => $subject,
        'body'        => $body,
        'r_datetime'  => $date,
        'link'        => $link,
        'cache_date'  => db_now(),
    );
    $where = 'c_rss_cache_id = '.intval($c_rss_cache_id);
    return db_update('c_rss_cache', $data, $where);
}

/**
 * メンバーのRSSを削除する
 */
function delete_rss_cache($c_member_id)
{
    $sql = 'DELETE FROM c_rss_cache WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_query($sql, $params);
}

function insert_rss_cache($rss_url, $c_member_id)
{
    include_once 'OpenPNE/RSS.php';
    $rss = new OpenPNE_RSS();
    if (!$items = $rss->fetch($rss_url)) {
        return false;
    }

    foreach ($items as $item) {
        // 最新のものと比較
        if (!db_is_duplicated_rss_cache($c_member_id, $item['date'], $item['link']) &&
            !db_is_future_rss_item($item['date'])) {

            if ($id = db_is_updated_rss_cache($c_member_id, $item['link'])) {
                // update
                db_update_c_rss_cache($id,
                    $item['title'], $item['body'], $item['date'], $item['link']);
            } else {
                // insert
                db_insert_c_rss_cache($c_member_id,
                    $item['title'], $item['body'], $item['date'], $item['link']);
            }
        }
    }
}

?>
