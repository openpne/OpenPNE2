<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 一括招待メール送信 確認画面
class admin_page_send_invites_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['SNS_NAME'] = SNS_NAME;

        $v['cannot_send'] = true;
        $c_member_id_invite = 1;

        if ($requests['pc_mails'] && (OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            $params = array(
                'c_member'       => db_member_c_member4c_member_id($c_member_id_invite),
                'sid'            => 'xxxxxxxxxx',
                'invite_message' => $requests['message'],
            );
            list($subject, $body) = fetch_mail_m_tpl('m_pc_syoutai_mail', $params);
            $v['pc_subject'] = $subject;
            $v['pc_body'] = $body;
            $v['cannot_send'] = false;
        }

        if ($requests['ktai_mails'] && ((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
            $params['SNS_NAME'] = SNS_NAME;
            $params['url'] = openpne_gen_url('ktai', 'page_o_regist_pre') . '&ses=xxxxxxxxxx';
            $params['c_member'] = db_member_c_member4c_member_id($c_member_id_invite);
            $params['message'] = $requests['message'];
            list($subject, $body) = fetch_mail_m_tpl('m_ktai_regist_invite', $params);
            $v['ktai_subject'] = $subject;
            $v['ktai_body'] = $body;
            $v['cannot_send'] = false;
        }

        $this->set($v);
        return 'success';
    }
}

?>
