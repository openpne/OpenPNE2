<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 繝｡繝・そ繝ｼ繧ｸ騾∽ｿ｡
 */
class pc_do_f_message_send_insert_c_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- 繝ｪ繧ｯ繧ｨ繧ｹ繝亥､画焚
        $c_member_id_to = $requests['c_member_id_to'];
        $subject = $requests['subject'];
        $body = $requests['body'];
        $tmpfile_1 = $requests['tmpfile_1'];
        $tmpfile_2 = $requests['tmpfile_2'];
        $tmpfile_3 = $requests['tmpfile_3'];
        // ----------

        $msg1 = "";
        $msg2 = "";

        if (null == $subject) {
            $msg1 = "莉ｶ蜷阪ｒ蜈･蜉帙＠縺ｦ縺上□縺輔＞";
        }
        if (null == $body){
            $msg2 = "繝｡繝・そ繝ｼ繧ｸ繧貞・蜉帙＠縺ｦ縺上□縺輔＞";
        }

        if ($msg1 || $msg2) {
            $p = array(
                'target_c_member_id' => $c_member_id_to,
                'target_c_message_id' => $requests['target_c_message_id'],
                'jyusin_c_message_id' => $requests['jyusin_c_message_id'],
                'body' => $requests['body'],
                'subject' => $requests['subject'],
                'msg1' => $msg1,
                'msg2' => $msg2,
            );
            openpne_redirect('pc', 'page_f_message_send', $p);
        }

        //菫ｮ豁｣
        if ($requests['no']) {
            $p = array(
                'target_c_member_id' => $c_member_id_to,
                'target_c_message_id' => $requests['target_c_message_id'],
                'jyusin_c_message_id' => $requests['jyusin_c_message_id'],
                'body' => $requests['body'],
                'subject' => $requests['subject'],
            );
            openpne_redirect('pc', 'page_f_message_send', $p);
        }

        //--- 讓ｩ髯舌メ繧ｧ繝・け
        //騾∽ｿ｡蜈医′閾ｪ蛻・ｻ･螟・

        if ($c_member_id_to == $u) {
            handle_kengen_error();
        }

        //繧｢繧ｯ繧ｻ繧ｹ繝悶Ο繝・け險ｭ螳・
        if (p_common_is_access_block($u, $c_member_id_to)) {
            openpne_redirect('pc', 'page_h_access_block');
        }
        //---

        //霑比ｿ｡貂医∩縺ｫ縺吶ｋ
        if ($requests['jyusin_c_message_id']) {
            do_update_is_hensin($requests['jyusin_c_message_id']);
        }

        //荳区嶌縺堺ｿ晏ｭ倥′蟄伜惠縺励↑縺・        if ($requests['target_c_message_id'] == $requests['jyusin_c_message_id']) {
            $c_message_id = do_common_send_message($u, $c_member_id_to, $subject, $body);
        } else {
        	$c_message_id = $requests['target_c_message_id'];
            update_message_to_is_save($requests['target_c_message_id'], $subject, $body, 1);
        }
        //逕ｻ蜒乗諺蜈･
        $sessid = session_id();
        $filename_1 = image_insert_c_image4tmp("ms_{$c_message_id}_1", $tmpfile_1);
        $filename_2 = image_insert_c_image4tmp("ms_{$c_message_id}_2", $tmpfile_2);
        $filename_3 = image_insert_c_image4tmp("ms_{$c_message_id}_3", $tmpfile_3);
        t_image_clear_tmp($sessid);
        db_update_c_message($c_message_id, $subject, $body, $filename_1, $filename_2, $filename_3);

        // ---biz縺薙％縺九ｉ
        $biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繝・ぅ繝ｬ繧ｯ繝医Μ縺ｮ螳夂ｾｩ
        include_once($biz_dir.'lib/mysql_functions.php');  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繧医ｊ繝ｩ繧､繝悶Λ繝ｪ繧呈享蛟・

        if(biz_isKtaiMessage($c_member_id_to))
            biz_sendKtaiMessage($u, $c_member_id_to, $subject, $body);
        // ---biz縺薙％縺ｾ縺ｧ


        $p = array('msg' => 1);
        openpne_redirect('pc', 'page_h_reply_message', $p);
    }
}

?>
