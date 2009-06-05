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
        $cond_list = validate_cond($_REQUEST['cond']);
        $profile_cond_list = validate_profile_cond($_REQUEST['profile']);

        $profile_value_list = array();
        foreach ($profile_cond_list as $key => $each_cond) {

            // form_type:checkbox
            if (is_array($each_cond)) {
                $value = '';
                foreach ($each_cond as $option_id) {
                    if ($value) $value .= ', ';
                    $value .= db_c_profile_get_profile_value4requested_profile($key, $option_id);
                }
            } else {
                $value = db_c_profile_get_profile_value4requested_profile($key, $each_cond);

                // form_type:text,textarea
                if (is_null($value)) {
                    $value = '「' . $each_cond . '」を含む';
                }
            }
            $profile_value_list[$key]['caption'] = db_c_profile_get_caption4name($key);
            $profile_value_list[$key]['value']   = $value;
        }

        // 絞り込み条件が無い場合はリダイレクト
        if (!$cond_list && !$profile_value_list) {
            openpne_redirect('admin', 'page_send_messages_all');
        }

        $v['cond_list'] = $cond_list;
        $v['profile_cond_list'] = $profile_cond_list;
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

        if ($cond_list['s_rank']) {
            $v['s_rank'] = db_point_get_rank4rank_id($cond_list['s_rank']);
        }

        if ($cond_list['e_rank']) {
            $v['e_rank'] = db_point_get_rank4rank_id($cond_list['e_rank']);
        }

        $this->set($v);

        return 'success';
    }
}

?>
