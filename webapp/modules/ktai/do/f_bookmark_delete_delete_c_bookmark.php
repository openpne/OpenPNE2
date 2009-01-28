<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * お気に入りに追加
 */
class ktai_do_f_bookmark_delete_delete_c_bookmark extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        db_bookmark_delete_c_bookmark($u, $target_c_member_id);
        openpne_redirect('ktai', 'page_h_bookmark_list');
    }
}

?>
