<?php
////////////////////////////////////////////////////////////////////////////////
//
//        共通メソッド    OP.php
//
//        2007-09-26    World Communications (Murata)
//
////////////////////////////////////////////////////////////////////////////////


$GLOBALS['XML_RPC_defencoding'] = "UTF-8";


class OP
{

    ////////////////////////////////////////////////////////////////////////////////
    // lib/OpenPNE/Auth.php
    // modules/ktai/auth.inc
    // modules/ktai/do/o_login.php よりコピー・修正
    ////////////////////////////////////////////////////////////////////////////////

    /**
     * メールアドレス、パスワードを元に認証判定を行う
     *
     * @param   array $requests リクエストパラメータ
     * @return  string  sessionid セッションID
     */
    function op_k_login($requests)
    {
        require_once 'OpenPNE/Auth.php';

        // --- リクエスト変数
        $c_member_id = $requests['c_member_id'];
        $address = $requests['address'];
        $password = $requests['password'];
        $sid = $requests['sid'];
        $is_ktai = $requests['is_ktai'];
        // ----------

        // --- セッションIDが渡されてきた場合は一旦ログアウト
        if (!empty($sid)) {
            session_id($sid);
            session_start();
            $_SESSION = array();
            session_destroy();
        }

        if ($is_ktai) {
            $sess_name = 'OpenPNEktai';
            $ei_name = "ktai";
        } else {
            $sess_name = 'PHPSESSID';
            $ei_name = "common";
        }
        $_POST['username'] = $address;
        $_POST['password'] = $password;

        @session_name($sess_name);
        @session_start();
        @session_regenerate_id();

        $config = get_auth_config($is_ktai);
        $config['options']['advancedsecurity'] = false;
        $auth = new OpenPNE_Auth($config);
        $auth->setExpire($GLOBALS['OpenPNE'][$ei_name]['session_lifetime']);
        $auth->setIdle($GLOBALS['OpenPNE'][$ei_name]['session_idletime']);

        $auth->logout();

        if (LOGIN_CHECK_ENABLE) {
            include_once 'OpenPNE/LoginChecker.php';
            $options = array(
            'check_num'   => LOGIN_CHECK_NUM,
            'check_time'  => LOGIN_CHECK_TIME,
            'reject_time' => LOGIN_REJECT_TIME,
            );
            $lc =& new OpenPNE_LoginChecker($options);
            if ($lc->is_rejected() || !$auth->login(false)) {
                $lc->fail_login();
                return false;
            }
        } else {
            if (!$auth->login(false)) {
                return false;
            }
        }

        $_SESSION['c_member_id'] = $c_member_id;

        return session_id();
    }





    ////////////////////////////////////////////////////////////////////////////////
    // lib/util/ktai.php
    // lib/OpenPNE/KtaiUA.php よりコピー・修正
    ////////////////////////////////////////////////////////////////////////////////

    /**
     * 携帯電話からのアクセスかどうかを User-Agent の値から判定する
     *
     * @param   string $ua User-Agent
     * @return  bool
     */
    function op_isKtaiUserAgent($ua)
    {
        // DoCoMo
        if (!strncmp($ua, 'DoCoMo', 6)) {
            $is_ktai = true;
        }

        // Vodafone(PDC)
        elseif (!strncmp($ua, 'J-PHONE', 7)) {
            $is_ktai = true;
        }

        // Vodafone(3G)
        //* Up.Browser を搭載しているものがある(auより先に評価)
        elseif (!strncmp($ua, 'Vodafone', 8) || !strncmp($ua, 'MOT', 3)) {
            $is_ktai = true;
        }

        // SoftBank
        elseif (!strncmp($ua, 'SoftBank', 8)) {
            $is_ktai = true;
        }

        // au
        elseif (!strncmp($ua, 'KDDI', 4) || !strncasecmp($ua, 'up.browser', 10)) {
            $is_ktai = true;
        }

        // WILLCOM / DDIPOCKET
        elseif (strpos($ua, 'WILLCOM') !== false || strpos($ua, 'SHARP/WS') !== false || strpos($ua, 'DDIPOCKET') !== false) {
            $is_ktai = true;
        }

        else {
            $is_ktai = false;
        }

        return $is_ktai;
    }








