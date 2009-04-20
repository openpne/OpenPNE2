<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティトピック・イベントの写真を削除
 */
class ktai_do_c_topic_delete_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $tail = $GLOBALS['KTAI_URL_TAIL'];

        // --- リクエスト変数
        $c_commu_topic_id = $requests['target_c_commu_topic_id'];
        $img_num = $requests['img_num'];
        // ----------

        $c_topic = db_commu_c_topic4c_commu_topic_id($c_commu_topic_id);
        $c_commu_id = $c_topic['c_commu_id'];

        //--- 権限チェック
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }
        if (!db_commu_is_c_topic_admin($c_commu_topic_id, $u) &&
            !db_commu_is_c_commu_admin($c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---

        $target_image_filename = '';
        switch ($img_num) {
        case '1' :
            $target_image_filename = $c_topic['image_filename1'];
            break;
        case '2' :
            $target_image_filename = $c_topic['image_filename2'];
            break;
        case '3' :
            $target_image_filename = $c_topic['image_filename3'];
            break;
        }

        if (empty($target_image_filename)) {
            handle_kengen_error();
        }

        db_image_data_delete($target_image_filename, $u);
        db_commu_delete_c_commu_topic_comment_image($c_commu_topic_id, $img_num);

        $p = array('target_c_commu_topic_id' => $c_commu_topic_id);
        openpne_redirect('ktai', 'page_c_topic_edit_image', $p);
    }
}

?>
