<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once OPENPNE_MODULES_DIR . '/admin/lib/db_admin.php';

class ktai_page_o_free_page extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $c_free_page = db_admin_get_c_free_page_one($requests['c_free_page_id']);
        // フリーページが存在しない
        if (!$c_free_page) {
            $this->set("msg", "指定されたフリーページは存在しません");
        } else if ($c_free_page['auth']) {
        // フリーページが認証あり用
            $p = array('c_free_page_id' => $requests['c_free_page_id']);
            openpne_redirect('ktai', 'page_h_free_page', $p);
        } else if ($c_free_page['type'] == "pc") {
        // フリーページがPC用
            $this->set("msg", "指定されたフリーページはPC専用です。PCで御覧下さい");
        } else {
            $this->set("c_free_page", $c_free_page);
            $this->set("title", $c_free_page['title']);
        }
        return 'success';
    }
}

?>