    ////////////////////////////////////////////////////////////////////////////////
    // lib/db/member.php よりコピー・修正
    ////////////////////////////////////////////////////////////////////////////////
    /**
     * PCアドレスからメンバーIDを取得する
     *
     * @param   string $pc_address PCアドレス
     * @return  int    $c_member_id メンバーID
     */
    function op_member_c_member_id4pc_address($pc_address)
    {
        return db_member_c_member_id4pc_address($pc_address);
    }

    /**
     * 携帯アドレスからメンバーIDを取得する
     *
     * @param   string $ktai_address 携帯アドレス
     * @return  int    $c_member_id メンバーID
     */
    function op_member_c_member_id4ktai_address($ktai_address)
    {
        return db_member_c_member_id4ktai_address($ktai_address);
    }

    /**
     * ログインIDからメンバーIDを取得する
     *
     * @param   string $username ログインID
     * @param   bool $is_ktai 携帯からのアクセスかどうか
     * @return  int  $c_member_id メンバーID
     */
    function op_member_c_member_id4username($username, $is_ktai = false)
    {
        return db_member_c_member_id4username($username, $is_ktai);
    }

    /**
     * 暗号化されたログインIDからメンバーIDを取得する
     * 暗号化されたメールアドレスの場合は復号化する
     *
     * @param   string $username 暗号化されたログインID
     * @param   bool $is_ktai 携帯からのアクセスかどうか
     * @return  int  $c_member_id メンバーID
     */
    function op_member_c_member_id4username_encrypted($username, $is_ktai = false)
    {
        return db_member_c_member_id4username_encrypted($username, $is_ktai);
    }

    /**
     * ログインIDとパスワードから認証判定を行う(PCアクセス時)
     *
     * @param   string $address ログインID
     * @param   string $password パスワード
     * @return  int    $c_member_id メンバーID
     */
    function op_member_auth_login($address, $password)
    {
        if (!$address or !$password) {
            return false;
        }
        $c_member_id = OP::op_member_c_member_id4username($address, false);
        $sql = "SELECT hashed_password FROM c_member_secure ";
        $sql.= " WHERE c_member_id = ? ";
        if (md5($password) != db_get_one($sql, array($c_member_id))) {
            return false;
        }
        return $c_member_id;
    }

    /**
     * ログインIDとパスワードから認証判定を行う(携帯アクセス時)
     *
     * @param   string $address ログインID
     * @param   string $password パスワード
     * @return  int    $c_member_id メンバーID
     */
    function op_member_k_auth_login($address, $password)
    {
        return db_member_k_auth_login($address, $password);
    }

    /**
     * メンバーがアクティブメンバーかどうか判定する
     *
     * @param   int  $c_member_id メンバーID
     * @return  bool
     */
    function op_member_is_active_c_member_id($c_member_id)
    {
        return db_member_is_active_c_member_id($c_member_id);
    }

    /**
     * {c_member_id}が{target_...}にアクセスブロックされているかどうか判定する
     *
     * @param   int  $c_member_id メンバーID
     * @param   int  $target_c_member_id アクセスブロック対象のメンバーID
     * @return  bool
     */
    function op_member_is_access_block($c_member_id, $target_c_member_id)
    {
        return db_member_is_access_block($c_member_id, $target_c_member_id);
    }

    /**
     * メンバーがログイン停止かどうか判定する
     *
     * @param   int  $c_member_id メンバーID
     * @return  bool
     */
    function op_member_is_login_rejected($c_member_id)
    {
        return db_member_is_login_rejected($c_member_id);
    }

    /**
     * メンバーが忍び足(あしあとをつけない)状態かどうか判定する
     *
     * @param   int $c_member_id メンバーID
     * @return  bool
     */
    function op_member_is_shinobiashi($c_member_id)
    {
        return db_member_is_shinobiashi($c_member_id);
    }

    /**
     * メンバーの基本情報を取得する
     *
     * @param   int $c_member_id メンバーID
     * @return  array メンバー基本情報
     */
    function op_get_member_data_list($c_member_id)
    {
        $sql = 'SELECT';
        $sql.= ' c_member_id,';
        $sql.= ' nickname,';
        $sql.= ' birth_year,';
        $sql.= ' birth_month,';
        $sql.= ' birth_day,';
        $sql.= ' public_flag_birth_year';
        $sql.= ' FROM c_member';
        $sql.= ' WHERE c_member_id = ?';
        $params = array(intval($c_member_id));
        return db_get_row($sql, $params);
    }

