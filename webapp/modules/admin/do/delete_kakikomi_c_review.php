<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 書き込み管理(レビュー削除)
class admin_do_delete_kakikomi_c_review extends OpenPNE_Action
{
    function execute($requests)
    {
        do_delete_c_review4c_review_id($requests['target_c_review_id']);

        admin_client_redirect('delete_kakikomi', 'レビューを削除しました');
    }
}

?>
