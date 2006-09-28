<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_o_public_invite extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // 繧ｪ繝ｼ繝励Φ蛻ｶ縺ｮSNS莉･螟悶〒縺ｯ辟｡蜉ｹ
        if (IS_CLOSED_SNS) {
            client_redirect_login();
        }
        //<PCKTAI
        if (defined('OPENPNE_REGIST_FROM') &&
                !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>

        // --- 繝ｪ繧ｯ繧ｨ繧ｹ繝亥､画焚
        $pc_address = $requests['pc_address'];
        $pc_address2 = $requests['pc_address2'];
        // ----------

        //譁ｰ隕冗匳骭ｲ譎ゅ・諡帛ｾ・・ｼ・_member_id=1・・
        $c_member_id_invite = 1;

        session_start();
        if(count($_POST)>0){
            if(!(isset($_SESSION['captcha_keystring']) && $_SESSION['captcha_keystring'] ==  $requests['captcha'])){
                $msg = "遒ｺ隱阪く繝ｼ繝ｯ繝ｼ繝峨′隱､縺｣縺ｦ縺・∪縺・;
                $p = array('msg' => $msg);
                openpne_redirect('pc', 'page_o_public_invite', $p);
            }
        }
        unset($_SESSION['captcha_keystring']);
        if (!db_common_is_mailaddress($pc_address)) {
            $msg = '繝｡繝ｼ繝ｫ繧｢繝峨Ξ繧ｹ繧呈ｭ｣縺励￥蜈･蜉帙＠縺ｦ縺上□縺輔＞';
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_o_public_invite', $p);
        }
        if (is_ktai_mail_address($pc_address)) {
            $msg = '謳ｺ蟶ｯ繝｡繝ｼ繝ｫ繧｢繝峨Ξ繧ｹ縺ｯ蜈･蜉帙〒縺阪∪縺帙ｓ';
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_o_public_invite', $p);
        }
        if ($pc_address != $pc_address2) {
            $msg = '繝｡繝ｼ繝ｫ繧｢繝峨Ξ繧ｹ縺御ｸ閾ｴ縺励※縺・∪縺帙ｓ';
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_o_public_invite', $p);
        }
        if (_db_c_member_id4pc_address($pc_address)) {
            $msg = '縺昴・繧｢繝峨Ξ繧ｹ縺ｯ譌｢縺ｫ逋ｻ骭ｲ縺輔ｌ縺ｦ縺・∪縺・;
            $p = array('msg' => $msg);
            openpne_redirect('pc', 'page_o_public_invite', $p);
        }

        $session = create_hash();

        if (do_common_c_member_pre4pc_address($pc_address)) {
            do_h_invite_update_c_invite($c_member_id_invite, $pc_address, '', $session);
        } else {
            do_h_invite_insert_c_invite($c_member_id_invite, $pc_address, '', $session);
        }

        do_h_invite_insert_c_invite_mail_send($c_member_id_invite, $session, '', $pc_address);

        openpne_redirect('pc', 'page_o_public_invite_end');
    }
}

?>
