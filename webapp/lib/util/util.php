<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * リダイレクト
 * 
 * @param string $module
 * @param string $action
 * @param array  $params
 */
function openpne_redirect($module, $action = '', $params = array())
{
    if ($module == 'ktai') {
        if (session_id()) {
            $params['ksid'] = session_id();
        }
    }
    $url = openpne_gen_url($module, $action, $params);
    client_redirect_absolute($url);
}

/**
 * クライアントリダイレクト
 * 
 * @param   string  $dest ジャンプ先URI(絶対パス)
 */
function client_redirect_absolute($dest)
{
    // 改行文字を削除
    $dest = str_replace(array("\r", "\n"), '', $dest);
    header('Location: '. $dest);
    exit;
}

/**
 * クライアントリダイレクト(ログインページ)
 */
function client_redirect_login()
{
    client_redirect_absolute(get_login_url());
}

/**
 * ログインページを取得
 * 
 * @return string ログインページURL
 */
function get_login_url()
{
    if (LOGIN_URL_PC) {
        return LOGIN_URL_PC;
    } else {
        return openpne_gen_url('pc', 'page_o_login');
    }
}

//---

/**
 * URLを生成
 */
function openpne_gen_url($module, $action = '', $params = array(), $absolute = true, $force = false)
{
    switch ($force) {
    case 'ssl':
        $url = OPENPNE_SSL_URL;
        break;
    case 'nonssl':
        $url = OPENPNE_URL;
        break;
    default:
        $url = openpne_gen_url_head($module, $action, $absolute);
        break;
    }

    $p = array('m' => $module, 'a' => $action) + (array)$params;
    if (need_ssl_param($module, $action, $force)) {
        $p['ssl_param'] = 1;
    } else {
        unset($p['ssl_param']);
    }

    include_once 'PHP/Compat/Function/http_build_query.php';
    if ($q = http_build_query($p)) {
        $url .= '?' . $q;
    }
    return $url;
}

function openpne_gen_url_head($module, $action = '', $absolute = true)
{
    if (OPENPNE_USE_PARTIAL_SSL) {
        switch (openpne_ssl_type($module, $action)) {
        case 'SSL_REQUIRED':
            $head = ($absolute || !is_ssl()) ? OPENPNE_SSL_URL : './';
            break;
        case 'SSL_SELECTABLE':
            if ($absolute) {
                $head = (is_ssl()) ? OPENPNE_SSL_URL : OPENPNE_URL;
            } else {
                $head = './';
            }
            break;
        case 'SSL_DISABLED':
            $head = ($absolute || is_ssl()) ? OPENPNE_URL : './';
            break;
        }
    } else {
        $head = ($absolute) ? OPENPNE_URL : './';
    }
    return $head;
}

//---

/**
 * module / action が部分SSL対象かどうかを判別する
 */
function openpne_ssl_type($m, $a)
{
    if (in_array($a, (array)$GLOBALS['_OPENPNE_SSL_REQUIRED'][$m]) ||
        in_array($m, (array)$GLOBALS['_OPENPNE_SSL_REQUIRED_MODULES'])
    ) {
        $type = 'SSL_REQUIRED';
    } elseif (in_array($a, (array)$GLOBALS['_OPENPNE_SSL_SELECTABLE'][$m])) {
        $type = 'SSL_SELECTABLE';
    } else {
        $type = 'SSL_DISABLED';
    }
    return $type;
}

/**
 * 現在のリクエストがSSL通信であるかどうかを判別
 */
function is_ssl()
{
    static $is_ssl;
    if (!isset($is_ssl)) {
        if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') {
            $is_ssl = true;
        } elseif (OPENPNE_USE_SSL_PARAM && !empty($_REQUEST['ssl_param'])) {
            $is_ssl = true;
        } else {
            $is_ssl = false;
        }
    }
    return $is_ssl;
}

function need_ssl_param($module, $action = '', $force = false)
{
    $need = false;
    if (OPENPNE_USE_PARTIAL_SSL && OPENPNE_USE_SSL_PARAM) {
        switch ($force) {
        case 'ssl':
            $need = true;
            break;
        case 'nonssl':
            $need = false;
            break;
        default:
            switch (openpne_ssl_type($module, $action)) {
            case 'SSL_REQUIRED':
                $need = true;
                break;
            case 'SSL_SELECTABLE':
                $need = is_ssl();
                break;
            case 'SSL_DISABLED':
                break;
            }
            break;
        }
    }
    return $need;
}

//---

function is_ktai_mail_address($mail)
{
    $pieces = explode('@', $mail);
    $domain = array_pop($pieces);

    return in_array($domain, $GLOBALS['OpenPNE']['KTAI_DOMAINS']);
}

