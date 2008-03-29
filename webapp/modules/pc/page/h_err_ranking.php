<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_err_ranking extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if (OPENPNE_USE_RANKING) {
            openpne_redirect('pc', 'page_h_ranking');
        }

        $this->set('inc_navi', fetch_inc_navi('h'));
        return 'success';
    }
}

?>
