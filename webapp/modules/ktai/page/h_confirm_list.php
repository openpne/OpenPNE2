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

        //あなたにフレンド認証を求めいるメンバーリスト
        $from_f_confirm_list = db_friend_anatani_c_friend_confirm_list4c_member_id($u);
        $this->set("from_f_confirm_list", $from_f_confirm_list);
        //そのメンバーの人数
        $this->set("num_from_f_confirm_list", count($from_f_confirm_list));

        //コミュニティ承認を求めているメンバーリスト
        $from_h_confirm_list = db_commu_anatani_c_commu_member_confirm_list4c_member_id($u);
        $this->set("from_h_confirm_list", $from_h_confirm_list);
        //そのメンバーの人数
        $this->set("num_from_h_confirm_list", count($from_h_confirm_list));

        //あなたにコミュニティ管理者交代を希望しているメンバー
        $from_c_commu_admin_confirm_list = db_commu_anatani_c_commu_admin_confirm_list4c_member_id($u);
        $this->set("from_c_commu_admin_confirm_list", $from_c_commu_admin_confirm_list);
        //そのメンバーの人数
        $this->set("num_from_c_commu_admin_confirm_list", count($from_c_commu_admin_confirm_list));

        //あなたにコミュニティ副管理者を希望しているメンバー
        $from_c_commu_sub_admin_confirm_list = db_commu_anatani_c_commu_sub_admin_confirm_list4c_member_id($u);
        $this->set("from_c_commu_sub_admin_confirm_list", $from_c_commu_sub_admin_confirm_list);
        //そのメンバーの人数
        $this->set("num_from_c_commu_sub_admin_confirm_list", count($from_c_commu_sub_admin_confirm_list));

        //リンク申請出した人のリスト
        $to_f_confirm_list = db_friend_ktai_anataga_c_friend_confirm_list4c_member_id($u);
        $this->set("to_f_confirm_list", $to_f_confirm_list);
        //そのメンバーの人数
        $this->set("num_to_f_confirm_list", count($to_f_confirm_list));

        //参加申請出したコミュニティに関するリスト
        $to_h_confirm_list = db_commu_anataga_c_commu_member_confirm_list4c_member_id($u);
        $this->set("to_h_confirm_list", $to_h_confirm_list);
        //そのメンバーの人数
        $this->set("num_to_h_confirm_list", count($to_h_confirm_list));

        //あなたがコミュニティ管理者交代を要請しているメンバー
        $to_c_commu_admin_confirm_list = db_commu_anataga_c_commu_admin_confirm_list4c_member_id($u);
        $this->set("to_c_commu_admin_confirm_list", $to_c_commu_admin_confirm_list);
        //そのメンバーの人数
        $this->set("num_to_c_commu_admin_confirm_list", count($to_c_commu_admin_confirm_list));

        //あなたがコミュニティ副管理者を要請しているメンバー
        $to_c_commu_sub_admin_confirm_list = db_commu_anataga_c_commu_sub_admin_confirm_list4c_member_id($u);
        $this->set("to_c_commu_sub_admin_confirm_list", $to_c_commu_sub_admin_confirm_list);
        //そのメンバーの人数
        $this->set("num_to_c_commu_sub_admin_confirm_list", count($to_c_commu_sub_admin_confirm_list));

        return 'success';
    }
}

?>
