<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiID.php';

class ktai_do_h_config_easy_login extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // 現在のパスワードが正しいか
        if (!db_common_authenticate_password($u, $requests['password'], true)) {
            $p = array('msg' => 18);
            openpne_redirect('ktai', 'page_h_config_easy_login', $p);
        }

        if (!$easy_access_id = OpenPNE_KtaiID::getID()) {
            $p = array('msg' => 27);
            openpne_redirect('ktai', 'page_h_config_easy_login', $p);
        }

        if (!$requests['delete']) {
            // 個体識別番号がすでに登録済み
            if (db_member_c_member_id4easy_access_id($easy_access_id)) {
                $p = array('msg' => 38);
                openpne_redirect('ktai', 'page_h_config', $p);
            } else {
                // update
                db_member_update_easy_access_id($u, $easy_access_id);
                $p = array('msg' => 28);
                openpne_redirect('ktai', 'page_h_config', $p);
            }
        } else {
            // delete
            db_member_update_easy_access_id($u, '');
            $p = array('msg' => 29);
            openpne_redirect('ktai', 'page_h_config', $p);
        }
    }
}

?>
