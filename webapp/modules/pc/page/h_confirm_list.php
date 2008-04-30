<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_confirm_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi', fetch_inc_navi('h'));


        // あなたにフレンドリンクを要請しているメンバー
        $this->set("anatani_c_friend_confirm_list",
                db_friend_anatani_c_friend_confirm_list4c_member_id($u));

        // あなたに(の)管理コミュニティに参加を希望しているメンバー
        $this->set("anatani_c_commu_member_confirm_list",
                db_commu_anatani_c_commu_member_confirm_list4c_member_id($u));

        // あなたにコミュニティ管理者交代を希望しているメンバー
        $this->set("anatani_c_commu_admin_confirm_list",
                db_commu_anatani_c_commu_admin_confirm_list4c_member_id($u));

        // あなたにコミュニティ副管理者を希望しているメンバー
        $this->set("anatani_c_commu_sub_admin_confirm_list",
                db_commu_anatani_c_commu_sub_admin_confirm_list4c_member_id($u));


        //---- ページ表示 ----//
        return 'success';
    }
}

?>
