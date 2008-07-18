<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ランク更新
class admin_page_update_c_rank extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_POINT_RANK) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        $c_rank = db_admin_get_c_rank_one($requests['c_rank_id']);

        if (!$c_rank) {
            admin_client_redirect('list_c_rank', '指定されたIDは無効です');
        }

        $this->set("c_rank", $c_rank);
        return 'success';
    }
}

?>
