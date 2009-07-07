<?php
/**
 * @copyright 2005-2008 OpenPNE Project
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
    if ($p['m'] == 'admin') {
        $p['m'] = ADMIN_MODULE_NAME;
    }
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
    if (preg_match('/^[^:;@,\s\x80-\xFF]+@\w[\w\-.]*\.[a-zA-Z]+$/', $value)) {
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
            array('url' => '?m=pc&a=page_h_com_find_all', 'caption' => WORD_COMMUNITY . '検索'),
            array('url' => '?m=pc&a=page_h_review_search', 'caption' => 'レビュー検索'),
            array('url' => '?m=pc&a=page_h_home', 'caption' => 'マイホーム'),
            array('url' => '?m=pc&a=page_h_invite', 'caption' => '友人を誘う'),
            array('url' => '?m=pc&a=page_h_diary_list_all', 'caption' => '最新' . WORD_DIARY),
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
            array('url' => '?m=pc&a=page_fh_diary_list', 'caption' => WORD_DIARY),
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
            array('url' => '?m=pc&a=page_fh_diary_list', 'caption' => WORD_DIARY . 'を読む'),
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
            array('url' => '?m=pc&a=page_c_home', 'caption' => WORD_COMMUNITY . 'トップ'),
            array('url' => '?m=pc&a=page_c_topic_list', 'caption' => '掲示板'),
            array('url' => '?m=pc&a=page_c_member_review', 'caption' => 'おすすめレビュー'),
            array('url' => '?m=pc&a=page_c_join_commu', 'caption' => WORD_COMMUNITY . 'に参加'),
            array('url' => '?m=pc&a=page_c_invite', 'caption' => WORD_MY_FRIEND.'に紹介'),
            array('url' => '?m=pc&a=page_c_leave_commu', 'caption' => WORD_COMMUNITY . 'を退会'),
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

    $url = htmlspecialchars($url, ENT_QUOTES, 'UTF-8');
    $urlstr = htmlspecialchars($urlstr, ENT_QUOTES, 'UTF-8');

    return sprintf('<a href="%s"%s>%s</a>', $url, $target, $urlstr);
}

function get_auth_config($is_ktai = false)
{
    if (OPENPNE_AUTH_MODE == 'slavepne') {
        $config = $GLOBALS['_OPENPNE_AUTH_CONFIG'];
    } elseif (OPENPNE_AUTH_MODE == 'pneid') {
        $config['storage'] = 'DB';
        $config['is_lowercase_username'] = true;
        $config['options'] = array(
            'dsn'         => db_get_dsn(),
            'auto_quote'  => false,
            'table'       => 'c_member_secure AS cms INNER JOIN c_username AS cu USING (c_member_id)',
            'db_fields'   => 'cms.hashed_password AS hashed_password, cu.username AS username',
            'usernamecol' => 'username',
            'passwordcol' => 'hashed_password',
            'cryptType'   => 'md5',
        );
    } else {
        $config['storage'] = 'DB';
        $config['is_encrypt_username'] = true;
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
    $config['is_ktai'] = $is_ktai;

    if ($is_ktai) {
        $config['is_check_user_agent'] = OPENPNE_SESSION_CHECK_KTAI_USER_AGENT;
    } else {
        $config['is_check_user_agent'] = OPENPNE_SESSION_CHECK_PC_USER_AGENT;
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
    if (OPENPNE_AUTH_MODE == 'slavepne') {
        if ($is_ktai) {
            openpne_redirect('ktai');
        } else {
            openpne_redirect('pc');
        }
    }
}

function util_include_php_files($dir)
{
    if (!is_dir($dir)) {
        return;
    }
    if ($dh = opendir($dir)) {
        while (($file = readdir($dh)) !== false) {
            if ($file[0] === '.') {
                continue;
            }
            $path = realpath($dir . '/' . $file);
            if (is_dir($path)) {
                util_include_php_files($path);
            } else {
                if (substr($file, -4, 4) === '.php') {
                    include_once $path;
                }
            }
        }
        closedir($dh);
    }
}

function util_cast_public_flag_diary($public_flag, $default = 'public')
{
    switch ($public_flag) {
    case 'public':
    case 'friend':
    case 'private':
        break;
    default:
        $public_flag = $default;
        break;
    }
    return $public_flag;
}

/**
 * 登録してもよいメールアドレスかどうか
 */
