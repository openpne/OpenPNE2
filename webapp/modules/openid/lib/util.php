<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'Auth/OpenID/Server.php';
require_once 'Auth/OpenID/FileStore.php';

function openid_util_get_server()
{
    $op_endpoint = openpne_gen_url('openid', 'do_server');
    return new Auth_OpenID_Server(new Auth_OpenID_FileStore(OPENPNE_VAR_DIR . '/tmp'), $op_endpoint);
}

function openid_util_write_response($webresponse)
{
    foreach ($webresponse->headers as $k => $v) {
        $k = str_replace(array("\r", "\n"), '', $k);
        $v = str_replace(array("\r", "\n"), '', $v);

        if ($k && $v) {
            header("$k: $v");
        }
    }
    header('Connection: close');

    echo $webresponse->body;
    exit;
}

function openid_util_set_session($value = null)
{
    if (isset($value)) {
        $_SESSION['openid'] = serialize($value);
    } else {
        unset($_SESSION['openid']);
    }
}

function openid_util_get_session()
{
    if (isset($_SESSION['openid'])) {
        return unserialize($_SESSION['openid']);
    } else {
        return false;
    }
}

function openid_util_get_url($c_member_id)
{
    return OPENPNE_OPENID_URL_HEAD . (int)$c_member_id;
}

?>
