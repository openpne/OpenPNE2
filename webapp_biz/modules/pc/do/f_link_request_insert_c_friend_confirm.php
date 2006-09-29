<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 繝輔Ξ繝ｳ繝峨Μ繧ｯ繧ｨ繧ｹ繝医ｒ騾√ｋ
 */
class pc_do_f_link_request_insert_c_friend_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- 繝ｪ繧ｯ繧ｨ繧ｹ繝亥､画焚
        $target_c_member_id = $requests['target_c_member_id'];
        $body = $requests['body'];
        // ----------

        //--- 讓ｩ髯舌メ繧ｧ繝・け
        //繝輔Ξ繝ｳ繝峨〒縺ｪ縺・or 繝輔Ξ繝ｳ繝画価隱堺ｸｭ縺ｧ縺ｪ縺・

        $status = db_common_friend_status($u, $target_c_member_id);
        if ($status['is_friend']) {
            $p = array('target_c_member_id' => $target_c_member_id);
            openpne_redirect('pc', 'page_f_link_request_err_already', $p);
        } elseif($status['is_friend_confirm']) {
            $p = array('target_c_member_id' => $target_c_member_id);
            openpne_redirect('pc', 'page_f_link_request_err_wait', $p);
        }

        //繧｢繧ｯ繧ｻ繧ｹ繝悶Ο繝・け險ｭ螳・
        if (p_common_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }
        //---


        $c_member_id_from = $u;

        db_friend_insert_c_friend_confirm($c_member_id_from,$target_c_member_id,$body);

        //繝｡繝・そ繝ｼ繧ｸ
        $c_member_to   = db_common_c_member4c_member_id($target_c_member_id);
        $c_member_from = db_common_c_member4c_member_id($c_member_id_from);

        $subject =WORD_FRIEND."繝ｪ繝ｳ繧ｯ隕∬ｫ九Γ繝・そ繝ｼ繧ｸ";
        $body_disp =
            $c_member_from['nickname']." 縺輔ｓ縺九ｉ".WORD_FRIEND."繝ｪ繝ｳ繧ｯ隕∬ｫ九・繝｡繝・そ繝ｼ繧ｸ縺悟ｱ翫＞縺ｦ縺・∪縺吶・n".
            "\n".
            "繝｡繝・そ繝ｼ繧ｸ・喀n".
            $body."\n".
            "\n".
            "縺薙・隕∬ｫ九↓縺､縺・※縲∵価隱榊ｾ・■繝ｪ繧ｹ繝医°繧画価隱阪∪縺溘・諡貞凄繧帝∈謚槭＠縺ｦ縺上□縺輔＞縲・n";

        // ---biz縺薙％縺九ｉ
        $biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繝・ぅ繝ｬ繧ｯ繝医Μ縺ｮ螳夂ｾｩ
        include_once($biz_dir.'lib/mysql_functions.php');  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繧医ｊ繝ｩ繧､繝悶Λ繝ｪ繧呈享蛟・
        if(biz_isKtaiMessage($target_c_member_id))
            biz_sendKtaiMessageSyoudakuMail($c_member_id_from, $target_c_member_id, $subject, $body_disp);
        // ---biz縺薙％縺ｾ縺ｧ


        do_common_send_message_syoudaku($c_member_id_from, $target_c_member_id, $subject, $body_disp);

        $p = array('target_c_member_id' => $target_c_member_id);
        openpne_redirect('pc', 'page_f_home', $p);
    }
}

?>
