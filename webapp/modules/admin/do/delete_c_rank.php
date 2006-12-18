<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ランク編集
class admin_do_delete_c_rank extends OpenPNE_Action
{
    function execute($requests)
    {
        //以前のイメージを削除
        $c_rank = db_admin_get_c_rank_one($requests['c_rank_id']);
        image_data_delete($c_rank['image_filename']);

        db_admin_delete_c_rank($requests['c_rank_id']);

        admin_client_redirect('list_c_rank', 'ランクを削除しました');
    }
}

?>
