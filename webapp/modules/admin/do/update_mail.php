<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メール文言の更新
class admin_do_update_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        $name = $requests['target'];
        if ($name == 'inc_signature') {
            $source = $requests['body'];
        } else {
            $source = $requests['subject'] . "\n" . $requests['body'];
        }

        db_replace_c_template($name, $source);

        $params = sprintf('target=%s', $requests['target']);
        admin_client_redirect('edit_mail', '変更しました', $params);
    }
}

?>