function util_is_regist_mail_address($mail_address, $c_member_id = 0)
{
    if (!db_common_is_mailaddress($mail_address)) {
        return false;
    }

    if (!db_member_is_limit_domain4mail_address($mail_address)) {
        return false;
    }

    if (db_member_is_sns_join4mail_address($mail_address, $c_member_id)) {
        return false;
    }

    return true;
}

/**
 * アップロード可能な拡張子のリストを取得
 */
function util_get_file_allowed_extensions($format = null)
{
    $list = array();
    if (FILE_ALLOWED_EXTENTIONS) {
        $exts = explode(',', FILE_ALLOWED_EXTENTIONS);
        foreach ((array)$exts as $ext) {
            if (trim($ext) !== '') {
                $list[] = trim($ext);
            }
        }
    }
    if ($format === 'string') {
        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key] = '*.' . $value;
            }
            $list = implode('; ', $list);
        } else {
            $list = '';
        }
    }
    return $list;
}

/**
 * アップロード可能な拡張子かどうか
 */
function util_check_file_extention($filename)
{
    $extension = pathinfo($filename, PATHINFO_EXTENSION);
    $list = util_get_file_allowed_extensions();
    return (!$list || in_array($extension, $list));
}

/**
 * 参照可能なメッセージかどうか
 *
 * ・指定メンバーが送信者で、完全削除済でない
 * ・指定メンバーが受信者で、送信済であり完全削除済でない
 *
 * @param int $c_member_id
 * @param int $c_message_id
 * @return bool
 */
function util_is_readable_message($c_member_id, $c_message_id)
{
    $c_message = db_message_c_message4c_message_id($c_message_id);

    if ($c_message['c_member_id_from'] == $c_member_id) {  // 自分が送信者
        if (!$c_message['is_kanzen_sakujo_from']) {  // 完全削除済でない
            return true;
        }
    } elseif ($c_message['c_member_id_to'] == $c_member_id)  { // 自分が受信者
        if ($c_message['is_send'] && !$c_message['is_kanzen_sakujo_to']) {  // 送信済であり完全削除済でない
            return true;
        }
    }

    return false;
}

/**
 * DB内配色設定の未設定項目をデフォルトの配色設定で埋める
 *
 * @param array $c_config_color    DB内配色設定
 * @param string $mode
 * @return array
 */
function util_apply_color_default2current($c_config_color, $mode = 'pc')
{
    if ($mode == 'ktai') {
        $default_color['color_23'] = $c_config_color['color_1'];
        $default_color['color_24'] = $c_config_color['color_14'];
        $default_color['color_25'] = $c_config_color['color_14'];
        $default_color['color_26'] = $c_config_color['color_14'];
        $default_color['color_27'] = $c_config_color['color_3'];
        $default_color['color_28'] = $c_config_color['color_14'];
    } else {
        $default_color['color_19'] = $c_config_color['color_13'];
    }

    $c_config_color = array_map('trim', $c_config_color);
    $empty_keys = array_keys($c_config_color, '');
    foreach ($empty_keys as $key) {
        if (array_key_exists($key, $default_color)) {
            $c_config_color[$key] = $default_color[$key];
        }
    }

    return $c_config_color;
}

function util_get_color_config()
{
    $c_config_color = db_etc_c_config_color();
    $c_config_color = util_apply_color_default2current($c_config_color);

    $color_config = array(
        'border_01' => $c_config_color['color_1'],
        'border_07' => $c_config_color['color_2'],
        'border_10' => $c_config_color['color_3'],
        'bg_00' => $c_config_color['color_4'],
        'bg_01' => $c_config_color['color_5'],
        'bg_02' => $c_config_color['color_6'],
        'bg_03' => $c_config_color['color_7'],
        'bg_04' => $c_config_color['color_8'],
        'bg_05' => $c_config_color['color_9'],
        'bg_06' => $c_config_color['color_10'],
        'bg_07' => $c_config_color['color_11'],
        'bg_08' => $c_config_color['color_12'],
        'bg_09' => $c_config_color['color_13'],
        'bg_10' => $c_config_color['color_14'],
        'bg_11' => $c_config_color['color_15'],
        'bg_12' => $c_config_color['color_16'],
        'bg_13' => $c_config_color['color_17'],
        'bg_14' => $c_config_color['color_18'],
        'color_19' => $c_config_color['color_19'],
    );
    return $color_config;
}

