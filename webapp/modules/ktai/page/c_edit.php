<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //--- 権限チェック
        if ($c_commu['c_member_id_admin']     != $u
         && $c_commu['c_member_id_sub_admin'] != $u) {
            handle_kengen_error();
        }

        //---

        $topic_authority_list=
        array(
            'public' => WORD_COMMUNITY_HALF . '参加者全員が作成可能',
            'admin_only' => WORD_COMMUNITY_HALF . '管理者のみ作成可能',
        );
        $this->set('topic_authority_list', $topic_authority_list);

        //カテゴリのリスト
        $this->set('c_commu_category_list', db_commu_c_commu_category4null());

        $this->set('is_topic', db_commu_is_topic4c_commu_id($target_c_commu_id));

        $this->set('c_commu', $c_commu);

        if ($c_commu['c_member_id_sub_admin'] == $u) {
            $this->set('is_sub_admin', 1);
        }

        return 'success';
    }
}

?>
