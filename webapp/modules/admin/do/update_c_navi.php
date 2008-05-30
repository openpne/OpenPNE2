<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_do_update_c_navi extends OpenPNE_Action
{
    function execute($requests)
    {
        db_replace_c_navi(
            $requests['navi_type'],
            $requests['sort_order'],
            $requests['url'],
            $requests['caption']);

        pne_cache_drop('fetch_inc_navi', $requests['navi_type']);

        admin_client_redirect('edit_c_navi', '変更しました');
    }
}

?>
