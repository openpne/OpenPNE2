<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_album_cover_image_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_album_id = $requests['target_c_album_id'];
        // ----------

        $c_member = db_member_c_member4c_member_id($u);
        $c_album = db_album_get_c_album4c_album_id($target_c_album_id);
        if ($c_album['c_member_id'] != $u) {
            handle_kengen_error();
        }
        $this->set('target_c_album', $c_album);

        //メンバー情報
        $this->set('member', $c_member);

        if (MAIL_ADDRESS_HASHED) {
            $mail_address = "ac{$target_c_album_id}-".t_get_user_hash($u).'@'.MAIL_SERVER_DOMAIN;
        } else {
            $mail_address = "ac{$target_c_album_id}".'@'.MAIL_SERVER_DOMAIN;
        }
        $mail_address = MAIL_ADDRESS_PREFIX . $mail_address;
        $this->set('mail_address', $mail_address);

        return 'success';
    }
}

?>
