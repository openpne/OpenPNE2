<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_message_send extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_member_id = $requests['target_c_member_id'];
        $form_val['subject'] = $requests['subject'];
        $form_val['body'] = $requests['body'];
        $box = $requests['box'];
        $is_syusei = $requests['is_syusei'];
        $form_val['target_c_message_id'] = $requests['target_c_message_id'];
        $form_val['jyusin_c_message_id'] = $requests['jyusin_c_message_id'];
        // ----------

        // 権限チェック
        if ($target_c_member_id == $u) {  // 自分にメッセージは送れない
            handle_kengen_error();
        }

        if ($form_val['target_c_message_id']) {
            $c_message = db_message_c_message4c_message_id($form_val['target_c_message_id']);
            if ($c_message['c_member_id_from'] != $u) {
                if ($c_message['c_member_id_to'] != $u || !$c_message['is_send']) {
                    handle_kengen_error();
                }
            }
        }

        $syusei = 0;
        if ($form_val['subject'] && $form_val['body'])
            $syusei = 1;

        if (db_member_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        //メッセージIDから情報を取り出す
        if ($box == "savebox" && $form_val['target_c_message_id']) {
            $tmplist = db_message_c_message4c_message_id($form_val['target_c_message_id']);
            if (!$requests['msg1'] && !$requests['msg2']) {
                $form_val['subject'] = $tmplist['subject'];
                $form_val['body'] = $tmplist['body'];
            }
            if ($tmplist['c_member_id_to']) {
                $target_c_member_id = $tmplist['c_member_id_to'];
            }
        } elseif (!$syusei && $form_val['target_c_message_id']) {
            $tmplist = db_message_c_message4c_message_id($form_val['target_c_message_id']);
            $form_val['body'] = message_body2inyou($tmplist['body']);
            $form_val['subject'] = "Re:".$tmplist['subject'];
            if ($tmplist['c_member_id_from']) {
                $target_c_member_id = $tmplist['c_member_id_from'];
            }
        }

        $target_member = db_member_c_member4c_member_id($target_c_member_id);
        if (empty($target_member)) {
            handle_kengen_error();
        }

        $this->set('inc_navi', fetch_inc_navi('f', $target_c_member_id));

        //ターゲット情報
        $this->set('target_member', $target_member);

        //ターゲットのid
        $this->set('target_c_member_id', $target_c_member_id);
        //ターゲットのid
        $this->set('target_c_message_id', $form_val['target_c_message_id']);

        $this->set('form_val', $form_val);
        $this->set('box', $box);

        // 許可されている拡張子のリスト
        $this->set('allowed_extensions', util_get_file_allowed_extensions('string'));

        return 'success';
    }
}
?>
