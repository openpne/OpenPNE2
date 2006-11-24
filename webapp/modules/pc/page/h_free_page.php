<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once OPENPNE_MODULES_DIR . '/admin/lib/db_admin.php';

class pc_page_h_free_page extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $c_free_page = db_admin_get_c_free_page_one($requests['c_free_page_id']);
        //フリーページが存在しない
        if (!$c_free_page) {
            $p = array('msg' => "指定されたフリーページは存在しません");
            openpne_redirect('pc', 'page_h_err_free_page', $p);
        }


        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set("c_free_page", $c_free_page);
        return 'success';
    }
}

?>
