<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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

        $c_commu = _db_c_commu4c_commu_id($target_c_commu_id);

        //--- 権限チェック
        if ($c_commu['c_member_id_admin'] != $u) {
            handle_kengen_error();
        }
        //---

        //カテゴリのリスト
        $this->set('c_commu_category_list', _db_c_commu_category4null());

        $this->set('is_topic', p_c_edit_is_topic4c_commu_id($target_c_commu_id));

        $this->set('c_commu', $c_commu);


        return 'success';
    }
}

?>