    /**
     * メンバーのプロフィール情報を取得する
     *
     * @param   int $c_member_id メンバーID
     * @return  array メンバープロフィール情報
     */
    function op_get_member_profile_list($c_member_id)
    {
        $sql = 'SELECT';
        $sql.= ' cp.name,';
        $sql.= ' cp.caption,';
        $sql.= ' cp.form_type,';
        $sql.= ' cm.value,';
        $sql.= ' cm.public_flag';
        $sql.= ' FROM c_member_profile as cm, c_profile as cp';
        $sql.= ' WHERE cm.c_member_id = ?';
        $sql.= ' AND cm.c_profile_id = cp.c_profile_id';
        $sql.= ' ORDER BY cp.sort_order, cm.c_member_profile_id';
        $params = array(intval($c_member_id));
        return db_get_all($sql, $params);
    }





    ////////////////////////////////////////////////////////////////////////////////
    // lib/db/diary.php よりコピー・修正
    ////////////////////////////////////////////////////////////////////////////////

    /**
     * アクセスメンバーID・参照メンバーIDから日記を最新順で取得する
     *
     * @param   int $target_c_member_id 日記を登録したメンバーID
     * @param   int $access_c_member_id アクセスしたメンバーID
     * @param   int $count 取得する日記の件数
     * @return  array 日記情報
     */
    function op_diary_get_c_diary($target_c_member_id, $access_c_member_id = 0, $count = 10)
    {
        if ($target_c_member_id == $access_c_member_id) {
            $is_friend = true;
            $is_own = true;
        } else {
            $is_friend = OP::op_friend_is_friend($target_c_member_id, $access_c_member_id);
            $is_own = false;
        }

        $sql = "SELECT c_diary_id, subject, body, r_datetime";
        $sql.= " FROM c_diary";
        $sql.= " WHERE c_member_id = ?";
        $sql.= " AND (public_flag = 'public'";

        if ($is_friend) {
            $sql.= " OR public_flag = 'friend'";
        }

        if ($is_own) {
            $sql.= " OR public_flag = 'private')";
        } else {
            $sql.= ")";
        }

        $sql.= " ORDER BY r_datetime DESC";
        $params = array(intval($target_c_member_id));
        $arr = db_get_all_limit($sql, 0, $count, $params);
        return $arr;
    }

    /**
     * 日記IDからその日記を書いたメンバーIDを取得する
     *
     * @param   int $c_diary_id 日記ID
     * @return  int メンバーID
     */
    function op_diary_get_c_member_id4c_diary_id($c_diary_id)
    {
        $sql = "SELECT c_member_id";
        $sql.= " FROM c_diary";
        $sql.= " WHERE c_diary_id = ?";
        $params = array(intval($c_diary_id));
        return intval(db_get_one($sql, $params));
    }

    /**
     * 日記IDからその日記の公開範囲を取得する
     *
     * @param   int $c_diary_id 日記ID
     * @return  string  公開範囲
     */
    function op_diary_get_c_member_id4public_flg($c_diary_id)
    {
        $sql = "SELECT public_flag";
        $sql.= " FROM c_diary";
        $sql.= " WHERE  c_diary_id = ?";
        $params = array(intval($c_diary_id));
        return strval(db_get_one($sql, $params));
    }

    /**
     * 日記へコメントを追加する
     *
     * @param  int    $c_member_id メンバーID
     * @param  int    $c_diary_id 日記ID
     * @param  string $body コメント
     * @return int    コメントID
     */
    function op_diary_insert_c_diary_comment($c_member_id, $c_diary_id, $body)
    {
        return db_diary_insert_c_diary_comment($c_member_id, $c_diary_id, $body);
    }

    /**
     * 日記の未読フラグを書込む
     *
     * @param  int    $c_diary_id 日記ID
     * @return bool
     */
    function op_diary_c_diary_is_no_checked($c_diary_id)
    {
        $sql = "SELECT is_checked";
        $sql.= " FROM c_diary";
        $sql.= " WHERE c_diary_id = ?";
        $params = array(intval($c_diary_id));

        if (intval(db_get_one($sql, $params))) {
            $data  = array('is_checked' => 0);
            $where = array('c_diary_id' => intval($c_diary_id));
            return db_update('c_diary', $data, $where);
        }
        return true;
    }





