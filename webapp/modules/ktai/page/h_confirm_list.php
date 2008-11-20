<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_confirm_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        //あなたにフレンドリンクを求めているメンバーの数
        $num_from_f_confirm_list = db_friend_count_c_anatani_friend_confirm($u);
        $this->set("num_from_f_confirm_list", $num_from_f_confirm_list);

        //コミュニティ承認を求めているメンバーの数
        $num_from_h_confirm_list = db_commu_count_c_anatani_c_commu_member_confirm($u);
        $this->set("num_from_h_confirm_list", $num_from_h_confirm_list);

        //あなたにコミュニティ管理者交代を希望しているメンバーの数
        $num_from_c_commu_admin_confirm_list = db_commu_count_c_anatani_c_commu_admin_confirm($u);
        $this->set("num_from_c_commu_admin_confirm_list", $num_from_c_commu_admin_confirm_list);

        //あなたにコミュニティ副管理者を希望しているメンバーの数
        $num_from_c_commu_sub_admin_confirm_list = db_commu_count_c_anatani_c_commu_sub_admin_confirm($u);
        $this->set("num_from_c_commu_sub_admin_confirm_list", $num_from_c_commu_sub_admin_confirm_list);

        //あなたがフレンドリンクを要請している数
        $num_to_f_confirm_list = db_friend_count_c_anataga_friend_confirm($u);
        $this->set("num_to_f_confirm_list", $num_to_f_confirm_list);

        //参加要請中のコミュニティの数
        $num_to_h_confirm_list = db_commu_count_c_anataga_c_commu_member_confirm($u);
        $this->set("num_to_h_confirm_list", $num_to_h_confirm_list);

        //あなたがコミュニティ管理者交代を要請しているメンバーの数
        $num_to_c_commu_admin_confirm_list = db_commu_count_c_anataga_c_commu_admin_confirm($u);
        $this->set("num_to_c_commu_admin_confirm_list", $num_to_c_commu_admin_confirm_list);

        //あなたがコミュニティ副管理者を要請しているメンバーの数
        $num_to_c_commu_sub_admin_confirm_list = db_commu_count_c_anataga_c_commu_sub_admin_confirm($u);
        $this->set("num_to_c_commu_sub_admin_confirm_list", $num_to_c_commu_sub_admin_confirm_list);

        return 'success';
    }
}

?>
