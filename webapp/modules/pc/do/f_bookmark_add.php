<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_f_bookmark_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_member_id_to = $requests['c_member_id'];
        // ----------

        //--- 権限チェック
        //自分以外 and ブックマーク登録されていない

        if ($c_member_id_to == $u) {
            handle_kengen_error();
        }

        if (db_bookmark_is_bookmark($u, $c_member_id_to)) {
            openpne_redirect('pc', 'page_h_bookmark_list');
        }
        //---

        db_bookmark_insert_c_bookmark($u, $c_member_id_to);
        openpne_redirect('pc', 'page_h_bookmark_list');
    }
}

?>
