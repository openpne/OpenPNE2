<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_do_h_config_mail_receive_update_mail_receive extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $is_receive_ktai_mail = $requests['is_receive_ktai_mail'];
        // ----------

        db_member_update_mail_receive($u, $is_receive_ktai_mail);

        $p = array('msg' => 32);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
