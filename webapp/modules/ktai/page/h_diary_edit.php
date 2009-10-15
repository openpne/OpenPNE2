<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_diary_edit extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        $public_flag = $requests['public_flag'];
        $is_comment_input = $requests['is_comment_input'];
        // ----------

        $c_member = db_member_c_member4c_member_id($u);
        if ($target_c_diary_id) {
            $c_diary = db_diary_get_c_diary4id($target_c_diary_id);
            if ($c_diary['c_member_id'] != $u) {
                handle_kengen_error();
            }

            // 内容の不備によるリダイレクト時は値を上書き
            if ($requests['msg']) {
                $c_diary['subject'] = $subject;
                $c_diary['body'] = $body;
                $c_diary['public_flag'] = $public_flag;
                $c_diary['is_comment_input'] = $is_comment_input;
            }
        } else {
            $c_diary['is_comment_input'] = 1;
            $c_diary['public_flag'] = $public_flag ? $public_flag : $c_member['public_flag_diary'];
            $c_diary['subject'] = $subject;
            $c_diary['body'] = $body;
        }
        $this->set('target_c_diary', $c_diary);

        if (MAIL_ADDRESS_HASHED) {
            $mail_address = "b{$u}-".t_get_user_hash($u)."@".MAIL_SERVER_DOMAIN;
        } else {
            $mail_address = "blog"."@".MAIL_SERVER_DOMAIN;;
        }
        $mail_address = MAIL_ADDRESS_PREFIX . $mail_address;
        $this->set('blog_address', $mail_address);

        //メンバー情報
        $this->set('member', $c_member);


        return 'success';
    }
}

?>
