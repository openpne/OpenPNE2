<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_member_config_update_display_home extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'h_config', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $default_config = util_get_c_member_config_default();
        foreach ($requests as $key => $value) {
            if (!is_null($value) && array_key_exists($key, $default_config)) {
                db_member_update_c_member_config($u, $key, $value);
            }
        }

        openpne_redirect('pc', 'page_h_home');
    }
}

?>
