<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_delete_album extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];

        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        //--- 権限チェック
        if ($u != $c_album['c_member_id']) {
            handle_kengen_error();
        }

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('target_c_album_id', $target_c_album_id);

        return 'success';
    }
}

?>
