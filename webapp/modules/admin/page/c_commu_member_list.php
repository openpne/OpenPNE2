<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_c_commu_member_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $target_c_commu_id = $requests['target_c_commu_id'];
        $page = $requests['page'];
        $page_size = 100;

        // コミュ情報
        $c_commu = db_commu_c_commu4c_commu_id2($target_c_commu_id);

        // コミュニティメンバ取得
        list($c_member_list, $is_prev, $is_next, $total_num, $start_num, $end_num) = db_admin_commu_c_members4c_commu_id($target_c_commu_id, $page_size, $page);

        if ( empty($c_member_list) ) {
            // 存在しないコミュはコミュリストにリダイレクト
            openpne_redirect('admin', 'page_list_c_commu'); 
        }

        $this->set('c_commu', $c_commu );
        $this->set('c_member_list', $c_member_list);

        $this->set('target_c_commu_id', $target_c_commu_id);
        $this->set('page', $page);
        $this->set('page_size', $page_size);

        $pager = util_make_pager($page, $page_size, $total_num);
        $this->set('pager', $pager); 
        return 'success';
    }
}

?>
