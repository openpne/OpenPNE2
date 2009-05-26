<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティメール受信設定を変更
 */
class ktai_do_c_home_update_is_receive_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $is_receive_mail = $requests['is_receive_mail'];
        $is_receive_mail_pc = $requests['is_receive_mail_pc'];
        $is_receive_message = $requests['is_receive_message'];
        // ----------

        //--- 権限チェック
        //コミュニティ参加者

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }
        //---

        //PC&ktaiの両方を一度に更新
        db_commu_update_is_receive_mail($target_c_commu_id, $u, $is_receive_mail, $is_receive_mail_pc, $is_receive_message);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('ktai', 'page_c_home', $p);
    }
}

?>
