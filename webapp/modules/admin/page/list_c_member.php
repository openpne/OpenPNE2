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

        $v = array();
        $pager = array();

        //絞り込み条件作成
        $cond_list = validate_cond((array)$_REQUEST['cond']);
        $v['cond_list'] = $cond_list;

        $cond = '';
        foreach ($cond_list as $key => $value) {
            $cond .= '&cond['.$key.']='.$value;
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
            $v['msg'] = '※開始年は終了年より小さくして下さい';
        }

        $v['SNS_NAME'] = SNS_NAME;
        $v['c_profile_list'] = db_member_c_profile_list4null();
        $v['c_member_list'] = array();
        if ($requests['mail_address']) {
            $v['c_member_list'] = db_admin_c_member4mail_address($requests['mail_address']);
        } elseif ($requests['username'] && OPENPNE_AUTH_MODE != 'email') {
            if ($c_member = db_admin_c_member4username($requests['username'])) {
                $v['c_member_list'] = array($c_member);
            }
        } else {
            $v['c_member_list'] = _db_admin_c_member_list($requests['page'], $requests['page_size'], $pager, $cond_list, $order);
        }
        foreach ($v['c_member_list'] as $key => $value) {
            $v['c_member_list'][$key]['c_member_invite'] =
                db_member_c_member4c_member_id_LIGHT($value['c_member_id_invite']);
            $v['c_member_list'][$key]['c_rank'] =
                db_point_get_rank4point($value['profile']['PNE_POINT']['value']);
        }

        $v['pager'] = $pager;
        $this->set($v);
        return 'success';
    }
}

?>
