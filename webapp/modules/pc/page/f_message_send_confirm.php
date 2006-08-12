<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_f_message_send_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg1'] = $errors['subject'];
        $_REQUEST['msg2'] = $errors['body'];
        openpne_forward('pc', 'page', 'f_message_send', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $form_val['target_c_member_id'] = $requests['target_c_member_id'];
        $form_val['subject'] = $requests['subject'];
        $form_val['body'] = $requests['body'];
        $form_val['target_c_message_id'] = $requests['target_c_message_id'];
        $form_val['jyusin_c_message_id'] = $requests['jyusin_c_message_id'];
        $save = $requests['save'];
        // ----------

        $target_c_member_id = $form_val['target_c_member_id'];

        if (p_common_is_access_block($u, $target_c_member_id)) {
            openpne_redirect('pc', 'page_h_access_block');
        }

        $this->set('inc_navi', fetch_inc_navi("f", $target_c_member_id));

        //ターゲット情報
        $this->set("target_member", db_common_c_member4c_member_id($target_c_member_id));

        //ターゲットのid
        $this->set("target_c_member_id", $form_val['target_c_member_id']);

        $this->set("form_val", $form_val);

        //下書き保存
        if (!empty ($save)) {
            //下書き保存が存在しない
            if ($form_val['target_c_message_id'] == $form_val['jyusin_c_message_id']) {
                insert_message_to_is_save($form_val['target_c_member_id'], $u, $form_val['subject'], $form_val['body'], $_REQUEST['jyusin_c_message_id']);
            } else { //下書き保存が存在する
                update_message_to_is_save($form_val['target_c_message_id'], $form_val['subject'], $form_val['body']);
            }

            $p = array('msg' => 2);
            openpne_redirect('pc', 'page_h_reply_message', $p);
        }

        return 'success';
    }
}

?>
