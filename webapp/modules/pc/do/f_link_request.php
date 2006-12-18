<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * フレンドリクエストを送る
 */
class pc_do_f_link_request extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();


        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        $c_member_id_from = $u;
        $c_member_id_to   = $target_c_member_id;

        $status = db_friend_f_link_status($c_member_id_from, $c_member_id_to);
        $p = array('target_c_member_id' => $target_c_member_id);

        switch($status) {
        //リクエスト(承認送信画面)
        case STATUS_F_LINK_FLAT;
            openpne_redirect('pc', 'page_f_link_request', $p);
            break;
        //リクエスト(リンク承認待ち)
        case STATUS_F_LINK_WAIT;
            openpne_redirect('pc', 'page_f_link_request_err_wait', $p);
            break;
        //リクエスト(フレンドリンク済)
        case STATUS_F_LINK_ALREADY;
            openpne_redirect('pc', 'page_f_link_request_err_already', $p);
            break;
        }
    }
}

?>
