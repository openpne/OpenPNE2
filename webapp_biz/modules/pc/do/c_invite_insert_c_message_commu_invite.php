<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_c_invite_insert_c_message_commu_invite extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- 繝ｪ繧ｯ繧ｨ繧ｹ繝亥､画焚
        $target_c_commu_id = $requests['target_c_commu_id'];
        $body = $requests['body'];
        $c_member_id_list = $requests['c_member_id_list'];
        // ----------

        if (!$c_member_id_list) {
            $p = array(
                'target_c_commu_id' => $target_c_commu_id,
                'msg' => '邏ｹ莉句・縺ｮ'.WORD_MY_FRIEND.'繧帝∈謚槭＠縺ｦ縺縺輔＞',
            );
            openpne_redirect('pc', 'page_c_invite', $p);
        }

        if (is_null($body) || $body === '') {
            $p = array(
                'target_c_commu_id' => $target_c_commu_id,
                'msg' => '繝｡繝・そ繝ｼ繧ｸ繧貞・蜉帙＠縺ｦ縺上□縺輔＞',
            );
            openpne_redirect('pc', 'page_c_invite', $p);
        }

        //--- 讓ｩ髯舌メ繧ｧ繝・け
        //繝輔Ξ繝ｳ繝・

        foreach ($c_member_id_list as $c_member_id) {
            if (!db_friend_is_friend($c_member_id, $u)) {
                handle_kengen_error();
            }
        }
        //---

        list($msg_subject, $msg_body) =
            create_message_commu_invite($u, $body, $target_c_commu_id);

        $commu = _db_c_commu4c_commu_id($target_c_commu_id);
        $c_member_id_admin = $commu['c_member_id_admin'];
        $public_flag = $commu['public_flag'];

        // ---biz縺薙％縺九ｉ
        $biz_dir = OPENPNE_MODULES_BIZ_DIR.'/biz/';  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繝・ぅ繝ｬ繧ｯ繝医Μ縺ｮ螳夂ｾｩ
        include_once($biz_dir.'lib/mysql_functions.php');  //biz繝｢繧ｸ繝･繝ｼ繝ｫ繧医ｊ繝ｩ繧､繝悶Λ繝ｪ繧呈享蛟・
        // ---biz縺薙％縺ｾ縺ｧ

        foreach ($c_member_id_list as $c_member_id) {

            // ---biz縺薙％縺九ｉ
            if(biz_isKtaiMessage($c_member_id))
                biz_sendKtaiMessageSyoukaiCommu($u, $c_member_id);
            // ---biz縺薙％縺ｾ縺ｧ

            do_common_send_message_syoukai_commu($u, $c_member_id, $msg_subject, $msg_body);
            //諡帛ｾ・・′繧ｳ繝溘Η繝九ユ繧｣邂｡逅・・〒縲√°縺､髱槫・髢九さ繝溘Η繝九ユ繧｣縺ｮ蝣ｴ蜷・
            if (($c_member_id_admin == $u)&&($public_flag != 'public')) {
                db_commu_insert_c_commu_admin_invite($target_c_commu_id, $c_member_id);
            }
        }

        $p = array('target_c_commu_id' => $target_c_commu_id);
        openpne_redirect('pc', 'page_c_home', $p);
    }
}

?>
