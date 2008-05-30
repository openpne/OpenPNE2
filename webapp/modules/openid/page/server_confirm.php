<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class openid_page_server_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $server =& openid_util_get_server();
        $openid_request = $server->decodeRequest();

        if ($openid_request->identity !== openid_util_get_url($u)) {
            openpne_redirect('openid', 'page_server_error');
        }

        openid_util_set_session($openid_request);

        $this->set('trust_root', $openid_request->trust_root);
        return 'success';
    }
}

?>