    ////////////////////////////////////////////////////////////////////////////////
    // lib/db/friend.php よりコピー・修正
    ////////////////////////////////////////////////////////////////////////////////
    /**
     * 友達かどうか判定する
     *
     * @param  int $c_member_id1 メンバーID
     * @param  int $c_member_id2 メンバーID
     * @return bool
     */
    function op_friend_is_friend($c_member_id1, $c_member_id2)
    {
        return db_friend_is_friend($c_member_id1, $c_member_id2);
    }





    ////////////////////////////////////////////////////////////////////////////////
    // lib/db/action.php よりコピー・修正
    ////////////////////////////////////////////////////////////////////////////////
    /**
     * アクションIDからポイントを取得する
     *
     * @param  int $c_action_id アクションID
     * @return  int ポイントID
     */
    function op_action_get_point4c_action_id($c_action_id)
    {
        return db_action_get_point4c_action_id($c_action_id);
    }





    ////////////////////////////////////////////////////////////////////////////////
    // lib/db/point.php よりコピー・修正
    ////////////////////////////////////////////////////////////////////////////////
    /**
     * ポイントを加算する
     *
     * @param  int $c_member_id メンバーID
     * @param  int $point ポイント数
     * @return  int 加算後のポイント数
     */
    function op_point_add_point($c_member_id, $point)
    {
        return db_point_add_point($c_member_id, $point);
    }

    /**
     * メンバーIDからポイントを取得する
     *
     * @param  int $c_member_id メンバーID
     * @return  int ポイントID
     */
    function op_point_get_point($c_member_id)
    {
        return db_point_get_point($c_member_id);
    }

    /**
     * ポイントからランクを取得する
     *
     * @param  int $point ポイント数
     * @return  array ランク情報
     */
    function op_point_get_rank4point($point)
    {
        return db_point_get_rank4point($point);
    }





    /////////////////////////////////////////////////////////////////////////
    // lib/db/ashiato.php参考
    /////////////////////////////////////////////////////////////////////////

    /*新規*/
    /**
     * あしあとの存在するメンバか判定する
     * @param $c_member_id メンバーID
     * @return bool
     */
    function op_is_ahiato_member($c_member_id)
    {
        $sql = 'SELECT COUNT(*)';
        $sql.= '  FROM c_ashiato';
        $sql.= ' WHERE c_member_id_to = ?';
        $params = array(intval($c_member_id));
        if( intval(db_get_one($sql, $params)) == 0 ) {
            return false;
        } else {
            return true;
        }
    }

    /*新規*/
    /**
     * あしあとを付けたメンバの一覧をメンバプロフィールも含めて取得する
     * @param $c_member_id_to  あしあとを付けられたメンバーID
     *        $count           取得データの最大数
     *        $profile         プロフィール項目
     * @return 以下の形式の配列
     *         array ( array( prifile1 => value) [, array( profile2 => value), ...]) )
     */
    function op_ashiato_list_c_member_profile($c_member_id_to, $count, $profile)
    {

        //「あしあと」を登録したメンバーIDを「あしあと」登録日の新しいものの順に取得する
        $sql = 'SELECT DISTINCT r_date FROM c_ashiato WHERE c_member_id_to = ? ORDER BY r_date DESC';
        $params = array(intval($c_member_id_to));
        $days = db_get_col_limit($sql, 0, $count, $params);

        if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
            $sql = 'SELECT DISTINCT c_member_id_from, to_char(MAX(r_datetime),\'YYYY/MM/DD HH24:MI:SS\') AS r_datetime' .
               ' FROM c_ashiato WHERE r_date = ? AND c_member_id_to = ?' .
               ' GROUP BY c_member_id_from ORDER BY r_datetime DESC';
        } else {
            $sql = 'SELECT DISTINCT c_member_id_from, DATE_FORMAT(MAX(r_datetime),\'%Y/%m/%d %H:%i:%s\') AS r_datetime' .
               ' FROM c_ashiato WHERE r_date = ? AND c_member_id_to = ?' .
               ' GROUP BY c_member_id_from ORDER BY r_datetime DESC';
        }

        $member_list = array();
        foreach ($days as $day) {
            $params = array(strval($day), intval($c_member_id_to));
            $day_result = db_get_all_limit($sql, 0, intval($count), $params);
            $member_list = array_merge($member_list, $day_result);
            $count -= count($day_result);
            if ($count <= 0) {
                break;
            }
        }

