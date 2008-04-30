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

        //リンク承認待ちリスト
        $this->set("anatani_c_friend_confirm_list", db_friend_ktai_anatani_c_friend_confirm_list4c_member_id($u));

        //コミュニティ参加承認待ちリスト
        $this->set("anatani_c_commu_member_confirm_list", db_commu_anatani_c_commu_member_confirm_list4c_member_id($u));

        // あなたにコミュニティ管理者交代を希望しているメンバー
        $this->set("anatani_c_commu_admin_confirm_list",
            db_commu_anatani_c_commu_admin_confirm_list4c_member_id($u));

        // あなたにコミュニティ副管理者を希望しているメンバー
        $this->set("anatani_c_commu_sub_admin_confirm_list",
            db_commu_anatani_c_commu_sub_admin_confirm_list4c_member_id($u));

        //リンク申請出した人のリスト
        $this->set("anataga_c_friend_confirm_list", db_friend_ktai_anataga_c_friend_confirm_list4c_member_id($u));

        //参加申請出したコミュニティに関するリスト
        $this->set("anataga_c_commu_member_confirm_list", db_commu_anataga_c_commu_member_confirm_list4c_member_id($u));

        // あなたがコミュニティ管理者交代を要請しているメンバー
        $this->set("anataga_c_commu_admin_confirm_list",
            db_commu_anataga_c_commu_admin_confirm_list4c_member_id($u));

        // あなたがコミュニティ副管理者を要請しているメンバー
        $this->set("anataga_c_commu_sub_admin_confirm_list",
            db_commu_anataga_c_commu_sub_admin_confirm_list4c_member_id($u));


        return 'success';
    }
}

?>
