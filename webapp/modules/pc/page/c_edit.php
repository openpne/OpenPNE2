<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $name = $requests['name'];
        $c_commu_category_id = $requests['c_commu_category_id'];
        $info = $requests['info'];
        $public_flag = $requests['public_flag'];
        $topic_authority = $requests['topic_authority'];
        $err_msg = $requests['err_msg'];
        // ----------

        //--- 権限チェック
        //コミュニティ管理者
        if (!db_commu_is_c_commu_admin($target_c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        $this->set('inc_navi', fetch_inc_navi('c', $target_c_commu_id));
        //コミュニティデータ取得
        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
        if ($name) {
            $c_commu['name'] = $name;
        }
        if ($c_commu_category_id) {
            $c_commu['c_commu_category_id'] = $c_commu_category_id;
        }
        if ($info) {
            $c_commu['info'] = $info;
        }
        if ($public_flag) {
            $c_commu['public_flag'] = $public_flag;
        }

        $this->set('target_c_commu_id', $target_c_commu_id);

        if ($err_msg) {
            $c_commu['name'] = $name;
            $c_commu['info'] = $info;
        }

        $this->set('c_commu', $c_commu);
        $this->set('c_commu_category_list', db_commu_c_commu_category4createflag());
        $public_flag_list=
        array(
            'public' =>'参加：誰でも参加可能、掲示板：全員に公開',
            'auth_sns' =>'参加：管理者の承認が必要、掲示板：全員に公開',
            'auth_commu_member' =>'参加：管理者の承認が必要、掲示板：' . WORD_COMMUNITY . '参加者にのみ公開',
        );
        $this->set('public_flag_list', $public_flag_list);
        $topic_authority_list=
        array(
            'public' => WORD_COMMUNITY . '参加者全員が作成可能',
            'admin_only' => WORD_COMMUNITY . '管理者のみ作成可能',
        );
        $this->set('topic_authority_list', $topic_authority_list);
        $this->set('is_topic', db_commu_is_topic4c_commu_id($target_c_commu_id));
        $this->set('err_msg', $err_msg);

        $this->set('is_unused_join_commu', util_is_unused_mail('m_pc_join_commu'));

        return 'success';
    }
}
?>
