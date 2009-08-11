<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * アルバムの追加・編集
 */
class ktai_do_h_album_edit_insert_c_album extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $subject = $requests['subject'];
        $description = $requests['description'];
        $public_flag = util_cast_public_flag_diary($requests['public_flag']);
        $target_c_album_id = $requests['target_c_album_id'];
        // ----------

        if (is_null($subject) || $subject === '') {
            $_REQUEST['msg'] = 2;
            openpne_forward('ktai', 'page', 'h_album_edit');
            exit;
        }

        if (is_null($description) || $description === '') {
            $_REQUEST['msg'] = 51;
            openpne_forward('ktai', 'page', 'h_album_edit');
            exit;
        }

        if (!$target_c_album_id) {
            // 新規作成
            $target_c_album_id = db_album_insert_c_album($u, $subject, $description, $public_flag);
            $p = array('target_c_album_id' => $target_c_album_id);
            openpne_redirect('ktai', 'page_h_album_add_end', $p);
        } else {
            // 編集
            $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
            if ($c_album['c_member_id'] != $u) {
                handle_kengen_error();
            }
            db_album_update_c_album($target_c_album_id, $subject, $description, $public_flag);
            $p = array('target_c_album_id' => $target_c_album_id  );
            openpne_redirect('ktai', 'page_fh_album', $p);
        }

    }
}

?>
