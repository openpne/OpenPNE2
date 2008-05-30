<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メール文言の削除
class admin_do_delete_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        $name = $requests['target'];
        db_delete_c_template($name);

        $params = sprintf('target=%s', $requests['target']);
        admin_client_redirect('edit_mail', 'デフォルトに戻しました', $params);
    }
}

?>
