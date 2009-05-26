<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_c_sns_config_ktai extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_c_sns_config_ktai', array_shift($errors));
    }

    function execute($requests)
    {
        $data = array();
        foreach ($requests as $key => $value) {
            if (preg_match('/^color_(\d+)$/', $key, $matches)) {
                $number = intval($matches[1]);
                if ($number > 0 && $number <= 50) {
                    $data[$key] = strval($value);
                }
            }
        }
        db_update_c_config_color_ktai($data);
        admin_client_redirect('edit_c_sns_config_ktai', '色を変更しました');
    }
}

?>
