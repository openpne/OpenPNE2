<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * コミュニティに参加
 */
class pc_do_inc_join_c_commu extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $target_c_commu_id = $requests['target_c_commu_id'];

        $status = db_commu_get_c_join_status($u, $target_c_commu_id);

        //非公開コミュニティに管理者から招待されている場合は強制的に承認を回避
        $admin_invite = db_commu_c_commu4c_admin_invite_id($target_c_commu_id, $u);
        if ($admin_invite) {
            $status = STATUS_C_JOIN_REQUEST_FREE;
            db_commu_delete_c_commu_admin_invite($admin_invite);
        }

        switch($status) {
        //承認必要なし
        case STATUS_C_JOIN_REQUEST_FREE:
            // 承認依頼があれば削除
            if ($c_commu_member_confirm_id = db_commu_get_c_commu_member_confirm_id($u, $target_c_commu_id)) {
                db_commu_delete_c_commu_member_confirm($c_commu_member_confirm_id);
            }
            db_commu_join_c_commu($target_c_commu_id, $u);
            do_inc_join_c_commu_send_mail($target_c_commu_id, $u);
            $p = array('target_c_commu_id' => $target_c_commu_id);
            openpne_redirect('pc', 'page_c_join_commu_2', $p);
            break;

        //管理者承認必要
        case STATUS_C_JOIN_REQUEST_NEED:
            $p = array('target_c_commu_id' => $target_c_commu_id);
            openpne_redirect('pc', 'page_c_join_request', $p);
            break;

        //承認待ち
        case STATUS_C_JOIN_WAIT:
            $p = array('target_c_commu_id' => $target_c_commu_id);
            openpne_redirect('pc', 'page_c_join_err_wait', $p);
            break;

        //既に参加
        case STATUS_C_JOIN_ALREADY:
            $p = array('target_c_commu_id' => $target_c_commu_id);
            openpne_redirect('pc', 'page_c_join_err_already', $p);
            break;
        }
    }
}

?>
