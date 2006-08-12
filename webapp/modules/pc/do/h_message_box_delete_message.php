<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * メッセージを削除
 */
class pc_do_h_message_box_delete_message extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $c_message_id = $requests['c_message_id'];
        $box = $requests['box'];
        // ----------

        //--- 権限チェック
        //TODO: if / foreachの中に入っている
        //---

        //削除するメッセージを選択してない
        if (count($c_message_id) == 0) {
            $p = array('box' => $box);
            openpne_redirect('pc', 'page_h_message_box', $p);
        }

        //ごみ箱から
        if ($box == "trash") {

            //ごみ箱から移動
            if (!empty($requests['move']) ){
                foreach($c_message_id as $val){
                    $c_message = _db_c_message4c_message_id($val);
                    if ($c_message['c_member_id_from'] != $u
                        && $c_message['c_member_id_to'] != $u) {
                        handle_kengen_error();
                    }
                    do_h_message_box_move_message($val, $u);
                }
                $p = array('box' => $box);
                openpne_redirect('pc', 'page_h_message_box', $p);
            }

            //ごみ箱から完全削除　復元方法なし
            else {
                foreach ($c_message_id as $val) {
                    $c_message = _db_c_message4c_message_id($val);
                    if ($c_message['c_member_id_from'] == $u) {
                        do_delete_c_message_from_trash($val);
                    }
                    elseif ($c_message['c_member_id_to'] == $u) {
                        do_delete_c_message_to_trash($val);
                    }
                    else {
                        handle_kengen_error();
                    }
                }
                $p = array('box' => $box);
                openpne_redirect('pc', 'page_h_message_box', $p);
            }
        }

        // メッセージをごみ箱へ移動
        else {
            foreach ($c_message_id as $val) {
                $c_message = _db_c_message4c_message_id($val);
                if ($c_message['c_member_id_from'] != $u
                    && $c_message['c_member_id_to'] != $u) {
                    handle_kengen_error();
                }
                _do_delete_c_message4c_message_id($val, $u);
            }
        }

        $p = array('box' => $box);
        openpne_redirect('pc', 'page_h_message_box', $p);
    }
}

?>
