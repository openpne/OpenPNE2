<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

//予定削除確認画面

class biz_page_h_biz_schedule_delete extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('schedule_id',$requests['schedule_id']);
        $this->set("is_rep", $requests['is_rep']);

        return 'success';
    }
}

?>
