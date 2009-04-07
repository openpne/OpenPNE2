<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 画像リスト
class admin_page_list_c_file extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_FILEUPLOAD) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        $v = array();
        $pager = array();

        $v['SNS_NAME'] = SNS_NAME;

        $v['c_file_list'] = db_file_c_file_list($requests['page'], $requests['page_size'], $pager);
        $v['pager'] = $pager;

        $this->set($v);
        return 'success';
    }
}

?>
