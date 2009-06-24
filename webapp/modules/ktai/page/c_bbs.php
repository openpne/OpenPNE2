<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_bbs extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $target_response_comment_id = $requests['target_response_comment_id'];
        $page = $requests['page'];
        // ----------

        $page_size = 5;

        // トピックのコメントリスト
        if ($requests['order'] === 'asc') {
            $desc = false;
        } else {
            $desc = true;
        }

        list($list, $pager) = db_commu_c_topic_write4c_commu_topic_id($c_commu_topic_id, $page, $page_size, $desc);
        foreach ($list as $key => $value) {
            if ($value['filename']) {
                $list[$key]['original_filename'] = db_file_original_filename4filename($value['filename']);
            }
        }

        $this->set('c_commu_topic_comment_list', $list);
        $this->set('pager', $pager);

        //トピック名
        $this->set('c_commu_topic_name', db_commu_c_commu_topic_name4c_commu_topic_id($c_commu_topic_id));
        //トピックID
        $this->set('c_commu_topic_id', $c_commu_topic_id);
        //トピック
        $c_commu_topic = db_commu_c_topic4c_commu_topic_id_2($c_commu_topic_id);
        $c_commu_topic['original_filename'] = db_file_original_filename4filename($c_commu_topic['filename']);
        $this->set('c_commu_topic', $c_commu_topic);

        //コミュニティ
        $c_commu = db_commu_c_commu4c_commu_topic_id($c_commu_topic_id);
        $c_commu_id = $c_commu['c_commu_id'];
        $c_commu = db_commu_c_commu4c_commu_id($c_commu_id);
        $this->set('c_commu', $c_commu);

        //--- 権限チェック
        //コミュニティの存在の有無
        if (!$c_commu) {
            handle_kengen_error();
        }

        //コミュニティ掲示板閲覧権限
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }

        if ($target_response_comment_id) {
            $target_comment = db_commu_c_commu_topic_comment4c_commu_topic_comment_id($target_response_comment_id);
            $response_set = db_member_c_member4c_member_id_LIGHT($target_comment['c_member_id']);
            $this->set(
                'response_comment_format',
                '>>' . $target_comment['number'] . ' ' . $response_set['nickname'] . "さん\n"
            );
        }

        //掲示板の閲覧権限 tplでやっている
        $this->set('is_c_commu_view', db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu['c_commu_id'], $u));
        $this->set('is_c_commu_member', db_commu_is_c_commu_member($c_commu['c_commu_id'], $u));
        $this->set('is_c_event_member', db_commu_is_c_event_member($c_commu_topic_id, $u));
        $this->set('is_c_event_admin', db_commu_is_c_event_admin($c_commu_topic_id, $u));
        $this->set('is_event_join_date', db_commu_is_event_join_date($c_commu_topic_id));
        $this->set('is_event_join_capacity', db_commu_is_event_join_capacity($c_commu_topic_id));
        $this->set('is_writable_comment', db_commu_is_writable_c_commu_topic_comment4c_commu_topic_id($c_commu_topic_id));

        //メンバーがコミュニティ管理者かどうか
        $this->set('is_admin', db_commu_is_admin4c_member_id_c_commu_topic_id($u, $c_commu_topic_id));
        //コミュニティ管理者
        $this->set('c_member_admin', db_commu_c_member_admin4c_commu_topic_id($c_commu_topic_id));

        if (MAIL_ADDRESS_HASHED) {
            $mail_address = "t{$c_commu_topic_id}-".t_get_user_hash($u).'@'.MAIL_SERVER_DOMAIN;
        } else {
            $mail_address = "t{$c_commu_topic_id}".'@'.MAIL_SERVER_DOMAIN;
        }
        $mail_address = MAIL_ADDRESS_PREFIX . $mail_address;
        $this->set('mail_address', $mail_address);

        return 'success';
    }
}

?>
