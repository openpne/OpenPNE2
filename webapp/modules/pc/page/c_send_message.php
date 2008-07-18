<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_send_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $body = $requests['body'];
        // ----------
        //--- 権限チェック
        //コミュニティ管理者
        if (!db_commu_is_c_commu_admin($target_c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        $this->set('inc_navi', fetch_inc_navi('c', $target_c_commu_id));

        //メンバー情報
        $this->set("member", db_member_c_member4c_member_id($u));
        //コミュニティID
        $this->set("c_commu_id", $target_c_commu_id);
        //コミュニティ
        $this->set("c_commu", db_commu_c_commu4c_commu_id2($target_c_commu_id));

        return 'success';
    }
}

?>
