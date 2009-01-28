<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// お知らせ、利用規約、プライバシーポリシーの更新
class admin_do_insert_html extends OpenPNE_Action
{
    function execute($requests)
    {
        if (db_admin_c_siteadmin($requests['target'])) {
            //update
            db_admin_update_c_siteadmin($requests['target'], $requests['body']);
        } else {
            //insert
            db_admin_insert_c_siteadmin($requests['target'], $requests['body']);
        }

        admin_client_redirect('insert_html', '変更しました', 'target='.$requests['target']);
    }
}

?>
