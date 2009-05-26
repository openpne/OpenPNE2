<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_topic_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $title = $requests['title'];
        $body = $requests['body'];
        $event_flag = $requests['event_flag'];
        $err_msg = $requests['err_msg'];
        // ----------

        //--- 権限チェック
        $c_commu = db_commu_c_commu4c_commu_id2($c_commu_id);
      
        switch ($c_commu['is_topic']) {
            case 'public' :
                //誰でも作成可能
                break;
            case 'member' :
                //コミュニティメンバー
                if (!db_commu_is_c_commu_member($c_commu_id, $u)) {
                    handle_kengen_error();
                }
                break;
            case 'admin_only' :
                //トピック作成権限チェック
                if (!db_commu_is_c_commu_admin($c_commu_id, $u)) {
                    handle_kengen_error();
                }
                break;
        }
        // ---

        $this->set('c_commu', db_commu_c_commu4c_commu_id($c_commu_id));

        return 'success';
    }
}
?>
