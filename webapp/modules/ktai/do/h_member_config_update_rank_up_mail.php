<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 設定変更
 */
class ktai_do_h_member_config_update_rank_up_mail extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        if (util_is_unused_mail('m_ktai_rank_up')) {
            handle_kengen_error();
        }

        db_member_update_c_member_config($u, 'SEND_RANK_UP_MAIL_KTAI', $requests['SEND_RANK_UP_MAIL_KTAI']);

        $p = array('msg' => 48);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
