<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// API編集
class admin_do_update_c_api extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_API) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        foreach ($requests['ip'] as $ip) {
            if (!admin_api_is_ip($ip)){
                admin_client_redirect('list_c_api', "$ip はIPアドレスとして正しくありません");
            }
        }

        foreach ($requests['c_api_id'] as $key => $value) {
            db_admin_update_c_api($value, $requests['name'][$key], $requests['ip'][$key]);
        }

        admin_client_redirect('list_c_api', '許容IPアドレスを編集しました');
    }
}

?>
