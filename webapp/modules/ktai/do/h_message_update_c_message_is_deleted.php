<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メッセージをごみ箱から（ごみ箱に）移動する
 */
class ktai_do_h_message_update_c_message_is_deleted extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $c_message_id = $requests['c_message_id'];
        // ----------

        $c_message = db_message_c_message4c_message_id($c_message_id);
        $is_deleted = false;  // 削除済みのメッセージかどうか
        $is_sent = false;  // メッセージの送信者かどうか

        if (!util_is_readable_message($u, $c_message_id)) {
            handle_kengen_error();
        }

        // $u がメッセージを削除したかどうかを判定する
        if ($c_message['c_member_id_to'] == $u
            && !empty($c_message['is_deleted_to'])) {  // 受信メッセージ
            $is_deleted = true;
        } elseif($c_message['c_member_id_from'] == $u
            && !empty($c_message['is_deleted_from'])) {  // 送信メッセージ
            $is_deleted = true;
            $is_sent = true;
        }

        if ($is_deleted === true) {  // メッセージをごみ箱から戻す
            db_message_move_message($c_message_id, $u);
            if ($is_sent === true) {  // 遷移先は送信ボックス
                $p = array('box' => 'outbox');
            } else {  // 遷移先は受信ボックス
                $p = array('box' => 'inbox');
            }
        } else {  // メッセージをごみ箱に入れる
            db_message_delete_c_message4c_message_id($c_message_id, $u);
            $p = array('box' => 'trash');  // 遷移先はごみ箱
        }

        openpne_redirect('ktai', 'page_h_message_box', $p);
    }
}

?>
