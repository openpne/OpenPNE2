<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//----- インクルードテンプレートの出力をfetch

/**
 * inc_navi.tpl の出力を返す
 *
 * $type が f または c の場合には、$target_id を指定する必要があります。
 *
 * @param   enum('h', 'f', 'c')  $type : ナビゲーションのタイプ
 * @param  int  $target_id : 友達のメンバーID もしくは コミュニティID
 * @return html
 */
function fetch_inc_navi($type, $target_id = null)
{
    // $type が h の場合のみ function cache
    if ($type == 'h') {
        static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

        if (!$is_recurred) {  //function cacheのために再帰処理を行う
            $is_recurred = true;
            $funcargs = func_get_args();
            $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_LONG, __FUNCTION__, $funcargs);
            $is_recurred = false;
            return $result;
        }
    }

    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->templates_dir = 'pc/templates';
    $inc_smarty->assign('PHPSESSID', md5(session_id()));

    switch ($type) {
    case 'h':
    default:
        $type = 'h';
        break;
    case 'f':
        $inc_smarty->assign('INC_NAVI_c_member_id_friend', $target_id);
        break;
    case 'c':
        $inc_smarty->assign('INC_NAVI_c_commu_id', $target_id);
        break;
    }
    $inc_smarty->assign('INC_NAVI_type', $type);
    $inc_smarty->assign('navi', util_get_c_navi($type));

    return $inc_smarty->ext_fetch('inc_navi.tpl');
}

/**
 * inc_page_header.tpl
 */
function fetch_inc_page_header($type = null)
{
    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->templates_dir = 'pc/templates';

    $v['PHPSESSID'] = md5(session_id());
    $v['INC_PAGE_HEADER_type'] = $type;
    if ($type == 'public' || $type == 'regist') {
        $v['before_after'] = 'before';
        $v['INC_PAGE_HEADER'] = db_banner_get_top_banner(false);
    } else {
        $v['before_after'] = 'after';
        $v['INC_PAGE_HEADER'] = db_banner_get_top_banner(true);
    }
    $v['top_banner_html_before'] = p_common_c_siteadmin4target_pagename('top_banner_html_before');
    $v['top_banner_html_after'] = p_common_c_siteadmin4target_pagename('top_banner_html_after');
    $inc_smarty->assign('navi', util_get_c_navi('global'));

    $inc_smarty->assign($v);
    return $inc_smarty->ext_fetch('inc_page_header.tpl');
}

/**
 * inc_page_footer.tpl
 */
function fetch_inc_page_footer($is_secure = false)
{
    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->templates_dir = 'pc/templates';

    $inc_smarty->assign('PHPSESSID', md5(session_id()));
    if ($is_secure) {
        $inc_smarty->assign('inc_page_footer',
            p_common_c_siteadmin4target_pagename('inc_page_footer_after'));
    } else {
        $inc_smarty->assign('inc_page_footer',
            p_common_c_siteadmin4target_pagename('inc_page_footer_before'));
    }

    return $inc_smarty->ext_fetch('inc_page_footer.tpl');
}

function fetch_from_db($tpl_name, &$smarty)
{
    $content = '';
    if ($smarty->template_exists($tpl_name)) {
        $security = $smarty->security;
        $smarty->security = true;
        $content = $smarty->fetch($tpl_name);
        $smarty->security = $security;
    }
    return $content;
}

function fetch_inc_entry_point(&$smarty, $target)
{
    $list = get_inc_entry_point_list();
    if (empty($list[$target])) {
        return false;
    }
    list($start, $end, $caption) = $list[$target];

    $contents = array();
    for ($i = (int)$start; $i <= (int)$end; $i++) {
        $tpl = sprintf('db:inc_entry_point_%s_%d', $target, $i);
        $contents[$i] = fetch_from_db($tpl, $smarty);
    }
    return $contents;
}

function get_inc_entry_point_list()
{
    $list = array(
        'h_home' => array(1, 13, '【PC版】 h_home'),
        'f_home' => array(1, 9, '【PC版】 f_home (h_prof)'),
        'c_home' => array(1, 7, '【PC版】 c_home'),
        'h_reply_message' => array(1, 3, '【PC版】 h_reply_message'),
        'h_diary_add' => array(1, 3, '【PC版】 h_diary_add'),
        'h_diary_edit' => array(1, 3, '【PC版】 h_diary_edit'),
        'ktai_o_login' => array(1, 2, '【携帯版】 o_login'),
        'ktai_h_home' => array(1, 3, '【携帯版】 h_home'),
        'ktai_f_home' => array(1, 3, '【携帯版】 f_home'),
        'ktai_c_home' => array(1, 3, '【携帯版】 c_home'),
    );
    return $list;
}

//------------

function get_int_assoc($from, $to)
{
    $from = intval($from);
    $to = intval($to);
    if ($from > $to) return array();

    for ($i = $from; $i <= $to; $i++) {
        $assoc[$i] = $i;
    }
    return $assoc;
}

