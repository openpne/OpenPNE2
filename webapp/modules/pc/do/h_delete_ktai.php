<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_delete_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $q = $requests['c_member_id'];

        k_do_update_ktai_address($q,"");
        openpne_redirect('pc', 'page_h_ktai_delete_end');

    }
}

?>
