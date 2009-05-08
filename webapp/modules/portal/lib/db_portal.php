<?php

/**
 * portal拡張機能DBアクセス関数
 */

/**
 * portal_layoutを更新します。
 */
function db_portal_update_portal_layout($content_name, $position)
{
    $where = array('content_name'=>$content_name);
    $data = array('position'=>$position);
    return db_update('portal_layout', $data, $where);
}

/**
 * portal_layoutを登録します。
 */
function db_portal_insert_portal_layout($content_name, $position, $is_image = 0)
{
    $data = array(
        'content_name' => $content_name,
        'position' => $position,
        'is_image' => (bool)$is_image,
    );
    return db_insert('portal_layout', $data);
}

/**
 * 携帯版コンテンツ設定を登録する
 *
 * @param string $content_name
 * @param int $position
 * @return int
 */
function db_portal_insert_portal_layout_ktai($content_name, $position)
{
    $data = array(
        'content_name' => $content_name,
        'position' => $position,
    );
    return db_insert('portal_layout_ktai', $data);
}

/**
 * portal_layoutを削除します。
 */
function db_portal_delete_portal_layout($content_name)
{
    $sql = 'delete from portal_layout where content_name = ?';
    $params = array($content_name);
    db_query($sql, $params);
}

/**
 * portal_layoutを取得します。
 */
function db_portal_layout_content_name($content_name)
{
    $sql = 'select * from portal_layout where content_name = ?';
    $params = array($content_name);
    return db_get_row($sql, $params);
}

/**
 * portal_layoutを取得します。
 */
function db_portal_layout()
{
    $sql = 'select * from portal_layout';
    return db_get_all($sql);
}

/**
 * 携帯版コンテンツ設定を取得する
 *
 * @return array
 */
function db_portal_layout_ktai()
{
    $sql = 'select * from portal_layout_ktai';
    return db_get_all($sql);
}

/**
 * 携帯版コンテンツ設定を設定されている並び順どおりに取得する
 *
 * @return array
 */
function db_portal_layout_ktai_order_by_position()
{
    $sql = 'SELECT * FROM portal_layout_ktai ORDER BY position';
    return db_get_all($sql);
}

/**
 * portal_layoutを取得します。
 */
function db_portal_layout_order_by_position()
{
    $sql = 'select * from portal_layout order by position';
    return db_get_all($sql);
}

/**
 * portal_layoutを全削除します。
 */
function db_portal_truncate_portal_layout()
{
    $sql = 'truncate table portal_layout';
    db_query($sql);
}

/**
 * 携帯版コンテンツ設定を空にする
 */
function db_portal_truncate_portal_layout_ktai()
{
    $sql = 'truncate table portal_layout_ktai';
    db_query($sql);
}

/**
 * nameからportal_configテーブルを取得します。
 */
function db_portal_config($portal_config_name)
{
    $sql = 'select * from portal_config where name = ?';
    $params = array($portal_config_name);
    return db_get_row($sql, $params);
}

/**
 * portal_configを更新します。
 */
function db_portal_update_portal_config($name, $value)
{
    $where = array('name'=>$name);
    $data = array('value'=>$value);
    return db_update('portal_config', $data, $where);
}

/**
 * portal_configを登録します。
 */
function db_portal_insert_portal_config($name, $value)
{
    $data = array('name'=>$name, 'value'=>$value);
    return db_insert('portal_config', $data);
}

/**
 * portal_free_areaテーブル関連
 */
function db_portal_portal_free_area($portal_free_area_id = null)
{
    if (!is_null($portal_free_area_id)) {
        $sql = 'select * from portal_free_area where portal_free_area_id = ?';
        $params = array(intval($portal_free_area_id));
        return db_get_row($sql, $params);
    } else {
        $sql = 'select * from portal_free_area';
        $list = db_get_all($sql);
        $result = array();
        foreach ($list as $value) {
            $result[$value['portal_free_area_id']] = $value;
        }
        return $result;
    }
}

function db_portal_update_portal_free_area($data)
{
    $where = array('portal_free_area_id'=>intval($data['portal_free_area_id']));
    return db_update('portal_free_area', $data, $where);
}

function db_portal_insert_portal_free_area($data)
{
    return db_insert('portal_free_area', $data);
}

/**
 * 携帯版フリーエリアを取得する
 *
 * $portal_free_area_ktai_id を指定しない場合は、すべての携帯版フリーエリアを取得する。
 *
 * @param int $portal_free_area_ktai_id
 */
function db_portal_portal_free_area_ktai($portal_free_area_ktai_id = null)
{
    if (!is_null($portal_free_area_ktai_id)) {
        $sql = 'select * from portal_free_area_ktai where portal_free_area_ktai_id = ?';
        $params = array(intval($portal_free_area_ktai_id));
        return db_get_row($sql, $params);
    } else {
        $sql = 'select * from portal_free_area_ktai';
        $list = db_get_all($sql);
        $result = array();
        foreach ($list as $value) {
            $result[$value['portal_free_area_ktai_id']] = $value;
        }
        return $result;
    }
}

/**
 * 携帯版フリーエリアを更新する
 *
 * $portal_free_area_ktai_id を指定しない場合は、新規にインサートする。
 *
 * @param int $portal_free_area_ktai_id
 * @param array $params
 */
function db_portal_update_portal_free_area_ktai($portal_free_area_ktai_id = null, $params = array())
{
    if (is_null($portal_free_area_ktai_id)) {
        return db_insert('portal_free_area_ktai', $params);
    } else {
        $where = array('portal_free_area_ktai_id' => intval($portal_free_area_ktai_id));
        return db_update('portal_free_area_ktai', $params, $where);
    }
}

