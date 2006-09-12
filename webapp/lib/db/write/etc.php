<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//--- 退会

/**
 * SNSメンバー退会
 * 
 * @param int $c_member_id
 */
function db_common_delete_c_member($c_member_id)
{
    //// --- 双方向パターン
    $double = array(intval($c_member_id), intval($c_member_id));

    // c_access_block
    $sql = 'DELETE FROM c_access_block WHERE c_member_id = ? OR c_member_id_block = ?';
    db_query($sql, $double);

    // c_bookmark
    $sql = 'DELETE FROM c_bookmark WHERE c_member_id_from = ? OR c_member_id_to = ?';
    db_query($sql, $double);

    // c_friend
    $sql = 'DELETE FROM c_friend WHERE c_member_id_from = ? OR c_member_id_to = ?';
    db_query($sql, $double);

    // c_friend_confirm
    $sql = 'DELETE FROM c_friend_confirm WHERE c_member_id_from = ? OR c_member_id_to = ?';
    db_query($sql, $double);


    //// --- 単一パターン
    $single = array(intval($c_member_id));

    // c_ktai_address_pre
    $sql = 'DELETE FROM c_ktai_address_pre WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_member_ktai_pre
    $sql = 'DELETE FROM c_member_ktai_pre WHERE c_member_id_invite = ?';
    db_query($sql, $single);

    // c_pc_address_pre
    $sql = 'DELETE FROM c_pc_address_pre WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_review_clip
    $sql = 'DELETE FROM c_review_clip WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_review_comment
    $sql = 'DELETE FROM c_review_comment WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_rss_cache
    $sql = 'DELETE FROM c_rss_cache WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_schedule
    $sql = 'DELETE FROM c_schedule WHERE c_member_id = ?';
    db_query($sql, $single);


    //// --- 特殊パターン

    ///コミュニティ関連
    // c_commu_member
    $sql = 'DELETE FROM c_commu_member WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_commu (画像)
    $sql = 'SELECT * FROM c_commu WHERE c_member_id_admin = ?';
    $c_commu_list = db_get_all($sql, $single);

    foreach ($c_commu_list as $c_commu) {
        if (!_db_count_c_commu_member_list4c_commu_id($c_commu['c_commu_id'])) {
            // コミュニティ削除
            db_common_delete_c_commu($c_commu['c_commu_id']);
        } else {
            // 管理者交代
            // 参加日時が一番古い人
            $sql = 'SELECT c_member_id FROM c_commu_member WHERE c_commu_id = ?'.
                ' ORDER BY r_datetime';
            $params = array(intval($c_commu['c_commu_id']));
            $new_admin_id = db_get_one($sql, $params);

            $data = array('c_member_id_admin' => intval($new_admin_id));
            $where = array('c_commu_id' => intval($c_commu['c_commu_id']));
            db_update('c_commu', $data, $where);
        }
    }

    // c_commu_admin_confirm
    $sql = 'DELETE FROM c_commu_admin_confirm WHERE c_member_id_to = ?';
    db_query($sql, $single);

    // c_commu_member_confirm
    $sql = 'DELETE FROM c_commu_member_confirm WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_commu_review
    $sql = 'DELETE FROM c_commu_review WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_event_member
    $sql = 'DELETE FROM c_event_member WHERE c_member_id = ?';
    db_query($sql, $single);


    ///日記関連
    // c_diary (画像)
    $sql = 'SELECT * FROM c_diary WHERE c_member_id = ?';
    $c_diary_list = db_get_all($sql, $single);
    foreach ($c_diary_list as $c_diary) {
        image_data_delete($c_diary['image_filename_1']);
        image_data_delete($c_diary['image_filename_2']);
        image_data_delete($c_diary['image_filename_3']);

        // c_diary_comment
        $sql = 'SELECT * FROM c_diary_comment WHERE c_diary_id = ?';
        $params = array(intval($c_diary['c_diary_id']));
        $c_diary_comment_list = db_get_all($sql, $params);
        foreach ($c_diary_comment_list as $c_diary_comment) {
            image_data_delete($c_diary_comment['image_filename_1']);
            image_data_delete($c_diary_comment['image_filename_2']);
            image_data_delete($c_diary_comment['image_filename_3']);
        }

        $sql = 'DELETE FROM c_diary_comment WHERE c_diary_id = ?';
        db_query($sql, $params);
    }
    $sql = 'DELETE FROM c_diary WHERE c_member_id = ?';
    db_query($sql, $single);


    ///メンバー関連
    // c_member_pre
    $sql = 'SELECT * FROM c_member_pre WHERE c_member_id_invite = ?';
    $c_member_pre_list = db_get_all($sql, $single);
    foreach ($c_member_pre_list as $c_member_pre) {
        // c_member_pre_profile
        $sql = 'DELETE FROM c_member_pre_profile WHERE c_member_pre_id = ?';
        $params = array(intval($c_member_pre['c_member_pre_id']));
        db_query($sql, $params);
    }
    $sql = 'DELETE FROM c_member_pre WHERE c_member_id_invite = ?';
    db_query($sql, $single);

    // c_member_profile
    $sql = 'DELETE FROM c_member_profile WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_member_secure
    $sql = 'DELETE FROM c_member_secure WHERE c_member_id = ?';
    db_query($sql, $single);

    // c_member (画像)
    $sql = 'SELECT image_filename_1, image_filename_2, image_filename_3' .
        ' FROM c_member WHERE c_member_id = ?';
    $c_member = db_get_row($sql, $single);
    image_data_delete($c_member['image_filename_1']);
    image_data_delete($c_member['image_filename_2']);
    image_data_delete($c_member['image_filename_3']);

    $sql = 'DELETE FROM c_member WHERE c_member_id = ?';
    db_query($sql, $single);
}

