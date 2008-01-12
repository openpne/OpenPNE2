<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// ランク追加
class admin_do_insert_c_rank extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('list_c_rank', array_shift($errors));
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_POINT_RANK) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        if (db_point_is_rank4point($requests['point'])) {
            admin_client_redirect('list_c_rank', '同一の到達ポイントのランクが既に存在します');
        }

        $c_rank_id = db_admin_insert_c_rank($requests['name'], '', $requests['point']);
        if ($_FILES['image_upfile']['name']) {
            $ext = t_check_image_format($_FILES['image_upfile']);
            $image_filename = "r_{$c_rank_id}_".time().".{$ext}";
            admin_insert_c_image($_FILES['image_upfile'], $image_filename);

            db_admin_update_c_rank($c_rank_id, $requests['name'], $image_filename, $requests['point']);
        }

        admin_client_redirect('list_c_rank', 'ランクを追加しました');
    }
}

?>