function db_common_is_mailaddress($value)
{
    if (preg_match('/^[^:;@,\s]+@\w[\w\-.]*\.[a-zA-Z]+$/', $value)) {
        return true;
    } else {
        return false;
    }
}

//---

function _mt_srand()
{
    if (version_compare(phpversion(), '4.2.0', '<')) {
        list($usec, $sec) = explode(' ', microtime());
        $seed = (float)$sec + ((float)$usec * 100000);

        mt_srand($seed);
    }
}

function do_common_create_password($length = 8)
{
    // パスワードに使用する文字
    $elem = 'abcdefghkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ2345679';
    $max = strlen($elem) - 1;

    _mt_srand();
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        $password .= substr($elem, mt_rand(0, $max), 1);
    }
    return $password;
}

function create_hash()
{
    _mt_srand();
    return md5(uniqid(mt_rand(), true));
}

//---

function &get_crypt_blowfish()
{
    static $singleton;
    if (empty($singleton)) {
        if (OPENPNE_USE_OLD_CRYPT_BLOWFISH) {
            include_once 'Crypt/BlowfishOld.php';
            $singleton = new Crypt_BlowfishOld(ENCRYPT_KEY);
        } else {
            include_once 'Crypt/Blowfish.php';
            $singleton = new Crypt_Blowfish(ENCRYPT_KEY);
        }
    }
    return $singleton;
}

/**
 * 可逆的な暗号化をする
 * 
 * @param string $str 平文
 * @return string 暗号文
 */
function t_encrypt($str)
{
    if (!$str) return '';

    $bf =& get_crypt_blowfish();
    $str = $bf->encrypt($str);

    //base64
    $str = base64_encode($str);

    return $str;
}

/**
 * 可逆的な暗号を復号化する
 * 
 * @param string $str 暗号文
 * @return string 平文
 */
function t_decrypt($str)
{
    if (!$str) return '';

    //base64
    $str = base64_decode($str);

    $bf =& get_crypt_blowfish();
    return rtrim($bf->decrypt($str));
}

function t_wordwrap($str, $width = 80, $break = "\n")
{
    if (!$width) {
        return $str;
    }

    $lines = explode($break, $str);
    foreach ($lines as $key => $line) {
        if (mb_strwidth($line) > $width) {
            $new_line = '';
            do {
                if ($new_line) {
                    $new_line .= $break;
                }
                $tmp = mb_strimwidth($line, 0, $width);
                $new_line .= $tmp;
                $line = substr($line, strlen($tmp));
            } while (strlen($line) > 0);
            $lines[$key] = $new_line;
        }
    }
    return implode($break, $lines);
}

function util_is_unused_mail($name)
{
    $unused = explode(',', UNUSED_MAILS);
    return in_array($name, $unused);
}

function util_get_c_navi($navi_type = 'h')
{
    switch ($navi_type) {
    case 'global':
        $navi_type = 'global';
        $navi = array(
            array('url' => '?m=pc&a=page_h_search', 'caption' => 'メンバー検索'),
            array('url' => '?m=pc&a=page_h_com_find_all', 'caption' => 'コミュニティ検索'),
            array('url' => '?m=pc&a=page_h_review_search', 'caption' => 'レビュー検索'),
            array('url' => '?m=pc&a=page_h_home', 'caption' => 'マイホーム'),
            array('url' => '?m=pc&a=page_h_invite', 'caption' => '友人を誘う'),
            array('url' => '?m=pc&a=page_h_diary_list_all', 'caption' => '最新日記'),
            array('url' => '?m=pc&a=page_h_ranking', 'caption' => 'ランキング'),
            array('url' => '?m=pc&a=page_h_config', 'caption' => '設定変更'),
        );
        break;
    case 'h':
    default:
        $navi_type = 'h';
        $navi = array(
            array('url' => '?m=pc&a=page_h_home', 'caption' => 'ホーム'),
            array('url' => '?m=pc&a=page_fh_friend_list', 'caption' => WORD_MY_FRIEND),
            array('url' => '?m=pc&a=page_fh_diary_list', 'caption' => '日記'),
            array('url' => '?m=pc&a=page_h_message_box', 'caption' => 'メッセージ'),
            array('url' => '?m=pc&a=page_h_ashiato', 'caption' => 'あしあと'),
            array('url' => '?m=pc&a=page_h_bookmark_list', 'caption' => 'お気に入り'),
            array('url' => '?m=pc&a=page_fh_review_list_member', 'caption' => 'マイレビュー'),
            array('url' => '?m=pc&a=page_h_prof', 'caption' => 'マイページ確認'),
            array('url' => '?m=pc&a=page_h_config_prof', 'caption' => 'プロフィール変更'),
        );
        break;
    case 'f':
        $navi = array(
            array('url' => '?m=pc&a=page_f_home', 'caption' => 'ホーム'),
            array('url' => '?m=pc&a=page_fh_friend_list', 'caption' => WORD_FRIEND),
            array('url' => '?m=pc&a=page_fh_diary_list', 'caption' => '日記を読む'),
            array('url' => '?m=pc&a=page_f_message_send', 'caption' => 'メッセージを送る'),
            array('url' => '?m=pc&a=page_f_bookmark_add', 'caption' => 'お気に入りに追加'),
            array('url' => '?m=pc&a=page_fh_review_list_member', 'caption' => 'レビュー'),
            array('url' => '?m=pc&a=page_f_invite', 'caption' => WORD_MY_FRIEND.'に紹介'),
            array('url' => '?m=pc&a=page_f_link_request', 'caption' => WORD_MY_FRIEND.'に追加'),
            array('url' => '?m=pc&a=page_f_intro_edit', 'caption' => '紹介文を書く'),
        );
        break;
    case 'c':
        $navi = array(
            array('url' => '?m=pc&a=page_c_home', 'caption' => 'コミュニティトップ'),
            array('url' => '?m=pc&a=page_c_topic_list', 'caption' => '掲示板'),
            array('url' => '?m=pc&a=page_c_member_review', 'caption' => 'おすすめレビュー'),
            array('url' => '?m=pc&a=page_c_join_commu', 'caption' => 'コミュニティに参加'),
            array('url' => '?m=pc&a=page_c_invite', 'caption' => WORD_MY_FRIEND.'に紹介'),
            array('url' => '?m=pc&a=page_c_leave_commu', 'caption' => 'コミュニティを退会'),
        );
        break;
    }
    $db = db_get_c_navi($navi_type);
    foreach ($db as $value) {
        $i = $value['sort_order'] - 1;
        $navi[$i] = array('url' => $value['url'], 'caption' => $value['caption']);
    }
    return $navi;
}

