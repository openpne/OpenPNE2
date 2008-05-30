<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_blacklist_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_black_list = db_admin_c_blacklist($requests['target_c_blacklist_id']);
        if (!$c_black_list) {
            admin_client_redirect('blacklist', 'ブラックリストに登録されていません');
        }

        if ($requests['easy_access_id']) {
            $c_black_list['easy_access_id'] = $requests['easy_access_id'];
        }
        if ($requests['info']) {
            $c_black_list['info'] = $requests['info'];
        }

        $this->set('blacklist', $c_black_list);

        return 'success';
    }
}

?>
