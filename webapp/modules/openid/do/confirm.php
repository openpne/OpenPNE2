<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class openid_do_confirm extends OpenPNE_Action
{   
    function execute($requests)
    {
        require_once 'Auth/OpenID.php';
        require_once 'Auth/OpenID/Association.php';
        require_once 'Auth/OpenID/HMACSHA1.php';
        require_once 'Auth/OpenID/Consumer.php';
        require_once 'Auth/OpenID/Server.php';
        require_once 'Auth/OpenID/ServerRequest.php';
        require_once 'Auth/OpenID/FileStore.php';
        
        if ($requests['id'] != $GLOBALS['AUTH']->uid()) {
            $GLOBALS['AUTH']->logout();
            client_redirect_absolute(get_login_url());
        }
        
        $info = unserialize($_SESSION['request']);
        $server =& new Auth_OpenID_Server(new Auth_OpenID_FileStore(OPENPNE_VAR_DIR . '/tmp'));
        $response =& $info->answer(true);
        $webresponse =& $server->encodeResponse($response);
        $new_headers = array();

        foreach ($webresponse->headers as $k => $v) {
            $new_headers[] = $k.": ".$v;
        }
        
        array_walk($new_headers, 'header');
        exit;
    }
}

?>
