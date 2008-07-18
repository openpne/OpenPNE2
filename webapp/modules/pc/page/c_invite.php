<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        $body = $requests['body'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi('c', $target_c_commu_id));

        //メンバー情報
        $this->set("member", db_member_c_member4c_member_id($u));
        //コミュニティID
        $this->set("c_commu_id", $target_c_commu_id);
        //コミュニティ
        $this->set("c_commu", db_commu_c_commu4c_commu_id($target_c_commu_id));
        //招待する友達リスト
        $this->set("c_invite_list", db_commu_invite_list4c_member_id4c_commu_id($u, $target_c_commu_id));

        return 'success';
    }
}

?>
