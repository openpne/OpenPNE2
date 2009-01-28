<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メール文言の更新
class admin_do_update_mail_send extends OpenPNE_Action
{
    function execute($requests)
    {
        $unused = array();
        foreach ($requests['mail'] as $key => $value) {
            if (!$value) {
                $unused[] = $key;
            }
        }
        $v = implode(',', $unused);
        db_admin_replace_c_admin_config('UNUSED_MAILS', $v);

        admin_client_redirect('edit_mail_send', '変更しました');
    }
}

?>
