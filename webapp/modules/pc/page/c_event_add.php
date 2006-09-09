<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_c_event_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();


        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
        $err_msg = $requests['err_msg'];
        // ----------

        //--- 権限チェック
        //コミュニティメンバー
        if (!_db_is_c_commu_member($c_commu_id, $u)) {
            $_REQUEST['target_c_commu_id'] = $c_commu_id;
            $_REQUEST['msg'] = "イベント作成をおこなうにはコミュニティに参加する必要があります";
            openpne_forward('pc', 'page', "c_home");
            exit();
        }
        //---

        $this->set('inc_navi', fetch_inc_navi('c', $c_commu_id));

        $this->set("c_commu", p_c_home_c_commu4c_commu_id($c_commu_id));
        $this->set("year", p_c_event_add_year4null());
        $this->set('month', p_regist_prof_c_profile_month_list4null());
        $this->set('day', p_regist_prof_c_profile_day_list4null());
        $this->set('pref', p_regist_prof_c_profile_pref_list4null());

        $this->set('event', p_c_event_add_confirm_event4request());
        $this->set('err_msg', $err_msg);
        return 'success';
    }
}
?>
