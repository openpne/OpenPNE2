<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_home extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //コミュニティの存在の有無
        if (!$c_commu) {
            openpne_redirect('ktai', 'page_h_home');
        }


        //--- 権限チェック
        //未処理
        //掲示板の閲覧権限チェック tplでやっている
        $this->set("is_c_commu_view", db_commu_is_c_commu_view4c_commu_idAc_member_id($target_c_commu_id, $u));
        $this->set("is_c_commu_member", db_commu_is_c_commu_member($target_c_commu_id, $u));
        $this->set('is_c_commu_admin', db_commu_is_c_commu_admin($target_c_commu_id, $u));
        //---

        //管理画面HTML
        $this->set('c_siteadmin', p_common_c_siteadmin4target_pagename('k_c_home'));

        //コミュニティ情報
        $this->set("c_commu", db_commu_c_commu4c_commu_id_k($target_c_commu_id));

        // 副管理者情報
        if ($c_commu['c_member_id_sub_admin']) {
            $c_member_sub_admin = db_member_c_member4c_member_id($c_commu['c_member_id_sub_admin']);
            $this->set('sub_admin', $c_member_sub_admin);
        }

        //コミュニティメンバーリスト
        $this->set("c_commu_member_list",
            db_commu_c_commu_member_list_random4c_commu_id($target_c_commu_id, 5));

        //参加コミュニティの新着トピック書き込み
        $this->set("new_topic_comment", db_commu_new_topic_comment4c_commu_id($target_c_commu_id, 5));
        //参加コミュニティの新着イベント書き込み
        $this->set("new_topic_comment_event", db_commu_new_topic_comment4c_commu_id($target_c_commu_id, 5, 1));

        //自分($u)とこのコミュとの関係
        $this->set("relation_c_member_and_c_commu",
            db_commu_relationship_between_member_commu($target_c_commu_id, $u));

        //コミュニティメール(ktai)受信設定
        $this->set("is_receive_mail", db_commu_is_receive_mail_ktai($target_c_commu_id, $u));
        //コミュニティメール(pc)受信設定
        $this->set("is_receive_mail_pc", db_commu_is_receive_mail_pc($target_c_commu_id, $u));
        //管理者からのメッセージ受信設定
        $this->set("is_receive_message", db_commu_is_receive_message($target_c_commu_id, $u));

        $this->set('is_unused_pc_bbs', util_is_unused_mail('m_pc_bbs_info'));
        $this->set('is_unused_ktai_bbs', util_is_unused_mail('m_ktai_bbs_info'));

        // inc_entry_point
        $this->set('inc_ktai_entry_point', fetch_inc_entry_point($this->getView(), 'ktai_c_home'));

        return 'success';
    }
}

?>