/** 月リスト */
function p_regist_prof_c_profile_month_list4null()
{
    return get_int_assoc(1, 12);
}

/** 日リスト */
function p_regist_prof_c_profile_day_list4null()
{
    return get_int_assoc(1, 31);
}

//------------

function p_c_event_add_confirm_event4request($get_errors = false)
{
    $rule = array(
        'target_c_commu_id' => array(
            'type' => 'int',
            'default' => '',
        ),
        'title' => array(
            'type' => 'string',
            'required' => '1',
            'caption' => 'タイトル',
        ),
        'open_date_year' => array(
            'type' => 'int',
            'default' => '',
        ),
        'open_date_month' => array(
            'type' => 'int',
            'default' => '',
        ),
        'open_date_day' => array(
            'type' => 'int',
            'default' => '',
        ),
        'open_date_comment' => array(
            'type' => 'string',
            'default' => '',
        ),
        'open_pref_id' => array(
            'type' => 'int',
            'default' => '',
        ),
        'open_pref_comment' => array(
            'type' => 'string',
            'default' => '',
        ),
        'detail' => array(
            'type' => 'string',
            'required' => '1',
            'caption' => '詳細',
        ),
        'invite_period_year' => array(
            'type' => 'int',
            'default' => '',
        ),
        'invite_period_month' => array(
            'type' => 'int',
            'default' => '',
        ),
        'invite_period_day' => array(
            'type' => 'int',
            'default' => '',
        ),
        'image_filename1' => array(
            'type' => 'string',
            'default' => '',
        ),
        'image_filename2' => array(
            'type' => 'string',
            'default' => '',
        ),
        'image_filename3' => array(
            'type' => 'string',
            'default' => '',
        ),
        'capacity' => array(
            'type' => 'int',
            'default' => '0',
            'min' => '0',
            'caption' => '募集人数',
        ),
    );
    $validator = new OpenPNE_Validator($rule, $_REQUEST);

    $errors = array();
    if (!$validator->validate()) {

        $errors = $validator->getErrors();
    }
    $result = $validator->getParams();
    $result['c_commu_id'] = $result['target_c_commu_id'];

    if ($get_errors) {
        return array($result, $errors);
    } else {
        return $result;
    }
}

function p_f_home_last_login4access_date($access_date)
{
    if (!$access_date || $access_date == '0000-00-00 00:00:00') {
        return '未ログイン';
    }

    $diff = time() - strtotime($access_date);

    $m_diff = ceil($diff / 60);         //時間差:分
    $h_diff = ceil($diff / (60*60));    //時間差:時
    $d_diff = ceil($diff / (60*60*24)); //時間差:日

    if ($m_diff <= 60) {  // 1時間以内
        if ($m_diff<= 3) {
            $last_login = '3分以内';
        } elseif ($m_diff <= 5) {
            $last_login = '5分以内';
        } elseif ($m_diff <= 10) {
            $last_login = '10分以内';
        } elseif ($m_diff <= 15) {
            $last_login = '15分以内';
        } elseif ($m_diff <= 30) {
            $last_login = '30分以内';
        } elseif ($m_diff <= 45) {
            $last_login = '45分以内';
        } else {
            $last_login = '60分以内';
        }
    } elseif ($h_diff <= 24) {
        $last_login = $h_diff . '時間以内';
    } elseif ($d_diff <= 3) {
        $last_login = $d_diff . '日以内';
    } else {
        $last_login = '3日以上';
    }

    return $last_login;
}

/**
 * ある日まであと何日かを計算する
 *
 * @param int $month
 * @param int $day
 * @return int 日数
 */
function getCountdownDays($month, $day)
{
    $month = (int)$month;
    $day = (int)$day;

    // 月または日が未登録な場合エラーを返す
    if ($month == 0 || $day == 0) {
        return -1;
    }

    $year = date('Y');

    // 今日の00:00:00
    $today = mktime(0, 0, 0);

    $theday_thisyear = mktime(0, 0, 0, $month, $day, $year);
    $theday_nextyear = mktime(0, 0, 0, $month, $day, $year + 1);

    if ($theday_thisyear < $today) {
        $theday_next = $theday_nextyear;
    } else {
        $theday_next = $theday_thisyear;
    }

    // 24 * 60 * 60 = 86400
    return ($theday_next - $today) / 86400;
}

/**
 * 生年月日から年齢を計算する
 */
function getAge($year, $month, $day)
{
    $this_year = intval(date('Y'));
    $today = intval(date('nd'));

    $age = $this_year - $year;
    if ($today < $month * 100 + $day) $age--;

    return $age;
}

/**
 * 引用符を付ける
 */
function message_body2inyou($string)
{
    if (!empty($string)) {
        //返信用に引用符をつける
        $string = '> '.$string;
        $string = str_replace("\r\n", "\n", $string);
        $string = str_replace("\r", "\n", $string);
        $string = str_replace("\n", "\n> ", $string);
    }
    return $string;
}

?>
