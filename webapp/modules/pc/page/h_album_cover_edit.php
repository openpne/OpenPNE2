<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_cover_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        $subject = $requests['subject'];
        $description = $requests['description'];
        $public_flag = $requests['public_flag'];
        // ----------

        // target のアルバムが存在しない
        if (!p_common_is_active_c_album_id($target_c_album_id) && $target_c_album_id != null) {
            openpne_redirect('pc', 'page_h_err_fh_album');
        }

        //--- 権限チェック
        $album = db_album_get_c_album4c_album_id($target_c_album_id);
        if($album['c_member_id'] != $u){
            handle_kengen_error();
        }

        // 内容の不備によるリダイレクト時・編集修正時は値を上書き
        if ($requests['msg'] || !(is_null($subject) || is_null($description) || is_null($public_flag))) {
            $album['subject'] = $subject;
            $album['description'] = $description;
            $album['public_flag'] = $public_flag;
        }

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('target_c_album_id',$target_c_album_id);

        //アルバムデータ
        $this->set('album',$album);

        //写真データ一時ファイル削除
        $sessid = session_id();
        t_image_clear_tmp($sessid);

        return 'success';
    }
}

?>