/**
 * checkdate の wrapper function
 * Warning 対策
 */
function t_checkdate($month, $day, $year)
{
    return checkdate(intval($month), intval($day), intval($year));
}

/**
 * Date_Calc::isFutureDate の wrapper function
 */
function t_isFutureDate($day, $month, $year)
{
    include_once 'Date/Calc.php';
    return Date_Calc::isFutureDate(intval($day), intval($month), intval($year));
}

//---

/**
 * Check c_diary.public_flag
 * 
 * @param int $c_diary_id
 * @param int $c_member_id
 * @return bool allowed or not
 */
function pne_check_diary_public_flag($c_diary_id, $c_member_id)
{
    $c_diary = db_diary_get_c_diary4id($c_diary_id);
    if ($c_diary['c_member_id'] == $c_member_id) {
        return true;
    }

    switch ($c_diary['public_flag']) {
    case 'public':
        $allowed = true;
        break;
    case 'friend':
        $allowed = db_friend_is_friend($c_diary['c_member_id'], $c_member_id);
        break;
    case 'private':
    default:
        $allowed = false;
        break;
    }

    return $allowed;
}

function pne_url2a($url, $target = '_blank')
{
    $length = 60;
    $etc = '...';

    if (strlen($url) > $length) {
        $length -= strlen($etc);
        $urlstr = substr($url, 0, $length) . $etc;
    } else {
        $urlstr = $url;
    }
    if ($target) {
        $target = sprintf(' target="%s"', $target);
    }
    return sprintf('<a href="%s"%s>%s</a>', $url, $target, $urlstr);
}

function get_auth_config($is_ktai = false)
{
    if (IS_SLAVEPNE) {
    	$config = $GLOBALS['_OPENPNE_AUTH_CONFIG'];
    } else {
    	$config['storage'] = 'DB';
        if ($is_ktai) {
            $config['options'] = array(
                'dsn'         => db_get_dsn(),
                'table'       => 'c_member_secure',
                'usernamecol' => 'ktai_address',
                'passwordcol' => 'hashed_password',
                'cryptType'   => 'md5',
            );
        } else {
            $config['options'] = array(
                'dsn'         => db_get_dsn(),
                'table'       => 'c_member_secure',
                'usernamecol' => 'pc_address',
                'passwordcol' => 'hashed_password',
                'cryptType'   => 'md5',
            );
        }
    }
    return $config;
}

function crypt_func($raw_value,$cryptType)
{
    if (   isset($cryptType) 
        && $cryptType == 'none') {
        $cryptFunction = 'strval';
    } elseif (   isset($cryptType) 
              && function_exists($cryptType)) {
        $cryptFunction = $cryptType;
    } else {
        $cryptFunction = 'md5';
    }
    
    return $cryptFunction($raw_value);
}

function check_action4pne_slave($is_ktai = false)
{
    if (IS_SLAVEPNE) {
    	if ($is_ktai) {
    		openpne_redirect('ktai');
    	} else {
    		openpne_redirect('pc');
    	}
    }
}

?>
