<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class setup_page_setup_done extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // メンバー数が１の場合のみ表示する
        $sql = 'SELECT COUNT(*) FROM c_member';
        if (db_get_one($sql) > 1) {
            exit;
        }
        return 'success';
    }
}

?>
