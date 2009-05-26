<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class openid_do_server extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $server =& openid_util_get_server();
        $openid_request = $server->decodeRequest();

        $response = null;
        if (in_array($openid_request->mode, array('checkid_immediate', 'checkid_setup'))) {
            if ($openid_request->immediate) {
                $response = $openid_request->answer(false);
            } else {
                openpne_forward('openid', 'page', 'server_confirm');
                exit;
            }
        } else {
            $response = $server->handleRequest($openid_request);
        }

        $webresponse = $server->encodeResponse($response);
        openid_util_write_response($webresponse);
    }
}

?>
