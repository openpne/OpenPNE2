<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

// 管理画面トップページ 認証済み
class admin_biz_page_top extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;

        $this->set($v);
        return 'success';
    }
}

?>
