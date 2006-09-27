<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_g_join_group extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_id = $requests['target_id'];
        // ----------

/*      $status = do_common_get_c_join_status($u, $target_id);
        switch($status){
        //承認必要なし
        case STATUS_C_JOIN_REQUEST_FREE:
            break;

        //管理者承認必要
        case STATUS_C_JOIN_REQUEST_NEED:
            client_redirect_absolute("page.php?p=c_join_request&target_c_commu_id=$target_c_commu_id");
            exit;

        //承認待ち
        case STATUS_C_JOIN_WAIT:
            client_redirect_absolute("page.php?p=c_join_err_wait&target_c_commu_id=$target_c_commu_id");
            exit;

        //既に参加
        case STATUS_C_JOIN_ALREADY:
            client_redirect_absolute("page.php?p=c_join_err_already&target_c_commu_id=$target_c_commu_id");
            exit;
        }*/

        $this->set('group', biz_getGroupData($target_id));

        return 'success';
    }
}

?>
