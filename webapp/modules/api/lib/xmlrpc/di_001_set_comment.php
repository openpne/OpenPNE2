<?php
////////////////////////////////////////////////////////////////////////////////
//
//        ワンセグ連携API        日記コメント書込API        di_001_set_comment.php
//
//        World Communications Co., Ltd. (Murata)
//
////////////////////////////////////////////////////////////////////////////////

require_once  'OP.php';

function xmlrpc_di_001_set_comment($message)
{
    $re_true = array('result' => 0);
    $re_false = array('result' => 1);

    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return xmlrpc_get_response($re_false);
    }
    $params = XML_RPC_decode($param);

    if (empty($params['mid'])) {            //コメント書込メンバID必須
        return xmlrpc_get_response($re_false);
    }
    if (empty($params['did'])) {            //コメント書込日記ID必須
        return xmlrpc_get_response($re_false);
    }
    if (is_null($params['body']) || $params['body'] === '') {
                                            //コメント本文必須(0または'0'を除く)
        return xmlrpc_get_response($re_false);
    }

    if (!is_numeric($params['mid'])) {        //コメント書込メンバIDは整数値
        return xmlrpc_get_response($re_false);
    }
    if (!is_numeric($params['did'])) {        //コメント書込日記IDは整数値
        return xmlrpc_get_response($re_false);
    }

    if (mb_strwidth($params['body']) > 65535) {
                                            //コメント本文は65535bytesまで
        return xmlrpc_get_response($re_false);
    }

    $member_id = $params['mid'];
    $diary_id = $params['did'];
    $diary_body = rawurldecode($params['body']);

    $d_member_id = OP::op_diary_get_c_member_id4c_diary_id($diary_id);
                                            //日記IDから日記作成メンバIDを取得
    if(!OP::op_member_is_active_c_member_id($d_member_id)) {
                                            //アクティブメンバーか？
        return xmlrpc_get_response($re_false);
    }

    if ($member_id != $d_member_id) {        //日記作成メンバ本人か？
        if (OP::op_member_is_access_block($member_id, $d_member_id)) {
                                            //アクセスブロックされているか？
            return xmlrpc_get_response($re_false);
        }

        $pubflg = OP::op_diary_get_c_member_id4public_flg($diary_id);
                                            //日記IDから公開範囲を取得
        if ($pubflg != "public") {            //公開範囲がpublic以外か？
            if ($pubflg != "friend") {        //公開範囲がfriendか？
                return xmlrpc_get_response($re_false);
            }
            if (!OP::op_friend_is_friend($d_member_id, $member_id)) {
                                            //フレンド登録済以外か？
                return xmlrpc_get_response($re_false);
            }
        }
    }

    if (!OP::op_diary_insert_c_diary_comment($member_id, $diary_id, $diary_body)) {
                                            //コメント書込
        return xmlrpc_get_response($re_false);
    }

    if (!OP::op_diary_c_diary_is_no_checked($diary_id)) {
                                            //未読フラグ書込
        return xmlrpc_get_response($re_false);
    }

    if ($member_id != $d_member_id) {        //日記作成メンバ本人か？
        OP::op_point_add_point($member_id, OP::op_action_get_point4c_action_id(3));
        OP::op_point_add_point($d_member_id, OP::op_action_get_point4c_action_id(2));
    }

    return xmlrpc_get_response($re_true);
}
?>
