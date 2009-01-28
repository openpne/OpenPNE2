<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_f_bookmark_add extends OpenPNE_Action
{

    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'h_bookmark_list');
        exit;
    }

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

        //アクティブメンバーか
        if (!db_member_is_active_c_member_id($c_member_id_to)) {
            handle_kengen_error();
        }

        //お気に入り登録済みメンバーか
        if (db_bookmark_is_bookmark($u, $c_member_id_to)) {
            $p = array('c_member_id_to' => $c_member_id_to);
            openpne_redirect('pc', 'page_f_bookmark_add_err_already', $p);
        }

        db_bookmark_insert_c_bookmark($u, $c_member_id_to);
        openpne_redirect('pc', 'page_h_bookmark_list');
    }
}

?>
