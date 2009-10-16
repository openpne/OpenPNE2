<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_image_insert_dialog extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $page = $requests['page'];
        // ----------

        $page_size = 20;
        $desc = 1;

        $target_c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        $target_c_member_id = $u;
        if ($target_c_member_id != $target_c_album['c_member_id']) {
            handle_kengen_error();
        }

        $this->set('target_c_member_id', $target_c_member_id);
        $this->set('target_c_album_id', $target_c_album_id);
        $this->set('album_info',$target_c_album);
        $this->set("target_member", db_member_c_member4c_member_id($target_c_member_id));

        $target_c_album_image = db_album_c_album_image_list4c_album_id($target_c_album_id, $page, $page_size, $desc);
        $this->set("target_album_image", $target_c_album_image[0]);
        $this->set('is_prev', $target_c_album_image[1]);
        $this->set('is_next', $target_c_album_image[2]);
        $this->set("total_num", $target_c_album_image[3]);
        $this->set('album_list_count', count($target_c_album_image[0]));
        $this->set('page', $page);
        $this->set('page_size', $page_size);

        $view =& $this->getView();
        $view->ext_display('h_album_image_insert_dialog.tpl');
        exit;
    }
}

?>