function util_get_color_config_ktai()
{
    $c_config_color = db_etc_c_config_color_ktai();
    $c_config_color = util_apply_color_default2current($c_config_color, 'ktai');

    $color_config = array(
        'bg_01' => $c_config_color['color_1'],
        'bg_02' => $c_config_color['color_2'],
        'bg_03' => $c_config_color['color_3'],
        'bg_04' => $c_config_color['color_4'],
        'bg_05' => $c_config_color['color_5'],
        'bg_06' => $c_config_color['color_6'],
        'bg_07' => $c_config_color['color_7'],
        'bg_08' => $c_config_color['color_8'],
        'bg_09' => $c_config_color['color_9'],
        'bg_10' => $c_config_color['color_10'],
        'border_01' => $c_config_color['color_11'],
        'border_02' => $c_config_color['color_12'],
        'border_03' => $c_config_color['color_13'],
        'font_01' => $c_config_color['color_14'],
        'font_02' => $c_config_color['color_15'],
        'font_03' => $c_config_color['color_23'],
        'font_04' => $c_config_color['color_17'],
        'font_05' => $c_config_color['color_18'],
        'font_06' => $c_config_color['color_19'],
        'font_07' => $c_config_color['color_20'],
        'font_08' => $c_config_color['color_21'],
        'font_09' => $c_config_color['color_22'],
        'color_24' => $c_config_color['color_24'],
        'color_25' => $c_config_color['color_25'],
        'color_26' => $c_config_color['color_26'],
        'color_27' => $c_config_color['color_27'],
        'color_28' => $c_config_color['color_28'],
    );
    return $color_config;
}

/**
 * メンバー登録を行う
 *
 * @param array $c_member
 * @param array $c_member_secure
 * @param array $c_member_profile_list
 * @param bool $is_password_encrypted    パスワードが既に暗号化済みかどうか
 * @return int
 */
function util_regist_c_member($c_member, $c_member_secure, $c_member_profile_list = array(), $is_password_encrypted = false)
{
    // メール受信設定をデフォルト値に
    $c_member['is_receive_mail'] = 1;
    $c_member['is_receive_ktai_mail'] = 1;
    $c_member['is_receive_daily_news'] = 1;

    // メンバー登録
    $u = db_member_insert_c_member($c_member, $c_member_secure, $is_password_encrypted);
    if ($u === false) {  // メンバー登録に失敗した場合
        return false;
    }

    if (OPENPNE_USE_POINT_RANK) {
        //入会者にポイント加算
        $point = db_action_get_point4c_action_id(1);
        db_point_add_point($u, $point);

        //メンバー招待をした人にポイント加算
        $point = db_action_get_point4c_action_id(7);
        db_point_add_point($c_member['c_member_id_invite'], $point);
    }

    // c_member_profile
    db_member_update_c_member_profile($u, $c_member_profile_list);

    // 招待者とフレンドリンク
    db_friend_insert_c_friend($u, $c_member['c_member_id_invite']);

    //管理画面で指定したコミュニティに強制参加
    $c_commu_id_list = db_commu_regist_join_list();
    foreach ($c_commu_id_list as $c_commu_id) {
        db_commu_join_c_commu($c_commu_id, $u);
    }

    // ログインIDを登録
    if (OPENPNE_AUTH_MODE == 'pneid') {
        $login_id = strtolower($c_member['login_id']);
        db_member_insert_username($u, $login_id);
    }

    return $u;
}

function util_get_preset_color_list($dir = 'pc')
{
    $color_list_dir = OPENPNE_WEBAPP_DIR . '/lib/color/' . $dir . '/';
    $color_list = array();

    if ($dh = opendir($color_list_dir)) {
        while (($file = readdir($dh)) !== false) {
            if (array_pop(explode('.', $file)) == 'ini') {
                $color_list[$file] = parse_ini_file($color_list_dir . $file);
            }
        }
        closedir($dh);
    }

    ksort($color_list);

    return array_values($color_list);
}

