<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function admin_fetch_inc_header($display_navi = true, $custom_header = '')
{
    $v['display_navi'] = $display_navi;
    $v['PHPSESSID'] = md5(session_id());
    $v['module_name'] = ADMIN_MODULE_NAME;
    $v['auth_type'] = admin_get_auth_type();
    $v['CURRENT_ACTION'] = $GLOBALS['__Framework']['current_action'];
    $v['custom_header'] = $custom_header;
    $v['enable_module_list'] = db_admin_enabled_module_config_list();

    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->templates_dir = 'admin/templates';
    $inc_smarty->assign($v);

    $inc_smarty->assign_by_ref('hash_tbl', AdminHashTable::singleton());

    return $inc_smarty->ext_fetch('inc_header.tpl');
}

function admin_fetch_inc_footer($is_secure = true)
{
    $inc_smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $inc_smarty->templates_dir = 'admin/templates';
    $inc_smarty->assign('is_secure', $is_secure);
    return $inc_smarty->ext_fetch('inc_footer.tpl');
}

function admin_make_pager($page, $page_size, $total_num)
{
    if ($total_num == 0) {
        return;
    }
    $pager = array(
        'page' => $page,
        'page_size' => $page_size,
        'total_num' => $total_num,
        'start_num' => ($page - 1) * $page_size + 1,
        'end_num' => $page * $page_size,
        'total_page' => ceil($total_num / $page_size),
        'prev_page' => 0,
        'next_page' => 0,
    );

    // 表示している最後の番号
    if ($pager['end_num'] > $pager['total_num'])
        $pager['end_num'] = $pager['total_num'];

    // 前ページ
    if ($pager['page'] > 1)
        $pager['prev_page'] = $page - 1;

    // 次ページ
    if ($pager['end_num'] < $pager['total_num'])
        $pager['next_page'] = $page + 1;

    $disp_first = max(($page - 10), 1);
    $disp_last = min(($page + 9), $pager['total_page']);
    for (; $disp_first <= $disp_last; $disp_first++) {
        $pager['disp_pages'][] = $disp_first;
    }

    return $pager;
}

function admin_insert_c_image($upfile_obj, $filename)
{
    if ($upfile_obj &&
        is_uploaded_file($upfile_obj['tmp_name']) &&
        db_image_insert_c_image2($filename, $upfile_obj['tmp_name']) > 0)
    {
        return $filename;
    }

    return false;
}

/**
 * 指定したアクションにリダイレクトする
 *
 * 引数 $tail は文字列と配列の両方を許容する。
 * 文字列を指定した場合、URLに $tail がそのまま付加される。
 * 配列を指定した場合、キーと要素を元にパラメータを生成し、URLに付加する。
 *
 * @param string $p    リダイレクト先のページ
 * @param string $msg    エラーメッセージ
 * @param mixied $tail    URLに付加する文字列かパラメータ
 */
function admin_client_redirect($p, $msg = '', $tail = '')
{
    if (is_array($tail)) {
        $_tail_list = array();
        foreach ($tail as $key => $value) {
            $_tail_list[] = $key . '=' . urlencode($value);
        }
        $tail = '';
        $tail = implode('&', $_tail_list);
    }

    if (OPENPNE_ADMIN_URL) {
        $url = OPENPNE_ADMIN_URL;
    } else {
        $url = openpne_gen_url_head('admin', 'page_' . $p, true);
    }
    if (need_ssl_param('admin', 'page_' . $p)) {
        if ($tail) {
            $tail .= '&';
        }
        $tail .= 'ssl_param=1';
    }

    $hash_tbl =& AdminHashTable::singleton();

    $m = ADMIN_MODULE_NAME;
    $p = $hash_tbl->hash($p);

    $url .= "?m=$m&a=page_$p";
    if ($tail) $url .= "&$tail";
    if ($msg)  $url .= '&msg=' . urlencode($msg);

    client_redirect_absolute($url);
}

function admin_get_auth_type()
{
    if (is_callable(array($GLOBALS['AUTH'], 'uid'))) {
        $uid = $GLOBALS['AUTH']->uid();
        return db_admin_get_auth_type($uid);
    } else {
        return false;
    }
}

//IPアドレスとして正しいか
//例：XXX.XXX.XXX.XXX
function admin_is_ip($ip)
{
    return preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/',$ip);
}

//APIを許容するIPアドレスとして正しいか
//XXX.XXX.XXX.XXX or *(アスタリスク) or 空
function admin_api_is_ip($ip)
{
    if (!$ip || $ip == '*') {
        return true;
    } else {
        return admin_is_ip($ip);
    }
}

/***
 * CMD（小窓）ディレクトリ内のCMDファイルリストを取得する
 *
 * @return array CMDファイルリスト
 */
function admin_get_cmd_file_list()
{
    $dir = OPENPNE_PUBLIC_HTML_DIR . '/cmd';

    if (!is_dir($dir)) {
        return array();
    }

    $filelist = array();

    if ($handle = opendir($dir)) {
        while (($filename = readdir($handle)) !== false) {
            if (array_pop(explode('.', $filename)) == 'js') {
                $filelist[] = basename($filename, '.js');
            }
        }
        closedir($handle);
    }

    return $filelist;
}

?>
