<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */


/**
 * 監視モジュールへのアクセスを許可されたIPかどうかチェック
 *
 * @param string $ip_string
 * @return boolean
 */
function kanshi_check_access_ip($ip_string)
{
    $allow = false;
    foreach($GLOBALS['_ALLOWED_IP_LIST_FOR_KANSHI'] as $ip) {
        if(strcmp($ip_string, $ip) == 0) 
            $allow = true;
    }
    return $allow;
}

/**
 * 監視モジュールへのアクセスを許可されたIPをログに残す
 */
function kanshi_allow_ip_log($ip_string)
{
    $fp = fopen(OPENPNE_VAR_DIR. '/log/kanshi_allow_ip.log', 'a+t');
    fwrite($fp, '['.date("Y/m/d H:i:s").'] ' . $ip_string . "\n");
    fclose($fp);
}

/**
 * 監視モジュールへのアクセスを拒否されたIPをログに残す
 */
function kanshi_disallow_ip_log($ip_string)
{
    $fp = fopen(OPENPNE_VAR_DIR. '/log/kanshi_disallow_ip.log', 'a+t');
    fwrite($fp, '['.date("Y/m/d H:i:s").'] ' . $ip_string . "\n");
    fclose($fp);
}
 
/**
 * 日時を YYYY-MM-DD HH:MM:SS形式 に変換する
 * 
 * @param string $date_string
 * @return string YYYY-MM-DD HH:MM:SS
 */
function kanshi_get_date($date_string)
{
    return date('Y-m-d H:i:s', strtotime($date_string));
}

/**
 * 日記リストを取得
 */
function kanshi_get_diary_list($updated_from, $updated_to, $offset, $limit)
{
    $sql  = " SELECT
                cd.*,
                cd.c_diary_id as data_id,
                cd.subject as title,
                cd.body as content,
                cd.c_member_id as creator
            ";
    $sql .= " FROM c_diary cd";
    $sql .= " WHERE 1";

    $params = array();

    if(!empty($updated_from)) {
        $sql .= " AND (r_datetime > ? OR u_datetime > ?)";
        $params[] = $updated_from;
        $params[] = $updated_from;
    }
    if(!empty($updated_to)) {
        $sql .= " AND (r_datetime < ? OR u_datetime < ?)";
        $params[] = $updated_to;
        $params[] = $updated_to;
    }
    $sql .= " ORDER BY u_datetime";

    if(!empty($offset) || !empty($limit)){
        if(empty($offset)) $offset = 0;
        if(empty($limit))  $limit  = count(db_get_col($sql, $params)) - $offset;

        $diary_list = db_get_all_limit($sql, $offset, $limit, $params);
    }
    else{
        $diary_list = db_get_all($sql, $params);
    }

    if(count($diary_list) > 0) {
        foreach ($diary_list as $num => $diary) {
            $diary_list[$num]['c_member'] = db_member_c_member4c_member_id($diary['c_member_id'], true, true, 'private');
        }
    }

    return $diary_list;
}

/**
 * 日記コメントリストを取得
 */
function kanshi_get_diary_comment_list($updated_from, $updated_to, $offset, $limit)
{
    $sql  = " SELECT
                cdc.*,
                cdc.c_diary_comment_id as data_id,
                cdc.body as content,
                cdc.c_member_id as creator
            ";
    $sql .= " FROM c_diary_comment cdc";
    $sql .= " WHERE 1";

    $params = array();
    if(!empty($updated_from)) {
        $sql .= " AND r_datetime > ?";
        $params[] = $updated_from;
    }
    if(!empty($updated_to)) {
        $sql .= " AND r_datetime < ?";
        $params[] = $updated_to;
    }
    $sql .= " ORDER BY r_datetime";

    if(!empty($offset) || !empty($limit)){
        if(empty($offset)) $offset = 0;
        if(empty($limit))  $limit  = count(db_get_col($sql, $params)) - $offset;

        $diary_comment_list = db_get_all_limit($sql, $offset, $limit, $params);
    }
    else{
        $diary_comment_list = db_get_all($sql, $params);
    }

    if(count($diary_comment_list) > 0) {
        foreach ($diary_comment_list as $num => $diary_comment) {
            $diary_comment_list[$num]['c_member'] = db_member_c_member4c_member_id($diary_comment['c_member_id'], true, true, 'private');
        }
    }

    return $diary_comment_list;
}

