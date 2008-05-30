<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class openid_do_server_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $openid_request = openid_util_get_session();
        openid_util_set_session();

        if ($openid_request->identity !== openid_util_get_url($u)) {
            openpne_redirect('openid', 'page_server_error');
        }

        $server =& openid_util_get_server();
        $response =& $openid_request->answer(true);

        $webresponse =& $server->encodeResponse($response);
        openid_util_write_response($webresponse);
    }
}

?>
