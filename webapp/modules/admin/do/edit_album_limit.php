<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_edit_album_limit extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_album_limit', array_shift($errors));
        exit;
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $limit = $requests['limit'];
        $name = 'OPENPNE_ALBUM_LIMIT';

        if (is_null(db_admin_c_admin_config4name($name))) {
            db_admin_insert_c_admin_config($name, $limit);
        } else {
            db_admin_update_c_admin_config($name, $limit);
        }

        admin_client_redirect('edit_album_limit', '設定を変更しました');
    }
}

?>
