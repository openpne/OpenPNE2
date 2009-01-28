<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_image_add extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $form_val['image_description1'] = $requests['image_description1'];
        $form_val['image_description2'] = $requests['image_description2'];
        $form_val['image_description3'] = $requests['image_description3'];
        $form_val['image_description4'] = $requests['image_description4'];
        $form_val['image_description5'] = $requests['image_description5'];
        $target_c_album_id = $requests['target_c_album_id'];

        //--- 権限チェック
        $album = db_album_get_c_album4c_album_id($target_c_album_id);
        if($album['c_member_id'] != $u){
            handle_kengen_error();
        }

        $this->set('inc_navi', fetch_inc_navi("h"));

        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);

        $this->set('album_subject',$c_album['subject']);
        $this->set('target_c_album_id',$target_c_album_id);
        $this->set("form_val", $form_val);

        //写真データ一時ファイル削除
        $sessid = session_id();
        t_image_clear_tmp($sessid);

        return 'success';
    }
}

?>
