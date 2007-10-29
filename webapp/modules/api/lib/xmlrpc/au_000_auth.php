<?php
////////////////////////////////////////////////////////////////////////////////
//
//        ワンセグ連携API        認証API        au_000_auth.php
//
//        World Communications Co., Ltd. (Murata)
//
////////////////////////////////////////////////////////////////////////////////

require_once  'OP.php';

function xmlrpc_au_000_auth($message)
{
    $re_false = array('result' => 1);

    $param = $message->getParam(0);
    if (!XML_RPC_Value::isValue($param)) {
        return xmlrpc_get_response($re_false);
    }
    $params = XML_RPC_decode($param);

    if (empty($params['mail'])) {            //メールアドレス必須
        return xmlrpc_get_response($re_false);
    }
    if (empty($params['passwd'])) {            //パスワード必須
        return xmlrpc_get_response($re_false);
    }
    if (is_null($params['sidflg']) || $params['sidflg'] === '') {
                                            //セッション作成フラグ必須
        return xmlrpc_get_response($re_false);
    }
    if (!is_numeric($params['sidflg'])) {    //セッション作成フラグは数値
        return xmlrpc_get_response($re_false);
    }
    if (intval($params['sidflg']) != 0 && intval($params['sidflg']) != 1) {
                                            //セッション作成フラグは0 or 1
        return xmlrpc_get_response($re_false);
    }

    $user_mail = htmlentities($params['mail']);
    $user_passwd = htmlentities($params['passwd']);
    $sid =  htmlspecialchars($params['sid']);
    $sidflg = intval($params['sidflg']);

    $is_ktai = is_ktai_mail_address($user_mail);
                                            //携帯か？

    if ($is_ktai) {                            //携帯からのアクセス
        $c_member_id = OP::op_member_k_auth_login($user_mail, $user_passwd);
    } else {                                //PCからのアクセス
        $c_member_id = OP::op_member_auth_login($user_mail, $user_passwd);
    }

    if (!$c_member_id) {                    //メンバIDが取得できたか？
        return xmlrpc_get_response($re_false);
    }
    if(OP::op_member_is_login_rejected($c_member_id)) {
                                            //ログイン拒否されているか？
        return xmlrpc_get_response($re_false);
    }
    if(!OP::op_member_is_active_c_member_id($c_member_id)) {
                                            //アクティブメンバーか？
        return xmlrpc_get_response($re_false);
    }

    if (!$sidflg) {                            //セッションIDを作成するか
        $req = array(
            'c_member_id'=>$c_member_id,
            'address'=>$user_mail,
            'password'=>$user_passwd,
            'sid'=>$sid,
            'is_ktai'=>$is_ktai,
        );
        if (!$session_id = OP::op_k_login($req)) {
            return xmlrpc_get_response($re_false);
        }
        $re_true = array(
            'result' => 0,
            'sid' => $session_id,
            'mid' => intval($c_member_id),
        );
    } else {                                //セッションIDを作成しない
        $re_true = array(
            'result' => 0,
            'mid' => intval($c_member_id),
        );
    }

    return xmlrpc_get_response($re_true);
}
?>