/**
 * 掲示板・イベントリストを取得
 */
function kanshi_get_topic_event_list($updated_from, $updated_to, $offset, $limit)
{
    $sql  = " SELECT
                cct.*,
                cct.c_commu_topic_id as data_id,
                cct.name as title,
                cctc.body as content,
                cct.c_member_id as creator
            ";
    $sql .= " FROM c_commu_topic cct";
    $sql .= " INNER JOIN c_commu_topic_comment cctc ON cct.c_commu_topic_id = cctc.c_commu_topic_id";
    $sql .= " WHERE 1";

    $params = array();
    if(!empty($updated_from)) {
        $sql .= " AND cct.r_datetime > ?";
        $params[] = $updated_from;
    }
    if(!empty($updated_to)) {
        $sql .= " AND cct.r_datetime < ?";
        $params[] = $updated_to;
    }
    $sql .= " GROUP BY cct.c_commu_topic_id";
    $sql .= " ORDER BY cct.r_datetime";

    if(!empty($offset) || !empty($limit)){
        if(empty($offset)) $offset = 0;
        if(empty($limit))  $limit  = count(db_get_col($sql, $params)) - $offset;

        $topic_event_list = db_get_all_limit($sql, $offset, $limit, $params);
    }
    else{
        $topic_event_list = db_get_all($sql, $params);
    }

    if(count($topic_event_list) > 0) {
        foreach ($topic_event_list as $num => $topic_event) {
            $topic_event_list[$num]['c_member'] = db_member_c_member4c_member_id($topic_event['c_member_id'], true, true, 'private');
        }
    }

    return $topic_event_list;
}

/**
 * 掲示板・イベントコメントリストを取得
 */
function kanshi_get_topic_event_comment_list($updated_from, $updated_to, $offset, $limit)
{
    $sql  = " SELECT
                cctc.*,
                cctc.c_commu_topic_comment_id as data_id,
                cctc.body as content,
                cctc.c_member_id as creator
            ";
    $sql .= " FROM c_commu_topic_comment cctc";
    $sql .= " LEFT JOIN c_commu_topic cct ON cctc.c_commu_topic_id = cct.c_commu_topic_id";
    $sql .= " WHERE 1 AND cctc.number <> 0";

    $params = array();
    if(!empty($updated_from)) {
        $sql .= " AND cctc.r_datetime > ?";
        $params[] = $updated_from;
    }
    if(!empty($updated_to)) {
        $sql .= " AND cctc.r_datetime < ?";
        $params[] = $updated_to;
    }
    $sql .= " ORDER BY cctc.r_datetime";

    if(!empty($offset) || !empty($limit)){
        if(empty($offset)) $offset = 0;
        if(empty($limit))  $limit  = count(db_get_col($sql, $params)) - $offset;

        $topic_event_comment_list = db_get_all_limit($sql, $offset, $limit, $params);
    }
    else{
        $topic_event_comment_list = db_get_all($sql, $params);
    }

    if(count($topic_event_comment_list) > 0) {
        foreach ($topic_event_comment_list as $num => $topic_event_comment) {
            $topic_event_comment_list[$num]['c_member'] = db_member_c_member4c_member_id($topic_event_comment['c_member_id'], true, true, 'private');
        }
    }

    return $topic_event_comment_list;
}

/**
 * コミュニティリストを取得
 */
