<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

//日記削除確認画面
class biz_page_s_delete_schedule extends OpenPNE_Action
{
    function execute($requests)
    {
		$u = $GLOBALS['AUTH']->uid();

		$this->set('target_id',$requests['target_id']);

		return 'success';
	}
}

?>
