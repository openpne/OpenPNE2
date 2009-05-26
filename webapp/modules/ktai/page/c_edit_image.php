<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_edit_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        $c_commu = db_commu_c_commu4c_commu_id($target_c_commu_id);

        //--- 権限チェック
        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin'] && !$status['is_commu_sub_admin']) {
            handle_kengen_error();
        }
        //---

        if (MAIL_ADDRESS_HASHED) {
            $mail_address = 'ci' . $target_c_commu_id . '-' . t_get_user_hash($u) . "@" . MAIL_SERVER_DOMAIN;
        } else {
            $mail_address = 'ci' . $target_c_commu_id . "@" . MAIL_SERVER_DOMAIN;
        }
        $mail_address = MAIL_ADDRESS_PREFIX . $mail_address;
        $this->set('mail_address', $mail_address);

        $this->set('c_commu', $c_commu);

        return 'success';
    }
}

?>
