<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//施設情報削除確認画面

class biz_page_s_delete_shisetsu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('target_id',$requests['target_id']);
        $config = biz_getConfig();

        if($config['IS_CLOSED_SHISETSU'])
        {
            $p = array('msg' => '施設関連の操作は禁止されています。');
            openpne_redirect('biz', 'page_s_list', $p);
            exit();
        }
        return 'success';
    }
}
?>