function kanshi_get_community_list($updated_from, $updated_to, $offset, $limit)
{
    $sql  = " SELECT
                cc.*,
                cc.c_commu_id as data_id,
                cc.name as title,
                cc.info as content,
                cc.c_member_id_admin as creator
            ";
    $sql .= " FROM c_commu cc";
    $sql .= " WHERE 1";

    $params = array();
    if(!empty($updated_from)) {
        $sql .= " AND r_datetime > ?";
        $params[] = $updated_from;
    }
    if(!empty($updated_to)) {
        $sql .= " AND r_datetime < ?";
        $params[] = $updated_to;
    }

    if(!empty($offset) || !empty($limit)){
        if(empty($offset)) $offset = 0;
        if(empty($limit))  $limit  = count(db_get_col($sql, $params)) - $offset;

        $community_list = db_get_all_limit($sql, $offset, $limit, $params);
    }
    else{
        $community_list = db_get_all($sql, $params);
    }

    if(count($community_list) > 0) {
        foreach ($community_list as $num => $community) {
            $community_list[$num]['c_member'] = db_member_c_member4c_member_id($community['c_member_id_admin'], true, true, 'private');
        }
    }

    return $community_list;
}

/**
 * 画像リスト取得
 */
function kanshi_get_image_list($updated_from, $updated_to, $offset, $limit)
{
    $sql  = " SELECT
                c_image_id as data_id,
                filename as title,
                r_datetime
            ";
    $sql .= " FROM c_image";
    $sql .= " WHERE 1"; 

    $params = array();
    if(!empty($updated_from)) {
        $sql .= " AND r_datetime > ?";
        $params[] = $updated_from;
    } 
    if(!empty($updated_to)) {
        $sql .= " AND r_datetime < ?";
        $params[] = $updated_to;
    }
    $sql .= " ORDER BY r_datetime";

    if(!empty($offset) || !empty($limit)){
        if(empty($offset)) $offset = 0;
        if(empty($limit))  $limit  = count(db_get_col($sql, $params)) - $offset;

        $c_image_list = db_get_all_limit($sql, $offset, $limit, $params);
    }
    else{
        $c_image_list = db_get_all($sql, $params);
    }

    if(count($c_image_list) > 0) {
        foreach ($c_image_list as $num => $c_image) {
            $c_image_list[$num]['image_url'] = OPENPNE_URL . 'img.php?filename=' . $c_image['title'];
            $temp = explode("_", $c_image['title']);

            switch ($temp[0]) {
                case 'm':   //メンバー画像
                    $c_image_list[$num]['creator']  = $temp[1];
                    $c_image_list[$num]['c_member'] = db_member_c_member4c_member_id($temp[1], true, true, 'private');

                    $c_image_list[$num]['refer_data_url'] = OPENPNE_URL . '&a=page_f_home&target_c_member_id='.$temp[1];
                break;
                case 'c':   //コミュニティ画像
                    $id = db_commu_c_commu4c_commu_id($temp[1]);
                    $c_image_list[$num]['creator']  = $id['c_member_id_admin'];
                    $c_image_list[$num]['c_member'] = db_member_c_member4c_member_id($id['c_member_id_admin'], true, true, 'private');
                    
                    $c_image_list[$num]['refer_watch_type_id'] = 3;
                    $c_image_list[$num]['refer_data_id']       = $temp[1];
                    $c_image_list[$num]['refer_data_url']      = OPENPNE_URL . '&a=page_c_home&target_c_commu_id='.$temp[1];
                break;
                case 'd':   //日記画像
                    $id = db_diary_get_c_diary4id($temp[1]);
                    $c_image_list[$num]['creator']  = $id['c_member_id'];
                    $c_image_list[$num]['c_member'] = db_member_c_member4c_member_id($id['c_member_id'], true, true, 'private');

                    $c_image_list[$num]['refer_watch_type_id'] = 1;
                    $c_image_list[$num]['refer_data_id']       = $temp[1];
                    $c_image_list[$num]['refer_data_url']      = OPENPNE_URL . '&a=page_fh_diary&target_c_diary_id='.$temp[1];
                break;
                case 'dc':  //日記コメント画像
                    $id = _do_c_diary_comment4c_diary_comment_id($temp[1]);
                    $c_image_list[$num]['creator']  = $id['c_member_id'];
                    $c_image_list[$num]['c_member'] = db_member_c_member4c_member_id($id['c_member_id'], true, true, 'private');

                    $c_image_list[$num]['refer_watch_type_id'] = 4;
                    $c_image_list[$num]['refer_data_id']       = $temp[1];
                    $c_image_list[$num]['refer_data_url']      = OPENPNE_URL . '&a=page_fh_diary&target_c_diary_id='.$id['c_diary_id'];
                break;
                case 't':   //トピック、イベント画像
                    $id = db_commu_c_topic4c_commu_topic_id($temp[1]);
                    $c_image_list[$num]['creator']  = $id['c_member_id'];
                    $c_image_list[$num]['c_member'] = db_member_c_member4c_member_id($id['c_member_id'], true, true, 'private');

                    $c_image_list[$num]['refer_watch_type_id'] = 2;
                    $c_image_list[$num]['refer_data_id']       = $temp[1];
                    $c_image_list[$num]['refer_data_url']      = OPENPNE_URL . '&a=page_c_topic_detail&target_c_commu_topic_id='.$temp[1];
                break;
                case 'tc':  //トピック、イベントコメント画像
                    $id = db_commu_c_commu_topic_comment4c_commu_topic_comment_id_2($temp[1]);
                    $c_image_list[$num]['creator']  = $id['c_member_id'];
                    $c_image_list[$num]['c_member'] = db_member_c_member4c_member_id($id['c_member_id'], true, true, 'private');

                    $c_image_list[$num]['refer_watch_type_id'] = 5;
                    $c_image_list[$num]['refer_data_id']       = $temp[1];
                    $c_image_list[$num]['param'] = '&a=page_c_topic_detail&target_c_commu_topic_id='.$id['c_commu_topic_id'];
                break;
            }
        }
    }

    return $c_image_list;
}

