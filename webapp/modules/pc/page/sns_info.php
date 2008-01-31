<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_sns_info extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        
        // --- リクエスト変数
        $type = $requests['type'];
        $order = $requests['order'];
        $num = $requests['num'];
        // ----------

        $list = db_get_sns_info($type, $order, $num);

        $list = array_pad($list, $num, array());

        $this->set('list', $list);

        return 'success';
    }
}

?>
