<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_click_banner extends OpenPNE_Action
{
    function handleError($errors)
    {
        openpne_redirect('pc');
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $target_c_banner_id = $requests['target_c_banner_id'];
        $referer = $_SERVER['HTTP_REFERER'];

        db_banner_insert_c_banner_log($target_c_banner_id, $u, $referer);

        $c_banner = db_banner_get_c_banner4id($target_c_banner_id);
        if (empty($c_banner['a_href'])) {
            openpne_redirect('pc');
        } else {
            client_redirect_absolute($c_banner['a_href']);
        }
    }
}

?>
