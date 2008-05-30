<?php
/**
 * @copyright 2005-2008 OpenPNE Project
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

        $target_c_member_id = $requests['target_c_member_id'];

        $is_friend = db_friend_is_friend($u, $target_c_member_id);
        $is_link_wait = db_friend_is_friend_link_wait($u, $target_c_member_id);

        $p = array('target_c_member_id' => $target_c_member_id);
        if ($is_friend) {
            // フレンドリンク済 [ERROR]
            openpne_redirect('pc', 'page_f_link_request_err_already', $p);
        } elseif ($is_link_wait) {
            // フレンドでない＆リンク承認待ち [ERROR]
            openpne_redirect('pc', 'page_f_link_request_err_wait', $p);
        } else {
            // フレンドでない＆リンク承認待ちでない
            openpne_redirect('pc', 'page_f_link_request', $p);
        }
    }
}

?>