        //プロフィールを取得
        $list = array();
        foreach ($member_list as $key => $value) {
            //メンバ情報の取得
            $c_member = OP::op_get_member_data_list($value['c_member_id_from']);

            //デフォルト項目（メンバId、ニックネーム、登録日）
            $list_mem = array(
                'mid' => $value['c_member_id_from'] ,
                'nickname'    => $c_member['nickname'],
                'datetime'    => $value['r_datetime'],
            );
            //メンバのプロフィールを取得する
            $prof_list = OP::op_get_member_profile_list($value['c_member_id_from']);

            //取得指定のプロフィールを設定する
            $prof_arry = split(',',$profile);
            foreach($prof_arry as $profile_name){
                $prof_key = strtolower(trim($profile_name));
                $prof_val = '';

                //プロフィール文字列と一致するプロフィールを探す
                $is_search = FALSE;
                foreach ($prof_list as $val) {
                    if ( $val['name'] == $prof_key ) {
                        $is_search = TRUE;
                        //プロフィールの公開区分をチェックする
                        if ( $val['public_flag'] == 'public' ) {
                            $prof_val = $val['value'];
                        }
                    }
                }
                //プロフィールテーブルに無い項目？
                if ( $is_search == FALSE ) {
                    if ( $prof_key == 'birthday') {
                        if ( $c_member['public_flag_birth_year'] == 'public' ) {
                            $prof_val = $c_member['birth_year'] .'/'. $c_member['birth_month'] .'/'. $c_member['birth_day'];
                        }
                    }
                }
                //項目を追加
                $list_mem = array_merge($list_mem, array($prof_key => $prof_val));
            }

            //返却値リストに追加
            array_push($list, $list_mem);

        }

        return $list;
    }

    /**
     * 総あしあと数を取得する
     *
     * @param  int $c_member_id 訪問されたメンバーID
     * @return int 総あしあと数
     */
    function op_ashiato_c_ashiato_num4c_member_id($c_member_id)
    {
        return db_ashiato_c_ashiato_num4c_member_id($c_member_id);
    }

    /**
     * あしあとが一定数に達した場合にメール送信を行う
     * その場合の一定数を取得する
     *
     * @param  int $c_member_id メンバーID
     * @return int 一定数
     */
    function op_ashiato_ashiato_mail_num4c_member_id($c_member_id)
    {
        return db_ashiato_ashiato_mail_num4c_member_id($c_member_id);
    }

    /**
     * あしあとを付ける
     *
     * @param  int $c_member_id_to あしあとをつけるメンバーのID
     * @param  int $c_member_id_from あしあとをつけられるメンバーのID
     * @return bool
     */
    function op_ashiato_insert_c_ashiato($c_member_id_to, $c_member_id_from)
    {
        $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to'   => intval($c_member_id_to),
        'r_datetime' => db_now(),
        'r_date' => db_now(),
        );
        if (!db_insert('c_ashiato', $data)) {
            return false;
        }

        if ($ashiato_mail_num = OP::op_ashiato_ashiato_mail_num4c_member_id($c_member_id_to)) {
            //総足あと数を取得
            $ashiato_num = OP::op_ashiato_c_ashiato_num4c_member_id($c_member_id_to);

            //あしあとお知らせメールを送る
            if ($ashiato_num == $ashiato_mail_num) {
                do_common_send_ashiato_mail($c_member_id_to, $c_member_id_from);
            }
        }

        return true;
    }

    /**
     * 一定時間内の連続アクセスかどうか判定する
     *
     * @param  int $c_member_id_to あしあとをつけるメンバーのID
     * @param  int $c_member_id_from あしあとをつけられるメンバーのID
     * @return bool
     */
    function op_ashiato_check_access_minute($c_member_id_to, $c_member_id_from)
    {
        $wait = date('Y-m-d H:i:s', strtotime('-5 minute'));
        $sql = 'SELECT c_ashiato_id FROM c_ashiato WHERE r_datetime > ?' .
            ' AND c_member_id_to = ? AND c_member_id_from = ?';
        $params = array($wait, intval($c_member_id_to), intval($c_member_id_from));

        if (db_get_one($sql, $params)) {
            return false;
        } else {
            return true;
        }
    }

}
?>
