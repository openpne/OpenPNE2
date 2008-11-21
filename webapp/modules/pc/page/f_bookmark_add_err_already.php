<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_bookmark_add_err_already extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_member_id_to = $requests['c_member_id_to'];
        // ----------

        if (db_member_is_access_block($u, $c_member_id_to)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        $this->set('inc_navi', fetch_inc_navi("f", $c_member_id_to));

        $this->set('bookmark_member', db_member_c_member4c_member_id_LIGHT($c_member_id_to));

        return 'success';
    }
}

?>
