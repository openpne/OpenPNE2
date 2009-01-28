<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_review_clip_list_delete_c_review_clip extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_review_clips = $requests['c_review_clips'];
        // ----------

        //--- 権限チェック
        //クリップ作成者
        //do_h_review_clip_list_delete_c_review_clip の中で対応済み
        //---

        do_h_review_clip_list_delete_c_review_clip($u, $c_review_clips);

        openpne_redirect('pc', 'page_h_review_clip_list');
    }
}

?>
