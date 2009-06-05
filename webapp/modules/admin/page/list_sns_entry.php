<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 承認依頼ユーザ一覧
class admin_page_list_sns_entry extends OpenPNE_Action
{
    function execute($requests)
    {
        $order = $requests['order'];
        $mail_address = $requests['mail_address'];

        $v = array();
        $pager = array();

        //絞り込み条件作成
        $cond_list = validate_cond((array)$_REQUEST['cond']);
        $v['cond_list'] = $cond_list;
        $cond = '';
        foreach ($cond_list as $key => $value) {
            $cond .= '&cond['.$key.']='.$value;
        }
        $profile_cond_list = validate_profile_cond((array)$_REQUEST['profile']);
        $v['profile_cond_list'] = $profile_cond_list;

        foreach ($profile_cond_list as $key => $value) {
            $cond .= '&profile['.$key.']=' . (int)$value;
        }

        $v['cond'] = $cond;

        //絞り込みのための年
        $year = date('Y');
        $v['years'] = get_int_assoc($year - 100, $year);

        //絞り込みのドロップダウンを作る用
        $v['profile_list'] = db_member_c_profile_list();;

        //開始年が終了年より大きい
        if ( !empty($cond_list['s_year']) && !empty($cond_list['e_year']) && ($cond_list['s_year'] > $cond_list['e_year']) ) {
            $v['msg'] = '※開始年は終了年より小さくして下さい';
        }

        $v['SNS_NAME'] = SNS_NAME;
        $v['c_member_pre_list'] = _db_admin_c_member_pre_list($requests['page'], $requests['page_size'], $pager, $cond_list, $mail_address , $order);
        $v['pager'] = $pager;
        $this->set($v);
        return 'success';
    }
}

?>
