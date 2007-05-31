<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ランク一覧
class admin_page_list_c_rank extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_DISP_RANK) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }
		
        $pager = array();
        $c_rank_list = db_admin_get_c_rank_all($requests['page'], $requests['page_size'], $pager);

        $this->set("pager", $pager);
        $this->set("c_rank_list", $c_rank_list);
        return 'success';
    }
}

?>
