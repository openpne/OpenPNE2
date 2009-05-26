<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// パスワード再発行ページ
class admin_page_passwd extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['c_member'] = db_member_c_member4c_member_id_LIGHT($requests['target_c_member_id']);

        $this->set($v);
        return 'success';
    }
}

?>
