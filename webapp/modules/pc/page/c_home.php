<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_home extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $c_commu_id = $requests['target_c_commu_id'];

        $c_commu = db_commu_c_commu4c_commu_id2($c_commu_id);
        //コミュニティの存在の有無
        if (!$c_commu) {
            openpne_redirect('pc', 'page_h_err_c_home');
        }

        $inc_navi = fetch_inc_navi('c', $c_commu_id);
        $this->set('inc_navi', $inc_navi);

        $this->set('c_commu', $c_commu);

        // 副管理者情報
        if ($c_commu['c_member_id_sub_admin']) {
            $c_member_sub_admin = db_member_c_member4c_member_id($c_commu['c_member_id_sub_admin']);
            $this->set('sub_admin', $c_member_sub_admin);
        }

        $this->set('is_c_commu_admin', db_commu_is_c_commu_admin($c_commu_id, $u));
        $this->set('is_c_commu_member', db_commu_is_c_commu_member($c_commu_id, $u));
        $this->set('is_c_commu_view', db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u));
        $this->set('is_receive_mail', db_commu_is_receive_mail_ktai($c_commu_id, $u));
        $this->set('is_receive_mail_pc', db_commu_is_receive_mail_pc($c_commu_id, $u));
        $this->set('is_receive_message', db_commu_is_receive_message($c_commu_id, $u));

        //コミュニティメンバー
        $c_commu_member_list = db_commu_c_commu_member_list4c_commu_id($c_commu_id, 9);
        $this->set('c_commu_member_list', $c_commu_member_list);

        $c_member_secure = db_member_c_member_secure4c_member_id($u);
        if (empty($c_member_secure['ktai_address'])) {
            $is_registered_ktai_address = false;
        } else {
            $is_registered_ktai_address = true;
        }

        //非公開コミュニティに管理者から招待されたかどうか
        $this->set('admin_invite', db_commu_c_commu4c_admin_invite_id($c_commu_id, $u));

        //参加コミュニティの新着トピック書き込み
        $new_topic_comment = db_commu_new_topic_comment4c_commu_id($c_commu_id, 7);
        $this->set('new_topic_comment', $new_topic_comment);
        //参加コミュニティの新着イベント書き込み
        $new_topic_comment_event = db_commu_new_topic_comment4c_commu_id($c_commu_id, 7, 1);
        $this->set('new_topic_comment_event', $new_topic_comment_event);
        //参加コミュニティの新着おすすめレビュー
        $this->set('new_commu_review', db_review_new_commu_review4c_commu_id($c_commu_id, 7));
        // 携帯メールアドレス登録状況
        $this->set('is_registered_ktai_address', $is_registered_ktai_address);

        $this->set('is_unused_pc_bbs', util_is_unused_mail('m_pc_bbs_info'));
        $this->set('is_unused_ktai_bbs', util_is_unused_mail('m_ktai_bbs_info'));

        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point($this->getView(), 'c_home'));

        return 'success';
    }
}

?>
