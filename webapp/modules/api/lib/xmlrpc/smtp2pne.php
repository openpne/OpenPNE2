<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'Log.php';
require_once 'OpenPNE/KtaiMail/RPC.php';
require_once 'mail/sns.php';

function xmlrpc_smtp2pne($message)
{
    // パラメータを取得
    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return $param;
    }

    $params = XML_RPC_decode($param);

    // 入力チェック とりあえず空かどうかのみ
    if (empty($params['prefix']) and empty($params['domain'])) {
        return xmlrpc_get_response_faultDefault('incorrect_params');
    }
    if (empty($params['to'])) {
        return xmlrpc_get_response_faultDefault('incorrect_params');
    }
    if (empty($params['from'])) {
        return xmlrpc_get_response_faultDefault('incorrect_params');
    }

    // デコーダオブジェクトを作成
    $options['from_encoding']    = 'UTF-8';
    $options['to_encoding']      = 'UTF-8';
    $options['img_tmp_dir']      = OPENPNE_VAR_DIR . '/tmp';
    $options['img_max_filesize'] = IMAGE_MAX_FILESIZE * 1024;
    $options['trim_doublebyte_space'] = OPENPNE_TRIM_DOUBLEBYTE_SPACE;

    $decoder =& new OpenPNE_KtaiMail_RPC($options);
    $decoder->assign($params);

    // メール受信処理オブジェクトを起動
    $mail_sns =& new mail_sns($decoder);
    if (!$mail_sns->main()) {
        //エラーの場合はfaultCodeを返す
        return xmlrpc_get_fault_response(56, 'Can\'t Receive Mail');
    }

    return xmlrpc_get_response(0);
}

// XMLRPC共通関数(共通lib)
function xmlrpc_get_response_faultDefault($key)
{
    global $XML_RPC_err, $XML_RPC_str;
    return new XML_RPC_Response(0, $XML_RPC_err[$key], $XML_RPC_str[$key]);
}

// mail_snsで呼び出してるライブラリがbin/mail.phpの中にあるので
// 仮設置
function m_debug_log($msg, $priority =  PEAR_LOG_WARNING)
{
    if (!MAIL_DEBUG_LOG) return;

    $log_path = OPENPNE_VAR_DIR . '/log/mail.log';
    $file =& Log::singleton('file', $log_path, 'MAIL');

    mb_convert_encoding($msg, 'JIS', 'auto');
    $file->log($msg, $priority);
}

?>
