<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_home extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $c_commu_id = $requests['target_c_commu_id'];

        $c_commu = p_c_home_c_commu4c_commu_id($c_commu_id);
        //コミュニティの存在の有無
        if (!$c_commu) {
            openpne_redirect('pc', 'page_h_err_c_home');
        }

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));

        $this->set('c_commu', $c_commu);

        $this->set('is_c_commu_admin', _db_is_c_commu_admin($c_commu_id, $u));
        $this->set('is_c_commu_member', _db_is_c_commu_member($c_commu_id, $u));
        $this->set('is_c_commu_view', p_common_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u));
        $this->set('is_receive_mail', db_commu_is_receive_mail_ktai($c_commu_id, $u));
        $this->set('is_receive_mail_pc', db_commu_is_receive_mail_pc($c_commu_id, $u));
        $this->set('is_receive_message', db_commu_is_receive_message($c_commu_id, $u));

        //コミュニティメンバー
        $this->set('c_commu_member_list', p_c_home_c_commu_member_list4c_commu_id($c_commu_id, 9));

        //非公開コミュニティに管理者から招待されたかどうか
        $this->set('admin_invite', db_c_commu4c_admin_invite_id($c_commu_id, $u));

        //参加コミュニティの新着トピック書き込み
        $this->set('new_topic_comment', p_c_home_new_topic_comment4c_commu_id($c_commu_id, 7));
        //参加コミュニティの新着イベント書き込み
        $this->set('new_topic_comment_event', p_c_home_new_topic_comment4c_commu_id($c_commu_id, 7, 1));
        //参加コミュニティの新着おすすめレビュー
        $this->set('new_commu_review', p_c_home_new_commu_review4c_commu_id($c_commu_id, 7));

        // inc_entry_point
        $this->set('inc_entry_point', fetch_inc_entry_point_c_home($this->getView()));

        $this->set('is_unused_pc_bbs', util_is_unused_mail('m_pc_bbs_info'));
        $this->set('is_unused_ktai_bbs', util_is_unused_mail('m_ktai_bbs_info'));

        return 'success';
    }
}

?>
