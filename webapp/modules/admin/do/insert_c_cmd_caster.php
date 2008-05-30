<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_insert_c_cmd_caster extends OpenPNE_Action
{
    function handleError($errors)
    {
        openpne_forward('admin', 'page', 'list_c_cmd_caster', $errors);
        exit;
    }

    function execute($requests)
    {
        $url = $requests['url'];

        require_once 'OpenPNE/RSS.php';
        if (!($rss_url = OpenPNE_RSS::auto_discovery($url))) {
            admin_client_redirect('list_c_cmd_caster', 'CMDキャストURLが無効です');
        }

        $result = db_admin_insert_c_cmd_caster($rss_url);
        if ($result) {
            admin_client_redirect('list_c_cmd_caster', 'CMDキャストURLを登録しました');
        } else {
            admin_client_redirect('list_c_cmd_caster', 'CMDキャストURLを登録できませんでした');
        }
    }
}

?>
