<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/Action.php';

// __Framework
$GLOBALS['__Framework']['current_module'] = '';
$GLOBALS['__Framework']['current_type']   = '';
$GLOBALS['__Framework']['current_action'] = '';
$GLOBALS['__Framework']['default_type']   = 'page';
$GLOBALS['__Framework']['default_page']   = '';
$GLOBALS['__Framework']['is_secure']   = true;

/**
 * 初期実行 index.php から呼ばれる
 */
function openpne_execute()
{
    $module = '';
    $type   = '';
    $action = '';

    if (!($module = get_request_var('m'))) {
        // モジュール名の自動設定
        if (!db_admin_user_exists()) {
            $module = 'setup';
        } elseif (isKtaiUserAgent()) {
            $module = 'ktai';
        } else {
            $module = 'pc';
        }
    }

    $types = array('page', 'do');
    if ($a = get_request_var('a')) {
        $arr = explode('_', $a, 2);
        if (!empty($arr[1]) && in_array($arr[0], $types)) {
            $type   = $arr[0];
            $action = $arr[1];
        }
    }
    openpne_forward($module, $type, $action);
}

/**
 * J-PHONE 旧機種対応のため GET 優先でリクエスト変数を取得
 */
function get_request_var($key)
{
    if (isset($_GET[$key])) {
        return $_GET[$key];
    } elseif (isset($_POST[$key])) {
        return $_POST[$key];
    } elseif (isset($_REQUEST[$key])) {
        return $_REQUEST[$key];
    } else {
        return '';
    }
}

/**
 * openpne_forward
 *
 * @param string $module a requested module name.
 * @param string $type request type. 'page' or 'do'
 * @param string $action requested page/command name.
 * @param array  $errors error message strings.
 */
function openpne_forward($module, $type = '', $action = '', $errors = array())
{
    /// module ///
    if (!$module = _check_module($module)) {
        openpne_display_error('モジュールが見つかりません', true);
    }
    $GLOBALS['__Framework']['current_module'] = $module;

    // disable modules
    if (in_array($module, (array)$GLOBALS['_OPENPNE_DISABLE_MODULES'])) {
        openpne_display_error('モジュールが無効になっています', true);
    }

    // init
    if ($init = openpne_ext_search("{$module}/init.inc")) {
        require_once $init;
    }

    /// type ///
    if (!$type) {
        $type = $GLOBALS['__Framework']['default_type'];
    }
    if (!_check_type($type)) {
        openpne_display_error('リクエストの種類が正しくありません', true);
    }
    $GLOBALS['__Framework']['current_type'] = $type;

    /// action ///
    if (!$action = _check_action($action)) {
        openpne_display_error('アクションの指定が正しくありません', true);
    }

    if (!$file = openpne_ext_search("{$module}/{$type}/{$action}.php")) {
        openpne_display_error('アクションファイルが見つかりません', true);
    }
    require_once $file;
    $class_name = "{$module}_{$type}_{$action}";
    if (!class_exists($class_name)) {
        openpne_display_error('アクションが見つかりません', true);
    }
    $action_obj = new $class_name();
    $GLOBALS['__Framework']['current_action'] = $action;

    // maintenace mode
    if (OPENPNE_UNDER_MAINTENANCE) {
        if (!in_array($module, (array)$GLOBALS['_OPENPNE_MAINTENANCE_MODULES'])
          || in_array($type . '_' . $action, (array)$GLOBALS['_OPENPNE_MAINTENANCE_EXCLUDED_ACTION'][$module])) {
            openpne_display_error();
        }
    }

    // auth
    if ($GLOBALS['__Framework']['is_secure'] = $action_obj->isSecure()) {
        if ($auth = openpne_ext_search("{$module}/auth.inc")) {
            require_once $auth;
        } else {
            require_once 'auth.inc';
        }
    }

    // ---------- リクエストバリデーション ----------

    require_once 'OpenPNE/Validator.php';
    require_once 'OpenPNE/Validator/Common.php';
    $validator = new OpenPNE_Validator_Common();

    $files = array();
    if ($ini = openpne_ext_search("{$module}/validate/{$type}/{$action}.ini")) {
        $files[] = $ini;
    }
    list($result, $requests) = $validator->common_validate($files);
    $action_obj->requests = $requests;
    if ($result === false) {
        $errors = $validator->getErrors();
        $action_obj->handleError($errors);
    }

    // ----------------------------------------------

    switch ($type) {
    case 'page':
        $smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
        $smarty->templates_dir = $module . '/templates';

        $smarty->assign('requests', $requests);

        $smarty->assign('msg', $requests['msg']);
        $smarty->assign('msg1', $requests['msg1']);
        $smarty->assign('msg2', $requests['msg2']);
        $smarty->assign('msg3', $requests['msg3']);
        if ($errors) {
            $smarty->assign('errors', $errors);
        }

        if (OPENPNE_USE_PARTIAL_SSL) {
            $a = "{$type}_{$action}";
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                $p = $_POST;
            } else {
                $p = $_GET;
            }
            switch (openpne_ssl_type($module, $a)) {
            case 'SSL_REQUIRED':
                if (!is_ssl()) {
                    openpne_redirect($module, $a, $p);
                }
                break;
            case 'SSL_DISABLED':
                if (is_ssl()) {
                    openpne_redirect($module, $a, $p);
                }
                break;
            case 'SSL_SELECTABLE':
                if ($https = is_ssl()) {
                    $url = openpne_gen_url($module, $a, $p, true, 'nonssl');
                } else {
                    $url = openpne_gen_url($module, $a, $p, true, 'ssl');
                }
                $smarty->assign('HTTPS', $https);
                $smarty->assign('SSL_SELECT_URL', $url);
                break;
            }
        }

        $action_obj->view =& $smarty;
        break;
    }

    // init function
    $init_func = "init_{$module}_{$type}";
    if (function_exists($init_func)) {
        if (isset($smarty)) {
            $init_func($smarty);
        } else {
            $init_func();
        }
    }

    $result = $action_obj->execute($requests);
    if ($result == 'success') {
        send_nocache_headers();
        if ($smarty->ext_search($smarty->templates_dir . '/common/layout.tpl', $place)) {
            $smarty->assign('op_content', $smarty->ext_fetch("{$action}.tpl"));
            $smarty->ext_display('common/layout.tpl');
        } else {
            $smarty->ext_display("{$action}.tpl");
        }
    }
    // ----------------------------------------------

    // c_access_log
    if (LOG_C_ACCESS_LOG) {
        if ($GLOBALS['__Framework']['is_secure'] && $type == 'page') {
            if ($module == 'pc') {
                p_access_log($GLOBALS['AUTH']->uid(), $action);
            } elseif ($module == 'ktai') {
                p_access_log($GLOBALS['KTAI_C_MEMBER_ID'], $action, 1);
            }
        }
    }

    // カスタムログ用関数の呼び出し
    if (OPENPNE_LOG_FUNCTION && is_callable(OPENPNE_LOG_FUNCTION)) {
        // c_member_id を取得
        $c_member_id = 0;
        if ($GLOBALS['__Framework']['is_secure']) {
            if ($module == 'pc') {
                $c_member_id = $GLOBALS['AUTH']->uid();
            } else if ($module == 'ktai') {
                $c_member_id = $GLOBALS['KTAI_C_MEMBER_ID'];
            }
        }

        $params = array(
            'module' => $module,
            'type' => $type,
            'action' => $action,
            'c_member_id' => $c_member_id,
            'is_secure' => $GLOBALS['__Framework']['is_secure'],
        );
        call_user_func(OPENPNE_LOG_FUNCTION, $params);
    }

    return true;
}

