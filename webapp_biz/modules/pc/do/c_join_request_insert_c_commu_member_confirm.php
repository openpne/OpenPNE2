<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 繧ｳ繝溘Η繝九ユ繧｣蜿ょ刈繝ｪ繧ｯ繧ｨ繧ｹ繝・
 */
class pc_do_c_join_request_insert_c_commu_member_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- 繝ｪ繧ｯ繧ｨ繧ｹ繝亥､画焚
        $target_c_commu_id = $requests['target_c_commu_id'];
        $body = $requests['body'];
        // ----------

        //--- 讓ｩ髯舌メ繧ｧ繝・け
        //繧ｳ繝溘Η繝九ユ繧｣繝｡繝ｳ繝舌・縺ｧ縺ｪ縺・or 蜿ょ刈謇ｿ隱堺ｸｭ縺ｧ縺ｪ縺・

        $status = db_common_commu_status($u, $target_c_commu_id);
        if ($status['is_commu_member'] ||
            $status['is_commu_member_confirm']) {
            handle_kengen_error();
        }
        //---


        $c_member_id_from = $u;

        db_commu_insert_c_commu_member_confirm($target_c_commu_id, $c_member_id_from, $body);

        //繝｡繝・そ繝ｼ繧ｸ
        {
            $c_commu = _db_c_commu4c_commu_id($target_c_commu_id);
            $c_member_id_to = $c_commu['c_member_id_admin'];
            $c_member_from  = db_common_c_member4c_member_id($c_member_id_from);

            $subject ="繧ｳ繝溘Η繝九ユ繧｣蜿ょ刈隕∬ｫ九Γ繝・そ繝ｼ繧ｸ";
            $body_disp =
                $c_member_from['nickname']." 縺輔ｓ縺九ｉ ".$c_commu['name']." 繧ｳ繝溘Η繝九ユ繧｣縺ｸ縺ｮ蜿ょ刈蟶梧悍繝｡繝・そ繝ｼ繧ｸ縺悟ｱ翫＞縺ｦ縺・∪縺吶・n".
                "\n".
                "繝｡繝・そ繝ｼ繧ｸ・喀n".
                $body."\n".
                "\n".
                "縺薙・隕∬ｫ九↓縺､縺・※縲∵価隱榊ｾ・■繝ｪ繧ｹ繝医°繧画価隱阪∪縺溘・諡貞凄繧帝∈謚槭＠縺ｦ縺上□縺輔＞縲・n";

            // ---biz縺薙％縺九ｉ
            $biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繝・ぅ繝ｬ繧ｯ繝医Μ縺ｮ螳夂ｾｩ
            include_once($biz_dir.'lib/mysql_functions.php');  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繧医ｊ繝ｩ繧､繝悶Λ繝ｪ繧呈享蛟・

            if(biz_isKtaiMessage($target_c_member_id))
                biz_sendKtaiMessageSyoudakuMail($u, $target_c_member_id, $subject, $body);
            // ---biz縺薙％縺ｾ縺ｧ

            do_common_send_message_syoudaku($c_member_id_from, $c_member_id_to, $subject, $body_disp);
        }
 
        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_home', $p);
    }
}

?>
