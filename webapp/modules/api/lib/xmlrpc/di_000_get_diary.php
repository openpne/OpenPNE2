<?php
////////////////////////////////////////////////////////////////////////////////
//
//        ワンセグ連携API        日記取得API        di_000_get_diary.php
//
//        World Communications Co., Ltd. (Murata)
//
////////////////////////////////////////////////////////////////////////////////

require_once  'OP.php';

function xmlrpc_di_000_get_diary($message)
{
    $dummy = array();
    $re_false = array('result' => 1, 'list'=>$dummy);

    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return xmlrpc_get_response($re_false);
    }
    $params = XML_RPC_decode($param);

    if (empty($params['mid_to'])) {            //対象メンバID必須
        return xmlrpc_get_response($re_false);
    }
    if (empty($params['count'])) {            //取得数必須
        return xmlrpc_get_response($re_false);
    }

    if (!is_numeric($params['mid_to'])) {    //対象メンバIDは整数値
        return xmlrpc_get_response($re_false);
    }
    if (!empty($params['mid_from'])) {        //アクセスメンバIDは(存在する場合は)整数値
        if (!is_numeric($params['mid_from'])) {
            return xmlrpc_get_response($re_false);
        }
    }
    if (!is_numeric($params['count'])) {    //取得数は整数値
        return xmlrpc_get_response($re_false);
    }

    if ($params['count'] < 0) {                //取得数は正
        return xmlrpc_get_response($re_false);
    }

    $member_id_to = $params['mid_to'];
    $member_id_from = $params['mid_from'];
    $count = $params['count'];

    if ($count > 100) {                        //取得最大数は100
        $count = 100;
    }

    if (!$arr = OP::op_diary_get_c_diary($member_id_to, $member_id_from, $count)) {
        return xmlrpc_get_response($re_false);
    } else {
        foreach ($arr as $key => $value) {
            $diary[$key]['id'] = $arr[$key]['c_diary_id'];
            $diary[$key]['subject'] = $arr[$key]['subject'];
            $diary[$key]['body'] = $arr[$key]['body'];
            $diary[$key]['datetime'] = date('Y/m/d H:i:s', strtotime($arr[$key]['r_datetime']));
        }
        $re_true = array('result' => 0, 'list'=>$diary);
        return xmlrpc_get_response($re_true);
    }
}
?>
