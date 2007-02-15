<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_login extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $msg_id = $requests['msg'];
        $kad = $requests['kad'];
        // ----------

        // inc_entry_point
        $this->set('inc_ktai_entry_point', fetch_ktai_inc_entry_point_o_login($this->getView()));

        //メッセージ
        $this->set('msg', k_p_common_msg4msg_id($msg_id));

        $this->set('ktai_address', t_decrypt($kad));
        $this->set('SNS_NAME', SNS_NAME);
        $this->set('IS_CLOSED_SNS', IS_CLOSED_SNS);

        return 'success';
    }
}
?>