/**
 * コミュニティ削除
 * 関連情報を合わせて削除する
 * 
 * @param int $c_commu_id
 */
function db_common_delete_c_commu($c_commu_id)
{
    $single = array(intval($c_commu_id));

    $sql = 'SELECT * FROM c_commu WHERE c_commu_id = ?';
    $c_commu = db_get_row($sql, $single);

    // 画像削除
    image_data_delete($c_commu['image_filename']);

    // c_commu_admin_confirm
    $sql = 'DELETE FROM c_commu_admin_confirm WHERE c_commu_id = ?';
    db_query($sql, $single);

    // c_commu_member
    $sql = 'DELETE FROM c_commu_member WHERE c_commu_id = ?';
    db_query($sql, $single);

    // c_commu_member_confirm
    $sql = 'DELETE FROM c_commu_member_confirm WHERE c_commu_id = ?';
    db_query($sql, $single);

    // c_commu_review
    $sql = 'DELETE FROM c_commu_review WHERE c_commu_id = ?';
    db_query($sql, $single);

    ///トピック関連
    $sql = 'SELECT * FROM c_commu_topic WHERE c_commu_id = ?';
    $topic_list = db_get_all($sql, $single);

    foreach ($topic_list as $topic) {
        // c_commu_topic_comment(画像)
        $sql = 'SELECT image_filename1, image_filename2, image_filename3' .
            ' FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
        $params = array(intval($topic['c_commu_topic_id']));
        $topic_comment_list = db_get_all($sql, $params);
        foreach ($topic_comment_list as $topic_comment) {
            image_data_delete($topic_comment['image_filename1']);
            image_data_delete($topic_comment['image_filename2']);
            image_data_delete($topic_comment['image_filename3']);
        }
        $sql = 'DELETE FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
        db_query($sql, $params);

        // c_event_member
        $sql = 'DELETE FROM c_event_member WHERE c_commu_topic_id = ?';
        db_query($sql, $params);
    }

    // c_commu_topic
    $sql = 'DELETE FROM c_commu_topic WHERE c_commu_id = ?';
    db_query($sql, $single);

    // c_commu
    $sql = 'DELETE FROM c_commu WHERE c_commu_id = ?';
    db_query($sql, $single);
}

