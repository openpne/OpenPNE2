<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_event_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_commu_id = $requests['target_c_commu_id'];
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
        //---

        $this->set("c_commu", db_commu_c_commu4c_commu_id2($c_commu_id));
        $this->set("year", db_commu_year4null());
        $this->set('month', p_regist_prof_c_profile_month_list4null());
        $this->set('day', p_regist_prof_c_profile_day_list4null());
        $this->set('pref', p_regist_prof_c_profile_pref_list4null());

        $this->set('event', p_c_event_add_confirm_event4request());
        $this->set('err_msg', $err_msg);
        return 'success';
    }
}
?>
