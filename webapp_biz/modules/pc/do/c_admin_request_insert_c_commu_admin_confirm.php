<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 繧ｳ繝溘Η繝九ユ繧｣邂｡逅・・ｺ､莉｣萓晞ｼ繝｡繝・そ繝ｼ繧ｸ騾∽ｿ｡
 */
class pc_do_c_admin_request_insert_c_commu_admin_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- 繝ｪ繧ｯ繧ｨ繧ｹ繝亥､画焚
        $target_c_member_id = $requests['target_c_member_id'];
        $target_c_commu_id = $requests['target_c_commu_id'];
        // ----------

        //--- 讓ｩ髯舌メ繧ｧ繝・け
        //閾ｪ蛻・′繧ｳ繝溘Η繝九ユ繧｣邂｡逅・・
        //target縺後さ繝溘Η繝九ユ繧｣繝｡繝ｳ繝舌・

        $status = db_common_commu_status($u, $target_c_commu_id);
        if (!$status['is_commu_admin']) {
            handle_kengen_error();
        }

        $status = db_common_commu_status($target_c_member_id, $target_c_commu_id);
        if (!$status['is_commu_member']) {
            handle_kengen_error();
        }
        //---

        $target_c_commu_admin_confirm_id =
            db_commu_insert_c_commu_admin_confirm($target_c_commu_id, $target_c_member_id);

        //繝｡繝・そ繝ｼ繧ｸ
        $c_member_id_from = $u;
        $c_member_from    = db_common_c_member4c_member_id_LIGHT($c_member_id_from);
        $c_member_to      = $target_c_member_id;
        $c_commu          = _db_c_commu4c_commu_id($target_c_commu_id);

        $subject ="繧ｳ繝溘Η繝九ユ繧｣邂｡逅・・ｺ､莉｣隕∬ｫ九Γ繝・そ繝ｼ繧ｸ";
        $body_disp =
            $c_member_from['nickname']." 縺輔ｓ縺九ｉ".$c_commu['name']." 繧ｳ繝溘Η繝九ユ繧｣縺ｮ邂｡逅・・ｺ､莉｣蟶梧悍繝｡繝・そ繝ｼ繧ｸ縺悟ｱ翫＞縺ｦ縺・∪縺吶・n".
            "\n".
            "縺薙・隕∬ｫ九↓縺､縺・※縲∵価隱榊ｾ・■繝ｪ繧ｹ繝医°繧画価隱阪∪縺溘・諡貞凄繧帝∈謚槭＠縺ｦ縺上□縺輔＞縲・n";

        // ---biz縺薙％縺九ｉ
        $biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繝・ぅ繝ｬ繧ｯ繝医Μ縺ｮ螳夂ｾｩ
        include_once($biz_dir.'lib/mysql_functions.php');  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繧医ｊ繝ｩ繧､繝悶Λ繝ｪ繧呈享蛟・

        if(biz_isKtaiMessage($target_c_member_id))
            biz_sendKtaiMessageSyoudakuMail($u, $target_c_member_id, $subject, $body);
        // ---biz縺薙％縺ｾ縺ｧ


        do_common_send_message_syoudaku($c_member_id_from, $target_c_member_id, $subject, $body_disp);

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_edit_member', $p);
    }
}
?>