//--- ログ

/**
 * バナーのクリックログを追加
 */
function db_banner_insert_c_banner_log($c_banner_id, $c_member_id, $clicked_from)
{
    $data = array(
        'c_banner_id' => intval($c_banner_id),
        'c_member_id' => intval($c_member_id),
        'clicked_from' => $clicked_from,
        'r_datetime' => db_now(),
        'r_date' => db_now(),
    );
    return db_insert('c_banner_log', $data);
}

/**
 * 検索ログを追加
 */
function do_common_insert_search_log($c_member_id, $searchword)
{
    if (!$searchword) return false;

    $data = array(
        'c_member_id' => intval($c_member_id),
        'searchword'  => $searchword,
        'r_datetime'  => db_now(),
    );
    return db_insert('c_searchlog', $data);
}

function p_access_log($c_member_id, $page_name, $ktai_flag = "0")
{
    if (!$page_name) return false;

    $data = array(
        'c_member_id'             => intval($c_member_id),
        'page_name'               => $page_name,
        'target_c_member_id'      => '',
        'target_c_commu_id'       => '',
        'target_c_commu_topic_id' => '',
        'target_c_diary_id'       => '',
        'ktai_flag'               => (bool)$ktai_flag,
        'r_datetime' => db_now(),
    );

    $target_ids = array(
        'target_c_member_id',
        'target_c_commu_id',
        'target_c_commu_topic_id',
        'target_c_diary_id',
    );
    foreach ($target_ids as $key) {
        if (isset($_REQUEST[$key])) {
            $data[$key] = intval($_REQUEST[$key]);
        }
    }

    db_insert('c_access_log', $data);
}

/**
 * スキン画像のfilenameを登録
 */
function db_replace_c_skin_filename($skinname, $filename)
{
    db_delete_c_skin_filename($skinname);

    $data = array(
        'skinname' => strval($skinname),
        'filename' => strval($filename),
    );
    return db_insert('c_skin_filename', $data);
}

/**
 * スキン画像を削除(デフォルトに戻す)
 */
function db_delete_c_skin_filename($skinname)
{
    $sql = 'SELECT * FROM c_skin_filename WHERE skinname = ?';
    $params = array(strval($skinname));
    if ($skin_filename = db_get_row($sql, $params)) {
        image_data_delete($skin_filename['filename']);
        $sql = 'DELETE FROM c_skin_filename WHERE skinname = ?';
        return db_query($sql, $params);
    } else {
        return false;
    }
}

//---

/**
 * DBテンプレートを削除
 */
function db_delete_c_template($name)
{
    $sql = 'DELETE FROM c_template WHERE name = ?';
    $params = array(strval($name));
    return db_query($sql, $params);
}

/**
 * DBテンプレートを登録
 */
function db_replace_c_template($name, $source)
{
    db_delete_c_template($name);

    $data = array(
        'name' => strval($name),
        'source' => strval($source),
        'r_datetime' => db_now(),
    );
    return db_insert('c_template', $data);
}

/**
 * ナビゲーション項目を削除
 */
function db_delete_c_navi($navi_type, $sort_order)
{
    $sql = 'DELETE FROM c_navi WHERE navi_type = ? AND sort_order = ?';
    $params = array(strval($navi_type), intval($sort_order));
    return db_query($sql, $params);
}

/**
 * ナビゲーション項目を登録
 */
function db_replace_c_navi($navi_type, $sort_order, $url, $caption)
{
    db_delete_c_navi($navi_type, $sort_order);

    $data = array(
        'navi_type' => strval($navi_type),
        'sort_order' => intval($sort_order),
        'url' => strval($url),
        'caption' => strval($caption),
    );
    return db_insert('c_navi', $data);
}

?>
