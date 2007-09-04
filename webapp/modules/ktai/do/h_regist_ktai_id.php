<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiID.php';

class ktai_do_h_regist_ktai_id extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // 現在のパスワードが正しいか
        if (!db_common_authenticate_password($u, $requests['password'], true)) {
            $p = array('msg' => 18);
            openpne_redirect('ktai', 'page_h_regist_ktai_id', $p);
        }

        if (!$easy_access_id = OpenPNE_KtaiID::getID()) {
            $p = array('msg' => 27);
            openpne_redirect('ktai', 'page_h_regist_ktai_id', $p);
        }

        // 個体識別番号がすでに登録済み
        if (db_member_c_member_id4easy_access_id($easy_access_id)) {
            $p = array('msg' => 39);
            openpne_redirect('ktai', 'page_h_regist_ktai_id', $p);
        } elseif (db_member_easy_access_id_is_blacklist(md5($easy_access_id))) {
            $p = array('msg' => 44);
            openpne_redirect('ktai', 'page_h_regist_ktai_id', $p);
        } else {
            // update
            db_member_update_easy_access_id($u, $easy_access_id);
            $p = array('msg' => 28);
            openpne_redirect('ktai', 'page_h_home', $p);
        }
    }
}

?>
