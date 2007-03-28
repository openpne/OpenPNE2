<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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
        foreach ($cond_list as $key=>$each_cond) {
            if (
                ($key == "s_year") || ($key == "e_year")
             || ($key == "s_point") || ($key == "e_point")
            ) {
                continue;
            }
            $c_profile_option = db_c_profile_option4c_profile_option_id($each_cond);
            $profile_value_list[$key]['value'] = $c_profile_option['value'];
            $profile_value_list[$key]['caption'] = $profile_list[$key]['caption'];
        }
        $v['cond_list'] = $cond_list;
        $v['profile_value_list'] = $profile_value_list;
        $this->set($v);

        return 'success';
    }
}

?>
