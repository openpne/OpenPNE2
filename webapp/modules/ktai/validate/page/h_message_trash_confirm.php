<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_message_trash_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_message_id = $requests['c_message_id'];
        // ----------

        $this->set("c_message_id", $c_message_id);

        return 'success';
    }
}

?>
