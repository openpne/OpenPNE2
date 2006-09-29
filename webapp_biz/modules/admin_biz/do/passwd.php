<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 繝代せ繝ｯ繝ｼ繝牙・逋ｺ陦・
class admin_biz_do_passwd extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_member_id = $requests['target_c_member_id'];
        $password = $requests['password'];

        if (!ctype_alnum($password) ||
            strlen($password) < 6 ||
            strlen($password) > 12) {
            admin_biz_client_redirect('passwd',
                '繝代せ繝ｯ繝ｼ繝峨・6・・2譁・ｭ励・蜊願ｧ定恭謨ｰ縺ｧ蜈･蜉帙＠縺ｦ縺上□縺輔＞',
                'target_c_member_id='.$c_member_id);
            exit;
        }

        if ($requests['password'] !== $requests['password2']) {
            admin_biz_client_redirect('passwd',
                '繝代せ繝ｯ繝ｼ繝峨′荳閾ｴ縺励※縺・∪縺帙ｓ',
                'target_c_member_id='.$c_member_id);
            exit;
        }

        //繝代せ繝ｯ繝ｼ繝牙､画峩
        do_common_update_password($c_member_id, $password);

        //繝｡繝ｼ繝ｫ騾∽ｿ｡
        $c_member_secure = db_common_c_member_secure4c_member_id($c_member_id);
        if ($c_member_secure['pc_address']) {
            do_password_query_mail_send($c_member_id, $c_member_secure['pc_address'], $password);
        } else {
            db_mail_send_m_ktai_password_query($c_member_id, $password);
        }

        admin_biz_client_redirect('top', '繝ｦ繝ｼ繧ｶ繝ｼ縺ｮ繝代せ繝ｯ繝ｼ繝峨ｒ螟画峩縺励√Γ繝ｼ繝ｫ繧帝∽ｿ｡縺励∪縺励◆');
    }
}

?>
