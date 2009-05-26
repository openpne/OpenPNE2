<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メンバー情報のリスト表示・強制退会
class admin_page_list_c_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $order = $requests['order'];
        $cond = substr($_REQUEST['cond'], 1);
        $temp_list = explode('&', $cond);
        foreach ($temp_list as $value) {
            $temp_list2 = explode('=', $value);
            $_REQUEST[$temp_list2[0]] = $temp_list2[1];
        }

        $v = array();
        $pager = array();
        //絞り込み条件作成
        $cond_list = validate_cond($_REQUEST);
        $v['cond_list'] = $cond_list;

        $cond = '';
        foreach ($cond_list as $key => $value) {
            if (is_array($value)) {
              foreach ( $value as $prof_key => $profile_value ) {
                 if ( is_array($profile_value) ) {
                     foreach ( $profile_value as $check_value ) {
                         $cond .= '&'.$key. urlencode('['). $prof_key . urlencode('][]') .'='. urlencode($check_value);
                     }
                 } else {
                     $cond .= '&'.$key. urlencode('['). $prof_key . urlencode(']') .'='. urlencode($profile_value);
                 }
              }
            } else {
                $cond .= '&'.$key.'='. urlencode($value);
            }
        }

        $v['cond'] = $cond;

        //絞り込みのための年
        $year = date('Y');
        $v['years'] = get_int_assoc($year - 100, $year);

        //絞り込みのドロップダウンを作る用
        $v['profile_list'] = db_member_c_profile_list();;

        //絞り込みのための最終ログイン時間
        $select_last_login = array(
            1 => "3日以内",
            2 => "3～7日以内",
            3 => "7～30日以内",
            4 => "30日以上",
            5 => "未ログイン",
        );
        $v['select_last_login'] = $select_last_login;

        $v['rank_data'] = db_point_get_rank_all();

        //開始年が終了年より大きい
        if ( !empty($cond_list['s_year']) && !empty($cond_list['e_year']) && ($cond_list['s_year'] > $cond_list['e_year']) ) {
            $msg = '※開始年は終了年より小さくして下さい';
        }

        //ランクが開始＞終了 
        if (!is_null($cond_list['s_rank']) && !is_null($cond_list['e_rank']) && ($cond_list['s_rank'] > $cond_list['e_rank']) ) {
            $msg = '※開始ランクは終了ランクより小さくして下さい';
        }

        if ( $msg ) {
            $v['msg'] = $msg;
        }

        // 表示用検索データ
        $v['cond_name_data'] = cond_name_list($cond_list, $select_last_login);

        $v['SNS_NAME'] = SNS_NAME;
        $v['c_profile_list'] = db_member_c_profile_list4null();
        $v['c_member_list'] = array();

        // メンバー検索対応により、メールアドレス検索、ログインID検索ともに下記関数に統合 
        $v['c_member_list'] = _db_admin_c_member_list($requests['page'], $requests['page_size'], $pager, $cond_list, $order);
 
        foreach ($v['c_member_list'] as $key => $value) {
            $v['c_member_list'][$key]['c_member_invite'] =
                db_member_c_member4c_member_id_LIGHT($value['c_member_id_invite']);
            $v['c_member_list'][$key]['c_rank'] =
                db_point_get_rank4point($value['profile']['PNE_POINT']['value']);
            $v['c_member_list'][$key]['is_receive_any_mail'] = 
                db_admin_is_receive_any_mail4c_member_id($value['c_member_id']);
        }

        $v['pager'] = $pager;
        $this->set($v);
        return 'success';
    }
}

?>
