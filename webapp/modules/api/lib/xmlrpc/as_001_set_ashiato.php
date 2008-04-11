<?php
////////////////////////////////////////////////////////////////////////////////
//
//        ワンセグ連携：「あしあと」書込みAPI
//
////////////////////////////////////////////////////////////////////////////////

require_once  'OP.php';

function xmlrpc_as_001_set_ashiato($message)
{
    $dummy = array();
    $re_false = array('result' => 1 );
    $re_true = array('result' => 0 );

    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return xmlrpc_get_response($re_false);
    }
    $params = XML_RPC_decode($param);

    //「あしあと」を付けたメンバID必須
    if (empty($params['mid_from'])) {
        return xmlrpc_get_response($re_false);
    }
    //「あしあと」を付けられたメンバID必須
    if (empty($params['mid_to'])) {
        return xmlrpc_get_response($re_false);
    }

    $mid_from = $params['mid_from'];
    $mid_to   = $params['mid_to'];

    //登録済みのメンバか
    if( !OP::op_member_is_active_c_member_id($mid_from) ) {
        return xmlrpc_get_response($re_false);
    }

    //登録済みのメンバか
    if( !OP::op_member_is_active_c_member_id($mid_to) ) {
        return xmlrpc_get_response($re_false);
    }

    //あしあとを付けたメンバIDと付けられたメンバIDは同一か
    if( $mid_from == $mid_to) {
        return xmlrpc_get_response($re_true);
    }

    //一定時間内の連続アクセスか？
    if ( !OP::op_ashiato_check_access_minute($mid_to, $mid_from)) {
        return xmlrpc_get_response($re_true);
    }

    //忍び足状態か？
    if (USE_SHINOBIASHI) {
        if (OP::op_member_is_shinobiashi($mid_from)) {
            return xmlrpc_get_response($re_true);
        }
    }

    if( !OP::op_ashiato_insert_c_ashiato( $mid_to, $mid_from) ){
        return xmlrpc_get_response($re_false);
    }

    //正常終了
    return xmlrpc_get_response($re_true);

}
?>