function openpne_display_error($errors = array(), $notfound = false)
{
    $smarty = new OpenPNE_Smarty($GLOBALS['SMARTY']);
    $smarty->setOutputCharset('SJIS');
    $smarty->assign('notfound', $notfound);
    if (OPENPNE_DEBUGGING) {
        $smarty->assign('errors', (array)$errors);
        $smarty->assign('debug_backtrace', util_filter_backtrace(debug_backtrace()));
    }
    $smarty->ext_display('error.tpl');
    exit;
}

function openpne_ext_search($path)
{
    $dft = OPENPNE_MODULES_DIR . '/' . $path;
    $ext = OPENPNE_MODULES_EXT_DIR . '/' . $path;
    $biz = OPENPNE_MODULES_BIZ_DIR . '/' . $path;

    if (USE_EXT_DIR && is_readable($ext)) {
        return $ext;
    } elseif (USE_BIZ_DIR && is_readable($biz)) {
        return $biz;
    } elseif (is_readable($dft)) {
        return $dft;
    }

    return false;
}

/**
 * モジュール名を取得
 * 空の場合はデフォルトモジュールを返す
 *
 * 間違ったモジュール名を指定した
 * デフォルトモジュールが存在しない場合は false
 *
 * @param string $module module name
 */
function _check_module($module)
{
    // 英数字とアンダーバーのみ
    // 「../」等は許さない
    if (preg_match('/\W/', $module)) {
        // モジュール名が不正です
        return false;
    }

    if (empty($module)) {
        // モジュールが指定されていません
        return false;
    }

    if ($module == ADMIN_MODULE_NAME) {
        $module = 'admin';
    } elseif ($module == 'admin') {
        return false;
    }

    if (!openpne_ext_search($module)) {
        return false;
    }

    return $module;
}

function _check_type($type)
{
    switch ($type) {
        case 'page':
        case 'do':
            break;
        default:
            // unknown type
            return false;
    }

    return $type;
}

function _check_action($action)
{
    // 英数字とアンダーバーのみ
    // 「../」等は許さない
    if (preg_match('/\W/', $action)) {
        // アクション名が不正です
        return false;
    }

    if (empty($action)) {
        $type = $GLOBALS['__Framework']['current_type'];
        if (empty($GLOBALS['__Framework']['default_' . $type])) {
            // ページが指定されていません
            return false;
        } else {
            $action = $GLOBALS['__Framework']['default_' . $type];
        }
    }

    return $action;
}

function send_nocache_headers($force = false)
{
    if (!headers_sent()) {
        if ((!empty($GLOBALS['__Framework']['carrier']) && $GLOBALS['__Framework']['carrier'] === 'e')  // au の場合は常に no-cache ヘッダを送信
            || OPENPNE_SEND_NO_CACHE_HEADER || $force) {
            // no-cache
            // 日付が過去
            header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');

            // 常に修正されている
            header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');

            // HTTP/1.1
            header('Cache-Control: no-store, no-cache, must-revalidate');
            header('Cache-Control: post-check=0, pre-check=0', false);
            // HTTP/1.0
            header('Pragma: no-cache');
        }

        return true;
    } else {
        return false;
    }
}

function handle_kengen_error()
{
    switch ($GLOBALS['__Framework']['current_module']) {
    case 'pc':
        openpne_forward('pc', 'page', 'h_err_forbidden');
        break;
    case 'ktai':
        ktai_display_error('このページにはアクセスすることができません。');
        break;
    default:
        openpne_display_error('このページにはアクセスすることができません。');
        break;
    }
    exit;
}

?>
