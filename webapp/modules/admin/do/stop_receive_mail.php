<?php
/**
 * @Copyright 2007 Oki Electric Industry Co., Ltd. all rights reserved
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 * @author    Makio Tsukamoto <tsukamoto645@oki.com>
 */

class admin_do_stop_receive_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        db_admin_stop_receive_mail4c_member_id($requests['target_c_member_id']);
        admin_client_redirect('list_c_member', 'メール受信設定を変更しました');
    }
}

?>
