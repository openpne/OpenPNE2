<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiID.php';

class ktai_do_o_easy_login extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        if (!$c_member_id = db_ktai_c_member_id4easy_access_id(OpenPNE_KtaiID::getID())) {
            // 認証エラー
            $p = array('msg' => 14, 'kad' => t_encrypt($requests['ktai_address']));
            openpne_redirect('ktai', 'page_o_login', $p);
        }

        $c_member = db_common_c_member4c_member_id($c_member_id, true);

        @session_name('OpenPNEktai');
        @session_start();
        @session_regenerate_id();

        $_SESSION['c_member_id'] = $c_member_id;
        $_SESSION['ktai_address'] = t_encrypt($c_member['secure']['ktai_address']);
        $_SESSION['timestamp'] = $_SESSION['idle'] = time();
        if (OPENPNE_SESSION_CHECK_URL) {
            $_SESSION['OPENPNE_URL'] = OPENPNE_URL;
        }

        $p = array('ksid' => session_id());
        openpne_redirect('ktai', 'page_h_home', $p);
    }
}

?>
