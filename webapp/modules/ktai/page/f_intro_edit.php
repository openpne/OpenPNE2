<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_f_intro_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

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
            openpne_redirect('ktai', 'page_f_home', $p);
        }
        //---

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('ktai', 'page_h_access_block');
        }

        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));
        $this->set("intro_body", db_friend_intro_body4c_member_id($u, $target_c_member_id));
        $this->set("target_c_member_id", $target_c_member_id);
        return 'success';
    }
}

?>
