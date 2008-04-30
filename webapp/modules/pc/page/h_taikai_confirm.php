<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_taikai_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if ($u == 1) {
            openpne_redirect('pc', 'page_h_config');
        }

        $this->set('inc_navi', fetch_inc_navi("h"));
        return 'success';
    }
}

?>
