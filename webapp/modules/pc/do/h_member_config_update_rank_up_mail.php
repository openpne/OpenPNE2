<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 設定変更
 */
class pc_do_h_member_config_update_rank_up_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // ランクアップメール通知

        db_member_update_c_member_config($u, 'SEND_RANK_UP_MAIL_PC', $requests['SEND_RANK_UP_MAIL_PC']);

        $default_config = util_get_c_member_config_default();
        foreach ($requests as $key => $value) {
            if (!is_null($value) && array_key_exists($key, $default_config)) {
                db_member_update_c_member_config($u, $key, $value);
            }
        }

        openpne_redirect('pc', 'page_h_home');
 
    }
}

?>
