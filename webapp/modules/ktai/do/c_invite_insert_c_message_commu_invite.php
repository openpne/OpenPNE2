<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティをマイフレンドに教える
 */
class ktai_do_c_invite_insert_c_message_commu_invite extends OpenPNE_Action
{
    function handleError($errors)
    {
        if (!empty($errors['target_c_commu_id'])) {
            parent::handleError($errors);
        }

        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $c_commu_id = $this->requests['target_c_commu_id'];
        if (!empty($errors['target_c_member_id'])) {
            $p = array('target_c_commu_id' => $c_commu_id, 'msg' => 7);
            openpne_redirect('ktai', 'page_c_invite', $p);
        } elseif (!empty($errors['body'])) {
            $p = array('target_c_commu_id' => $c_commu_id, 'msg' => 8);
            openpne_redirect('ktai', 'page_c_invite', $p);
        } else {
            parent::handleError($errors);
        }
    }

    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $body = $requests['body'];
        $target_c_member_id = $requests['target_c_member_id'];
        // ----------

        //--- 権限チェック
        //フレンド

        $status = db_friend_status($u, $target_c_member_id);
        if (!$status['is_friend']) {
            handle_kengen_error();
        }
        //---

        list($msg_subject, $msg_body) =
            create_message_commu_invite($u, $body, $target_c_commu_id);

        db_message_send_message_syoukai_commu($u, $target_c_member_id, $msg_subject, $msg_body);

        $commu = db_commu_c_commu4c_commu_id($target_c_commu_id);
        $c_member_id_admin = $commu['c_member_id_admin'];
        $public_flag = $commu['public_flag'];
        if (($c_member_id_admin == $u) && ($public_flag != 'public')) {
            db_commu_insert_c_commu_admin_invite($target_c_commu_id, $target_c_member_id);
        }

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('ktai', 'page_c_home', $p);
    }
}

?>
