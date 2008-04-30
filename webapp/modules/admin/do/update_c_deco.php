<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_c_deco extends OpenPNE_Action
{
    function execute($requests)
    {
        foreach ($requests['is_enabled'] as $key => $value) {
            db_admin_update_c_config_decoration($key, $value);
        }

        admin_client_redirect('edit_deco', '文字装飾設定を編集しました');
    }
}

?>
