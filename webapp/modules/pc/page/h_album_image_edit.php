<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_image_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        $image_description = $requests['image_description'];
        // ----------

        // target が指定されていない
        if (!$target_c_album_image_id) {
            openpne_redirect('pc', 'page_h_err_fh_album');
        }

        // アルバムの写真データ取得
        $c_album_image = db_album_image_get_c_album_image4id($target_c_album_image_id);
        $target_c_album_id = $c_album_image['c_album_id'];

        //アルバムデータ取得
        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        //--- 権限チェック
        if ($u != $c_album['c_member_id']) {
            handle_kengen_error();
        }

        // target の写真が存在しない
        if(!$c_album_image){
            openpne_redirect('pc', 'page_h_err_fh_album');
        }

        if (!(is_null($image_description))) {
            $c_album_image['image_description'] = $image_description;
        }

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('c_album_image', $c_album_image);
        $this->set('target_c_album_id', $target_c_album_id);
        $this->set('target_c_album_image_id', $target_c_album_image_id);

        return 'success';
    }
}

?>
