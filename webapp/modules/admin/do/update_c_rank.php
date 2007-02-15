<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ランク編集
class admin_do_update_c_rank extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_rank_id      = $requests['c_rank_id'];
        $c_rank = db_admin_get_c_rank_one($c_rank_id);
        $image_filename = $c_rank['image_filename'];

        if ($_FILES['image_upfile']['name']) {
            //以前のイメージを削除
            image_data_delete($image_filename);

            //新しいイメージを作成
            $ext = t_check_image_format($_FILES['image_upfile']);
            $image_filename = "r_{$c_rank_id}_".time().".{$ext}";
            admin_insert_c_image($_FILES['image_upfile'], $image_filename);
        }

        db_admin_update_c_rank($c_rank_id, $requests['name'], $image_filename, $requests['point']);

        admin_client_redirect('list_c_rank', 'ランクを編集しました');
    }
}

?>