function util_get_module_config($module)
{
    $config = array();

    if ($file = openpne_ext_search($module . '/config.ini')) {
        $config = parse_ini_file($file, true);
    }

    return $config;
}

function util_get_validate_rules_profile($disp = 'config')
{
    $disp_key = 'disp_' . $disp;

    $rules = array();
    $profile_list = db_member_c_profile_list4null();
    foreach ($profile_list as $profile) {
        if ($profile[$disp_key]) {
            $rule = array(
                'type' => 'int',
                'required' => $profile['is_required'],
                'caption' => $profile['caption'],
            );
            switch ($profile['form_type']) {
            case 'text':
            case 'textlong':
            case 'textarea':
                $rule['type'] = $profile['val_type'];
                $rule['regexp'] = $profile['val_regexp'];
                $rule['min'] = $profile['val_min'];
                if ($profile['val_max']) {
                    $rule['max'] = $profile['val_max'];
                }
                break;
            case 'checkbox':
                $rule['is_array'] = '1';
                break;
            }
            $rules[$profile['name']] = $rule;
        }
    }
    return $rules;
}

function util_send_header_internal_server_error()
{
    header('HTTP/1.0 500 Internal Server Error');
    exit;
}

function util_output_xml4array($data, $root, $is_escape = true)
{
    require_once 'XML/Serializer.php';
    $option = array(
        'rootName' => $root,
    );
    $serializer = new XML_Serializer($option);

    if ($is_escape) {
        $data = util_escape4output_xml($data);
    }

    $result = $serializer->serialize($data);

    if ($result === true) {
        $xml = $serializer->getSerializedData();
        header('Content-Type: application/xml');
        echo $xml;
        exit;
    }

    util_send_header_internal_server_error();
}

function util_escape4output_xml($data)
{
    if (is_array($data)) {
        foreach ($data as $key => $value) {
            $data[$key] = util_escape4output_xml($value);
        }
        return $data;
    } elseif (is_string($data)) {
        return htmlspecialchars($data, ENT_QUOTES, 'UTF-8');
    } else {
        return $data;
    }
}

function util_get_img_url($filename, $width, $height)
{
    require_once 'smarty_plugins/function.t_img_url.php';
    $params = array(
        'filename' => $filename,
        'w' => $width,
        'h' => $height,
    );
    return smarty_function_t_img_url($params, $dummy);
}

function util_get_c_member_config_default()
{
    $default_config = array(
        'SEND_DIARY_COMMENT_MAIL_KTAI' => 0,
        'IS_DISPLAY_NEWDIARY_HOME' => 1,
        'IS_DISPLAY_NEWTOPIC_HOME' => 1,
        'IS_DISPLAY_NEWDIARY_HOME_KTAI' => 1,
        'IS_DISPLAY_NEWTOPIC_HOME_KTAI' => 1,
        'IS_DISPLAY_BOOKMARK_DIARY_HOME' => 1,
        'IS_DISPLAY_BOOKMARK_BLOG_HOME' => 1,
        'IS_DISPLAY_SCHEDULE_HOME' => 1,
        'SEND_RANK_UP_MAIL_PC' => 1,
        'SEND_RANK_UP_MAIL_KTAI' => 1,
        'IS_SEARCH_RESULT' => 1,
    );

    return $default_config;
}

function util_get_c_member_config($c_member_id)
{
    $default_config = util_get_c_member_config_default();
    $member_config = array_merge($default_config, db_member_c_member_config4c_member_id($c_member_id));

    return $member_config;
}

/**
 * ページャの作成
 *
 * @param  int   $page
 * @param  int   $page_size
 * @param  int   $total_num
 * @return mixed $total_num が 0 の場合は null、それ以外の場合はページャ用の連想配列
 */
function util_make_pager($page, $page_size, $total_num)
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

/**
 * debug_backtrace() の結果を、出力用にフィルタリングする
 *
 * @param  array $backtrace
 * @return array
 */
