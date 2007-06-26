<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// c_member_idもしくはメールアドレスを指定
class admin_do_send_messages_id_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $specify_type = $requests['specify_type'];
        $id_list_string = $requests['c_member_id_list'];
        
        if (!$id_list_string) {
            admin_client_redirect('send_messages_id_list', 'IDを入れてください');
        }
        //改行をスペースに
        $id_list_string = str_replace("\r\n", ' ', $id_list_string);
        $id_list_string = str_replace("\n", ' ', $id_list_string);
        $id_list_string = str_replace("\r", ' ', $id_list_string);
        $id_list_string = str_replace("　", ' ', $id_list_string);
        $id_list_parsed = explode(' ', $id_list_string); 
        
        $c_member_id_list = array();
        foreach ($id_list_parsed as $each_id) {
            if (!$each_id) {
                continue;
            }
            switch ($specify_type) {
                case "c_member_id":
                $each_c_member_id = $each_id;
                break;
                case "mail_address":
                if (!is_ktai_mail_address($each_id)) {
                    $each_c_member_id = _db_c_member_id4pc_address($each_id);
                } else {
                    $each_c_member_id = do_common_c_member_id4ktai_address($each_id);
                }
                if (!$each_c_member_id) {
                    admin_client_redirect('send_messages_id_list', '無効なメールアドレスが含まれています:'.$each_id);
                }
                break;
                default:
                admin_client_redirect('send_messages_id_list');
                break;
            }
            
            if (!is_numeric($each_c_member_id)) {
                admin_client_redirect('send_messages_id_list', 'IDは整数値で指定してください:'.$each_c_member_id);
            }
            if (!p_common_is_active_c_member_id($each_c_member_id)) {
                admin_client_redirect('send_messages_id_list', '無効なIDが含まれています:'.$each_c_member_id);
            }
            //重複チェック
            if (in_array($each_c_member_id, $c_member_id_list)) {
                continue;
            }
            $c_member_id_list[] = intval($each_c_member_id);
        }
        
        $_REQUEST['c_member_ids'] = $c_member_id_list;
        openpne_forward('admin', 'page', 'send_messages');
        exit;
    }
}

?>