/**
 * 日記display更新（display=0のものを削除）
 */
function kanshi_update_diary4update_list($update_list)
{
    $result_list = array();
    foreach($update_list as $num => $data) {
        if(strcmp($data['display'], 0) == 0) {
            list($result, $error_code, $error_message) = kanshi_db_diary_delete_c_diary($data['c_diary_id']);
            $result_list[$num]['result']        = $result;
            $result_list[$num]['error_code']    = $error_code;
            $result_list[$num]['error_message'] = $error_message;
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
        else{
            $result_list[$num]['result']        = 1;
            $result_list[$num]['error_code']    = 0;
            $result_list[$num]['error_message'] = '';
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
    }
    return $result_list;
}

/**
 * 日記コメントdisplay更新（display=0のものを削除）
 */
function kanshi_update_diary_comment4update_list($update_list)
{
    $result_list = array();
    foreach($update_list as $num => $data) {
        if(strcmp($data['display'], 0) == 0) {
            list($result, $error_code, $error_message) = kanshi_db_diary_delete_c_diary_comment($data['c_diary_comment_id']);
            $result_list[$num]['result']        = $result;
            $result_list[$num]['error_code']    = $error_code;
            $result_list[$num]['error_message'] = $error_message;
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
        else{
            $result_list[$num]['result']        = 1;
            $result_list[$num]['error_code']    = 0;
            $result_list[$num]['error_message'] = '';
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
    }
    return $result_list;
}

/**
 * 掲示板・イベントdisplay更新（display=0のものを削除）
 */
function kanshi_update_topic_event4update_list($update_list)
{
    $result_list = array();
    foreach($update_list as $num => $data) {
        if(strcmp($data['display'], 0) == 0) {
            list($result, $error_code, $error_message) = kanshi_db_commu_delete_c_commu_topic($data['c_commu_topic_id']);
            $result_list[$num]['result']        = $result;
            $result_list[$num]['error_code']    = $error_code;
            $result_list[$num]['error_message'] = $error_message;
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
        else{
            $result_list[$num]['result']        = 1;
            $result_list[$num]['error_code']    = 0;
            $result_list[$num]['error_message'] = '';
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
    }
    return $result_list;
}

/**
 * 掲示板・イベントコメントdisplay更新（display=0のものを削除）
 */
function kanshi_update_topic_event_comment4update_list($update_list)
{
    $result_list = array();
    foreach($update_list as $num => $data) {
        if(strcmp($data['display'], 0) == 0) {
            list($result, $error_code, $error_message) = kanshi_db_commu_delete_c_commu_topic_comment($data['c_commu_topic_comment_id']);
            $result_list[$num]['result']        = $result;
            $result_list[$num]['error_code']    = $error_code;
            $result_list[$num]['error_message'] = $error_message;
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
        else{
            $result_list[$num]['result']        = 1;
            $result_list[$num]['error_code']    = 0;
            $result_list[$num]['error_message'] = '';
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
    }
    return $result_list;
}

/**
 * コミュニティdisplay更新（display=0のものを削除）
 */
function kanshi_update_community4update_list($update_list)
{
    $result_list = array();
    foreach($update_list as $num => $data) {
        if(strcmp($data['display'], 0) == 0) {
            list($result, $error_code, $error_message) = kanshi_db_common_delete_c_commu($data['c_commu_id']);
            $result_list[$num]['result']        = $result;
            $result_list[$num]['error_code']    = $error_code;
            $result_list[$num]['error_message'] = $error_message;
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
        else{
            $result_list[$num]['result']        = 1;
            $result_list[$num]['error_code']    = 0;
            $result_list[$num]['error_message'] = '';
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
    }
    return $result_list;
}

/**
 * 画像ファイルdisplay更新（display=0のものを削除）
 */
function kanshi_update_image4update_list($update_list)
{
    $result_list = array();
    foreach($update_list as $num => $data) {
        if(strcmp($data['display'], 0) == 0) {
            list($result, $error_code, $error_message) = kanshi_delete_c_image4c_image_id($data['c_image_id']);
            $result_list[$num]['result']        = $result;
            $result_list[$num]['error_code']    = $error_code;
            $result_list[$num]['error_message'] = $error_message;
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
        else{
            $result_list[$num]['result']        = 1;
            $result_list[$num]['error_code']    = 0;
            $result_list[$num]['error_message'] = '';
            $result_list[$num]['import_seq']    = $data['import_seq'];
        }
    }
    return $result_list;
}

/**
 * 日記削除
 * コメント、画像も削除
 * 
 * @param int $c_diary_id
 */
function kanshi_db_diary_delete_c_diary($c_diary_id)
{
    if($c_diary = db_diary_get_c_diary4id($c_diary_id)) {
        //function cacheの削除
        pne_cache_drop('db_diary_get_c_diary_list4c_member_id', $c_diary['c_member_id'], 5);

        // 画像
        image_data_delete($c_diary['image_filename_1']);
        image_data_delete($c_diary['image_filename_2']);
        image_data_delete($c_diary['image_filename_3']);

        // コメント
        $sql = 'SELECT image_filename_1, image_filename_2, image_filename_3 FROM c_diary_comment WHERE c_diary_id =?';
        $params = array(intval($c_diary_id));
        $comment_images = db_get_all($sql, $params);

        //カテゴリ
        db_diary_category_delete_c_diary_category_diary($c_diary_id);

        foreach ($comment_images as $value) {
            image_data_delete($value['image_filename_1']);
            image_data_delete($value['image_filename_2']);
            image_data_delete($value['image_filename_3']);
        }

        $sql = 'DELETE FROM c_diary_comment WHERE c_diary_id = ?';
        db_query($sql, $params);

        // 日記
        $sql = 'DELETE FROM c_diary WHERE c_diary_id = ?';
        if(db_query($sql, $params)) {
            return array(1, 0, '');
        }
        else{
            return array(0, 2, 'DB更新エラー');
        }
    }
    else{
//        return array(0, 99, '既に削除されているか存在しません');
        // 監視ツールがリトライを行ってしまう為、成功フラグを返してしまう
        return array(1, 0, '');
    }
}

/**
 * 日記コメント削除
 * 
 * @param   int $c_diary_comment_id
 * @param   int $u  : 削除しようとしている人の c_member_id
 */
function kanshi_db_diary_delete_c_diary_comment($c_diary_comment_id)
{
    if($dc = _do_c_diary_comment4c_diary_comment_id($c_diary_comment_id)) {

        image_data_delete($dc['image_filename_1']);
        image_data_delete($dc['image_filename_2']);
        image_data_delete($dc['image_filename_3']);

        $sql = 'DELETE FROM c_diary_comment WHERE c_diary_comment_id = ?';
        $params = array(intval($c_diary_comment_id));
        if(db_query($sql, $params)) {
            return array(1, 0, '');
        }
        else{
            return array(0, 2, 'DB更新エラー');
        }
    }
    else{
//        return array(0, 99, '既に削除されているか存在しません');
        // 監視ツールがリトライを行ってしまう為、成功フラグを返してしまう
        return array(1, 0, '');
    }
}

/**
 * トピック削除
 */
function kanshi_db_commu_delete_c_commu_topic($c_commu_topic_id)
{
    if(db_commu_c_commu_topic4c_commu_topic_id($c_commu_topic_id)) {
        //function cacheの削除
        cache_drop_c_commu_topic($c_commu_topic_id);

        // c_commu_topic_comment(画像)
        $sql = 'SELECT image_filename1, image_filename2, image_filename3, filename' .
                ' FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
        $params = array(intval($c_commu_topic_id));

        $topic_comment_list = db_get_all($sql, $params);
        foreach ($topic_comment_list as $topic_comment) {
            image_data_delete($topic_comment['image_filename1']);
            image_data_delete($topic_comment['image_filename2']);
            image_data_delete($topic_comment['image_filename3']);
            db_file_delete_c_file($topic_comment['filename']);
        }

        $sql = 'DELETE FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
        db_query($sql, $params);

        $sql = 'DELETE FROM c_event_member WHERE c_commu_topic_id = ?';
        db_query($sql, $params);

        $sql = 'DELETE FROM c_commu_topic WHERE c_commu_topic_id = ?';
        if(db_query($sql, $params)) {
            return array(1, 0, '');
        }
        else{
            return array(0, 2, 'DB更新エラー');
        }
    }
    else{
//        return array(0, 99, '既に削除されているか存在しません');
        // 監視ツールがリトライを行ってしまう為、成功フラグを返してしまう
        return array(1, 0, '');
    }
}

/**
 * トピックコメント削除
 */
function kanshi_db_commu_delete_c_commu_topic_comment($c_commu_topic_comment_id)
{
    if(db_commu_c_commu_topic_comment4c_commu_topic_comment_id($c_commu_topic_comment_id)) {
        $sql = 'SELECT image_filename1, image_filename2, image_filename3' .
            ' FROM c_commu_topic_comment' .
            ' WHERE c_commu_topic_comment_id = ?';
        $params = array(intval($c_commu_topic_comment_id));
        $topic_comment = db_get_row($sql, $params);
        image_data_delete($topic_comment['image_filename1']);
        image_data_delete($topic_comment['image_filename2']);
        image_data_delete($topic_comment['image_filename3']);

        $sql = 'DELETE FROM c_commu_topic_comment WHERE c_commu_topic_comment_id = ?';
        if(db_query($sql, $params)){
            return array(1, 0, '');
        }
        else{
            return array(0, 2, 'DB更新エラー');
        }
    }
    else{
//        return array(0, 99, '既に削除されているか存在しません');
        // 監視ツールがリトライを行ってしまう為、成功フラグを返してしまう
        return array(1, 0, '');
    }
}

/**
 * コミュニティ削除
 * 関連情報を合わせて削除する
 * 
 * @param int $c_commu_id
 */
function kanshi_db_common_delete_c_commu($c_commu_id)
{
    if(db_commu_c_commu4c_commu_id($c_commu_id)) {
        //function cacheの削除
        cache_drop_c_commu($c_commu_id);

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
            $sql = 'SELECT image_filename1, image_filename2, image_filename3, filename' .
                ' FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
            $params = array(intval($topic['c_commu_topic_id']));
            $topic_comment_list = db_get_all($sql, $params);
            foreach ($topic_comment_list as $topic_comment) {
                image_data_delete($topic_comment['image_filename1']);
                image_data_delete($topic_comment['image_filename2']);
                image_data_delete($topic_comment['image_filename3']);
                db_file_delete_c_file($topic_comment['filename']);
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
        if(db_query($sql, $single)) {
            return array(1, 0, '');
        }
        else{
            return array(0, 2, 'DB更新エラー');
        }
    }
    else{
//        return array(0, 99, '既に削除されているか存在しません');
        // 監視ツールがリトライを行ってしまう為、成功フラグを返してしまう
        return array(1, 0, '');
    }
}

/**
 * 画像ファイル削除
 */
function  kanshi_delete_c_image4c_image_id($c_image_id)
{
    if($c_image = db_image_c_image4c_image_id($c_image_id)) {
        if (strpos($c_image['filename'], 'skin_') === 0 || strpos($c_image['filename'], 'no_') === 0) {
            return array(0, 99, 'この画像は削除できません');
        }
        kanshi_db_admin_delete_c_image_link4image_filename($c_image['filename']);
        image_data_delete($c_image['filename']);
        return array(1, 0, '');
    }
    else{
//        return array(0, 99, '既に削除されているか存在しません');
        // 監視ツールがリトライを行ってしまう為、成功フラグを返してしまう
        return array(1, 0, '');
    }
}


function kanshi_db_admin_delete_c_image_link4image_filename($image_filename)
{
    $_pos = strpos($image_filename, '_');
    $prefix = substr($image_filename, 0, $_pos);

    if ($prefix == 'b') {
        $sql = 'DELETE FROM c_banner WHERE image_filename = ?';
        $params = array($image_filename);
        db_query($sql, $params);
    }

    if ($prefix == 'c') {
        $tbl = 'c_commu';
        kanshi_db_admin_empty_image_filename($tbl, $image_filename);
    }

    if ($prefix == 't' || $prefix == 'tc') {
        $tbl = 'c_commu_topic_comment';
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename1');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename2');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename3');
    }

    if ($prefix == 'd') {
        $tbl = 'c_diary';
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_1');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_2');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_3');
    }

    if ($prefix == 'dc') {
        $tbl = 'c_diary_comment';
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_1');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_2');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_3');
    }

    if ($prefix == 'm') {
        $tbl = 'c_member';
        kanshi_db_admin_empty_image_filename($tbl, $image_filename);
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_1');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_2');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_3');
    }

    if ($prefix == 'ms') {
        $tbl = 'c_message';
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_1');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_2');
        kanshi_db_admin_empty_image_filename($tbl, $image_filename, 'image_filename_3');
    }
}

function kanshi_db_admin_empty_image_filename($tbl, $image_filename, $column = 'image_filename')
{
    $data = array(
        db_escapeIdentifier($column) => '',
    );
    $where = array(
        db_escapeIdentifier($column) => $image_filename,
    );

    db_update(db_escapeIdentifier($tbl), $data, $where);
}
?>