function util_filter_backtrace($backtrace)
{
    $result = $backtrace;

    $base_regex = '/^' . preg_quote(OPENPNE_DIR, '/') . '/';

    foreach ($backtrace as $key => $value) {
        // 関数・メソッドの引数
        if (!empty($value['args'])) {
            foreach ($value['args'] as $arg_num => $arg) {
                if (is_object($arg)) {
                    $result[$key]['args'][$arg_num] = 'object(' . get_class($arg) . ')';
                } elseif (is_array($arg)) {
                    $result[$key]['args'][$arg_num] = 'Array(' . count($arg) . ')';
                }
            }
        }

        // メソッドが所属しているクラス
        if (isset($value['object'])) {
            unset($result[$key]['object']);
        }

        // 関数・メソッドが定義されているファイル名を相対パスに変更
        $result[$key]['file'] = preg_replace($base_regex, '.', $value['file']);
    }

    return $result;
}

/**
 * マッチングした文字列を一時的に退避する
 *
 * $patterns に指定された正規表現のパターンにマッチするものをマーカーに置換し、
 * 置換後の文字列、マーカーと元の文字列の対応テーブルを返す。
 *
 * @param string $subject
 * @param array  $patterns
 * @return array
 */
function util_replace_patterns_to_marker($subject, $patterns = array())
{
    $i = 0;
    $list = array();

    if (empty($patterns)) {
        $patterns = array(
            '/<input[^>]+>/is',
            '/<textarea.*?<\/textarea>/is',
            '/<option.*?<\/option>/is',
            '/<img[^>]+>/is',
            '/<head.*?<\/head>/is',
            '/response_comment_format\(\'.*?\'\)/is',
        );
    }

    foreach ($patterns as $pattern) {
        if (preg_match_all($pattern, $subject, $matches)) {
            foreach ($matches[0] as $match) {
                $replacement = '<<<MARKER:'.$i.'>>>';
                $list[$replacement] = $match;
                $i++;
            }
        }
    }

    $subject = str_replace(array_values($list), array_keys($list), $subject);

    return array($list, $subject);
}

/**
 * 連続投稿チェック用の情報を取得する
 *
 * @param  int   $u
 * @return array
 */
function util_get_post_info($u)
{
    $last_post_time = '';
    $post_count = 0;

    if (OPENPNE_POST_USE_DB) {
        list($last_post_time, $post_count) = db_etc_get_post_info($u);
    } else {
        $last_post_time = $_SESSION['last_post_time'];
        $post_count = $_SESSION['post_count'];
    }

    return array($last_post_time, $post_count);
}

/**
 * 連続投稿チェック用の情報を設定する
 *
 * @param int $u
 * @param int $post_time
 * @param int $post_count
 */
function util_set_post_info($u, $post_time, $post_count)
{
    if (OPENPNE_POST_USE_DB) {
        db_etc_set_post_info($u, $post_time, $post_count);
    } else {
        $_SESSION['last_post_time'] = $post_time;
        $_SESSION['post_count'] = $post_count;
    }
}

/**
 * 連続投稿確認用
 *
 * @param  string $module
 * @param  string $action
 * @param  int    $u
 * @return bool   true  : post OK
 *                false : post NG
 */
function util_do_post_interval_ok($module, $action, $u)
{
    // チェックしない
    if (!OPENPNE_POST_INTERVAL_UNFAIR_SECOND || !isset($GLOBALS['CHECK_POST_ACTIONS'])) {
        return true;
    }

    if (in_array($action, $GLOBALS['CHECK_POST_ACTIONS'][$module])) {
        // 最終投稿時間と投稿回数を取得
        list($last_post_time, $post_count) = util_get_post_info($u);

        $now_time = time();
        $interval = $now_time - (int)$last_post_time;

        if (!$last_post_time || $interval > OPENPNE_POST_INTERVAL_UNFAIR_COUNT_RESET_SECOND) {
            // 最終投稿時間が不明か、前回投稿から一定時間経過しているためカウントをリセットする
            $post_count = 1;
        } elseif ($interval < OPENPNE_POST_INTERVAL_UNFAIR_SECOND) {
            $post_count++;
        }
        // 情報更新
        util_set_post_info($u, $now_time, $post_count);

        // 投稿回数が一定数以上のため、連続投稿であるとみなす
        if ($post_count > OPENPNE_POST_INTERVAL_UNFAIR_COUNT) {
            return false;
        }
    }

    return true;
}

?>
