<?php
class portal_do_delete_portal_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $filename = $requests['filename'];
        $target_area = $requests['target_area'];

        $tail = '&target_area=' . urlencode($target_area);

        if (!db_portal_imaage4filename($filename)) {
            portal_client_redirect('edit_portal_image', '画像を削除できませんでした', $tail);
        }

        db_image_data_delete($filename);
        db_portal_delete_portal_image($filename);

        portal_client_redirect('edit_portal_image', '画像を削除しました', $tail);
    }
}

?>
