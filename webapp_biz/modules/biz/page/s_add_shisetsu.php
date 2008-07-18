<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_s_add_shisetsu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $config = biz_getConfig();
        $this->set('inc_navi', fetch_inc_navi('h'));

        if ($config['IS_CLOSED_SHISETSU']) {
            $p = array('msg' => '施設関連の操作は禁止されています。');
            openpne_redirect('biz', 'page_s_list', $p);
        }

        return 'success';
    }
}

?>
