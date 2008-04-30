<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_delete_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if (IS_GET_EASY_ACCESS_ID == 3 || IS_GET_EASY_ACCESS_ID == 2) {
            handle_kengen_error();
        }

        $this->set('inc_navi',fetch_inc_navi("h"));

        return 'success';
    }
}

?>
