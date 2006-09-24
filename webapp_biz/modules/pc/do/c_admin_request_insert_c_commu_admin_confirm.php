<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_0.txt PHP License 3.0
 */

/**
 * コミュニティ管理者交代依頼メッセージ送信
 */
class pc_do_c_admin_request_insert_c_commu_admin_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        //--- 権限チェック
        //自分がコミュニティ管理者
        //targetがコミュニティメンバー

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }

        $status = db_common_commu_status($target_c_member_id, $target_c_commu_id);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }
        //---

        $target_c_commu_admin_confirm_id =
            db_commu_insert_c_commu_admin_confirm($target_c_commu_id, $target_c_member_id);

        //メッセージ
        $c_member_id_from = $u;
        $c_member_from    = db_common_c_member4c_member_id_LIGHT($c_member_id_from);
        $c_member_to      = $target_c_member_id;
        $c_commu          = _db_c_commu4c_commu_id($target_c_commu_id);

        $subject ="コミュニティ管理者交代要請メッセージ";
        $body_disp =
            $c_member_from['nickname']." さんから".$c_commu['name']." コミュニティの管理者交代希望メッセージが届いています。\n".
            "\n".
            "この要請について、承認待ちリストから承認または拒否を選択してください。\n";

        // ---bizここから
        $biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //bizモジュールディレクトリの定義
        include_once($biz_dir.'lib/mysql_functions.php');  //bizモジュールよりライブラリを拝借

        if(biz_isKtaiMessage($target_c_member_id))
            biz_sendKtaiMessageSyoudakuMail($u, $target_c_member_id, $subject, $body);
        // ---bizここまで


        do_common_send_message_syoudaku($c_member_id_from, $target_c_member_id, $subject, $body_disp);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_edit_member', $p);
    }
}
?>
