<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 一括メッセージ送信
class admin_page_send_messages_search extends OpenPNE_Action
{
    function execute($requests)
    {
        $cond_list = validate_cond($_REQUEST);

        $profile_list = db_member_c_profile_list();
        $profile_value_list = array();

        $special_keys = array('s_year', 'e_year',
                              's_point', 'e_point',
                              'last_login',
                              'is_pc_address', 'is_ktai_address');
        foreach ($cond_list as $key => $each_cond) {
            if (in_array($key, $special_keys)) {
                continue;
            }
            $c_profile_option = db_c_profile_option4c_profile_option_id($each_cond);
            $profile_value_list[$key]['value'] = $c_profile_option['value'];
            $profile_value_list[$key]['caption'] = $profile_list[$key]['caption'];
        }
        $v['cond_list'] = $cond_list;
        $v['profile_value_list'] = $profile_value_list;

        //絞り込みのための最終ログイン時間
        $select_last_login = array(
            1 => "3日以内",
            2 => "3～7日以内",
            3 => "7～30日以内",
            4 => "30日以上",
            5 => "未ログイン",
        );
        $v['select_last_login'] = $select_last_login;

        $this->set($v);

        return 'success';
    }
}

?>
