<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_intro_delete_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        //is_friend
        $is_friend = db_friend_is_friend($u, $target_c_member_id);

        //--- 権限チェック
        //フレンド
        if ($target_c_member_id == $u) {
            handle_kengen_error();
        }
        if (!$is_friend) {
            $p = array('target_c_member_id' => $target_c_member_id);
            openpne_redirect('pc', 'page_f_link_request_err_yet', $p);
        }
        //---

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        $this->set('inc_navi', fetch_inc_navi('f', $target_c_member_id));

        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));
        $this->set("target_c_member_id", $target_c_member_id);
        return 'success';
    }
}

?>
