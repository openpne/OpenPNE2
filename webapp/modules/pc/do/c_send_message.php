<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_send_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        // ----------

        if (is_null($subject) || $subject === '') {
            $p = array(
                'target_c_commu_id' => $target_c_commu_id,
                'msg' => 'タイトルを入力してください',
            );
            openpne_redirect('pc', 'page_c_send_message', $p);
        }
        if (is_null($body) || $body === '') {
            $p = array(
                'target_c_commu_id' => $target_c_commu_id,
                'msg' => 'メッセージを入力してください',
            );
            openpne_redirect('pc', 'page_c_send_message', $p);
        }

        //--- 権限チェック
        //コミュニティ管理者
        if (!db_commu_is_c_commu_admin($target_c_commu_id, $u)) {
            handle_kengen_error();
        }
        //---
        $c_member_id_list = db_commu_c_commu_member_id_list4c_commu_id($target_c_commu_id);

        foreach ($c_member_id_list as $c_member_id) {
            if ($c_member_id == $u)continue;
            db_message_send_message_commu_send_msg($u, $c_member_id, $subject, $body, $target_c_commu_id);
        }
        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_home', $p);
    }
}

?>
