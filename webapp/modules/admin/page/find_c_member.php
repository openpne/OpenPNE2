<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メンバー情報のリスト表示・強制退会
class admin_page_find_c_member extends OpenPNE_Action
{
    function execute($requests)
    {
        // エラーメッセージ
        $v['msg'] = $_REQUEST['msg'];
        // 検索値
        $cond_list = validate_cond($_REQUEST);
        $v['cond_list'] = $cond_list;
        // プロフ項目
        $profile_list = db_member_c_profile_list();
        $this->set('profile_list', $profile_list);

        // 年
        $year = date('Y');
        $v['years'] = get_int_assoc($year - 100, $year);
        // 最終ログイン
        $select_last_login = array(
            1 => "3日以内",
            2 => "3～7日以内",
            3 => "7～30日以内",
            4 => "30日以上",
            5 => "未ログイン",
        );
        $v['select_last_login'] = $select_last_login;
        // ポイントランク
        $v['rank_data'] = db_point_get_rank_all();

        $this->set($v);

        return 'success';
    }
}

?>
