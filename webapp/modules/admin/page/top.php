<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/RSS.php';

// 管理画面トップページ 認証済み
class admin_page_top extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;

        if (DISPLAY_OPENPNE_INFO) {
            $rss_url = OPENPNE_INFO_URL;
            $rss = new OpenPNE_RSS();
            if (!$items = $rss->fetch($rss_url)) {
                $v['admin_info'] = array();
            } else {
                $v['admin_info'] = $items;
            }
        }

        $this->set($v);
        return 'success';
    }
}

?>
