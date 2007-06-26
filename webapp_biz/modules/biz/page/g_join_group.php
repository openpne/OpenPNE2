<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_g_join_group extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_id = $requests['target_id'];

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('group', biz_getGroupData($target_id));

        return 'success';
    }
}

?>