/**
 * portal_rssテーブル関連
 */
function db_portal_portal_rss($portal_rss_id = null)
{
    if (!is_null($portal_rss_id)) {
        $sql = 'select * from portal_rss where portal_rss_id = ?';
        $params = array(intval($portal_rss_id));
        return db_get_row($sql, $params);
    } else {
        $sql = 'select * from portal_rss';
        $list = db_get_all($sql);
        $result = array();
        foreach ($list as $value) {
            $result[$value['portal_rss_id']] = $value;
        }
        return $result;
    }
}

function db_portal_update_portal_rss($data)
{
    $where = array('portal_rss_id'=>intval($data['portal_rss_id']));
    return db_update('portal_rss', $data, $where);
}

function db_portal_insert_portal_rss($data)
{
    return db_insert('portal_rss', $data);
}

function db_portal_c_commu_event($today, $from, $count)
{
    $sql = 'select cc.name as community_name, cct.name as event_name, cct.open_date as open_date from c_commu cc, c_commu_topic cct where cc.c_commu_id = cct.c_commu_id and cct.event_flag = ? and cct.open_date > ? and is_open <> ?  order by cct.open_date';
    $params = array('1', $today, 'member');
    return db_get_all_limit($sql, $from, $count, $params);
}

function db_portal_public_c_commmu_list($limit = 5)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(7200, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $select = "SELECT ct.*, c.name as commu_name, c.image_filename as image_filename";
    $from = " FROM c_commu_topic as ct"
          . " LEFT JOIN c_commu as c ON c.c_commu_id = ct.c_commu_id";
    $where = " WHERE c.is_open <> 'member'";
    $order = " ORDER BY ct.u_datetime DESC";

    $sql = $select . $from . $where . $order;

    $list = db_get_all_limit($sql, 0, $limit);
    foreach ($list as $key => $value) {
        $list[$key]['count_comments'] = db_portal_db_count_c_commu_topic_comments4c_commu_topic_id($value['c_commu_topic_id']);
    }
    return $list;
}

function db_portal_db_count_c_commu_topic_comments4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT count(*) FROM c_commu_topic_comment" .
        " WHERE c_commu_topic_id = ? AND number > 0";
    $params = array($c_commu_topic_id);
    return db_get_one($sql, $params);
}

/**
 * リンク集設定を取得する
 *
 * @param int $limit
 */
function db_portal_get_portal_link($limit = 10)
{
    $sql = 'SELECT * FROM portal_link ORDER BY sort_order, portal_link_id ';
    return db_get_all_limit($sql, 0, $limit);
}

/**
 * リンク集設定を更新する
 *
 * target_portal_link_id が指定されていない場合は新規にインサートする
 * target_portal_linK_id が指定されていて、リンクタイトルとURLが指定されていない場合は削除する
 *
 * @param int $target_portal_link_id
 * @param array $params
 */
function db_portal_update_portal_link($target_portal_link_id = null, $params = array())
{
    if (!$target_portal_link_id) {
        return db_insert('portal_link', $params);
    } elseif ($params['title'] && $params['url']) {
        return db_update('portal_link', $params, array('portal_link_id' => (int)$target_portal_link_id));
    } else {
        $sql = 'DELETE FROM portal_link WHERE portal_link_id = ?';
        return db_query($sql, array((int)$target_portal_link_id));
    }
}

/**
 * ポータル用画像ファイル名を登録する
 *
 * @param string $image_filename
 * @return int
 */
function db_portal_insert_portal_image($image_filename)
{
    return db_insert('portal_image', array('image_filename' => $image_filename));
}

/**
 * ポータル用画像ファイルリストを取得する
 *
 * @param int $page
 * @param int $page_size
 * @param array $pager
 */
function db_portal_image_list($page, $page_size, &$pager)
{
    $sql = 'SELECT portal_image_id FROM portal_image ORDER BY portal_image_id DESC';
    $id_list = db_get_col_page($sql, $page, $page_size);

    $portal_image_list = array();
    foreach ($id_list as $portal_image_id) {
        $sql = 'SELECT pi.portal_image_id AS portal_image_id, pi.image_filename AS image_filename, ci.r_datetime AS r_datetime'
            . ' FROM portal_image AS pi LEFT JOIN c_image AS ci ON pi.image_filename = ci.filename'
            . ' WHERE pi.portal_image_id = ?';
        $params = array(intval($portal_image_id));
        $portal_image_list[] = db_get_row($sql, $params);
    }

    $sql = 'SELECT COUNT(*) FROM portal_image';
    $total_num = db_get_one($sql);

    $pager = util_make_pager($page, $page_size, $total_num);
    return $portal_image_list;
}

/**
 * ポータル用画像ファイルを削除する
 *
 * @param string $filename
 */
function db_portal_delete_portal_image($filename)
{
    $sql = 'DELETE FROM portal_image WHERE image_filename = ?';
    $params = array($filename);
    return db_query($sql, $params);
}

/**
 * ポータル用画像ファイルを取得する
 *
 * @param string $filename
 */
function db_portal_imaage4filename($filename)
{
    $params = array($filename);

    $sql = 'SELECT image_filename FROM portal_image WHERE image_filename = ?';
    if (!db_get_one($sql, $params)) {
        return false;
    }

    $sql = 'SELECT filename FROM c_image WHERE filename = ?';
    return db_get_one($sql, $params);
}

?>
