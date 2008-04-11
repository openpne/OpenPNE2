<?php
////////////////////////////////////////////////////////////////////////////////
//
//        ワンセグ連携：「あしあと」取得API
//
////////////////////////////////////////////////////////////////////////////////

require_once  'OP.php';

function xmlrpc_as_000_get_ashiato($message)
{
    $dummy = array();
    $re_false = array('result' => 1, 'list'=>$dummy);

    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return xmlrpc_get_response($re_false);
    }
    $params = XML_RPC_decode($param);

    //対象メンバID必須
    if (empty($params['mid'])) {
        return xmlrpc_get_response($re_false);
    }

    //取得数必須
    if (empty($params['count'])) {
        return xmlrpc_get_response($re_false);
    }

    //取得数は数値
    if (!is_numeric($params['count'])) {
        return xmlrpc_get_response($re_false);
    }

    $member_id = $params['mid'];
    $count = intval($params['count']);
    $profile = $params['profile'];

    //取得数は正
    if ($count <= 0) {
        return xmlrpc_get_response($re_false);
    }

    //登録済みのメンバか
    if( !OP::op_member_is_active_c_member_id($member_id) ) {
        return xmlrpc_get_response($re_false);
    }

    //あしあとのあるメンバか
    if( !OP::op_is_ahiato_member($member_id) ) {
        return xmlrpc_get_response($re_false);
    }

    //取得最大数は100
    if ($count > 100) {
        $count = 100;
    }

    $list = OP::op_ashiato_list_c_member_profile($member_id, $count, $profile);
    if( empty($list) ){
        return xmlrpc_get_respose($re_false);
    }

    return xmlrpc_get_response( array( 'result' => 0, 'list' => $list) );

}
?>
