<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        //ランダムフレンドリスト
        $this->set("c_friend_list", db_commu_c_friend_list_random4c_member_id4c_commu_id($u, $target_c_commu_id, 50));

        //コミュニティID
        $this->set("target_c_commu_id", $target_c_commu_id);
        $this->set("c_commu", db_commu_c_commu4c_commu_id($target_c_commu_id));


        return 'success';
    }
}

?>
