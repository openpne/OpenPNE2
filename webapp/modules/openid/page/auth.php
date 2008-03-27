<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class openid_page_auth extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }
    
    function execute($requests)
    {
        require_once 'Auth/OpenID.php';
        require_once 'Auth/OpenID/Association.php';
        require_once 'Auth/OpenID/HMACSHA1.php';
        require_once 'Auth/OpenID/Consumer.php';
        require_once 'Auth/OpenID/Server.php';
        require_once 'Auth/OpenID/ServerRequest.php';
        require_once 'Auth/OpenID/FileStore.php';
        
        $server =& new Auth_OpenID_Server(new Auth_OpenID_FileStore(OPENPNE_VAR_DIR . '/tmp'));
        $request = $_REQUEST;
        $request = Auth_OpenID::fixArgs($request);
        $request = $server->decodeRequest($request);
        
        
        if ($_REQUEST['openid_mode'] == "associate") {
            if (in_array($request->mode,
                         array('checkid_immediate', 'checkid_setup'))) {

                $response =& $request->answer(true);
                $sreg = getSreg($request->identity);
                if (is_array($sreg)) {
                    foreach ($sreg as $k => $v) {
                        $response->addField('sreg', $k, 
                                            $v);
                    }
                }
            } else {
                $response =& $server->handleRequest($request);
            }
            $response =& $server->handleRequest($request);
            $webresponse =& $server->encodeResponse($response);
        
            foreach ($webresponse->headers as $k => $v) {
                header("$k: $v");
            }
        
            header(header_connection_close);
            print $webresponse->body;
            exit;
        }
        
        if ($auth = openpne_ext_search("openid/auth.inc")) {
            require_once $auth;
        } else {
            require_once 'auth.inc';
        }
        if ($requests['id'] != $GLOBALS['AUTH']->uid()) {
            $GLOBALS['AUTH']->logout();
            $parts = explode('/', $_SERVER['SCRIPT_NAME']);
            $_REQUEST['login_params'] = $_SERVER['QUERY_STRING'];
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                $_POST = array('login_params' => $_SERVER['QUERY_STRING']);
            } else {
                $_GET = array('login_params' => $_SERVER['QUERY_STRING']);
            }
            openpne_forward('ktai', 'page', "page_o_login");
            exit;
        }
        
        $_SESSION['request'] = serialize($request);
        $this->set('id', $requests['id']);
        return 'success';
    }
}

?>
