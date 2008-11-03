<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */
require_once OPENPNE_WEBAPP_DIR . '/lib/OpenPNE/KtaiID.php';

class ktai_do_h_regist_ktai_for_slavepne extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // 個体識別番号の登録が必要かどうか
        if (!db_member_is_necessary_to_register_easy_access_id($u, true)) {
            openpne_redirect('ktai', 'page_h_home');
        }

        // 携帯の個体識別番号の登録処理
        if (!$easy_access_id = OpenPNE_KtaiID::getID()) {
            // 携帯の個体識別番号を取得できませんでした
            $p = array('msg' => 27, 'ses' => $ses);
            openpne_redirect('ktai', 'page_o_login', $p);
        } else {
            $id = db_member_c_member_id4easy_access_id($easy_access_id);
            if ($id && $u != $id) {
                $p = array('msg' => 39);
                openpne_redirect('ktai', 'page_o_login', $p);
            }
            if (db_member_easy_access_id_is_blacklist(md5($easy_access_id))) {
                ktai_display_error('携帯ﾒｰﾙｱﾄﾞﾚｽを登録できませんでした。');
            }
            // 携帯個体識別番号を登録する
            db_member_update_easy_access_id($u, $easy_access_id);

            openpne_redirect('ktai', 'page_h_home');
        }
    }
}
?>
