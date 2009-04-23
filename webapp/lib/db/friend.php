<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * あるメンバーの友達数を取得
 *
 * @param int $c_member_id
 * @return int 友達数
 */
function db_friend_count_friends($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_friend WHERE c_member_id_from = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * 友達かどうか判定
 *
 * @param  int $c_member_id1
 * @param  int $c_member_id2
 * @return bool
 */
function db_friend_is_friend($c_member_id1, $c_member_id2)
{
    $sql = 'SELECT c_friend_id FROM c_friend' .
            ' WHERE c_member_id_from = ? AND c_member_id_to = ?';
    $params = array(intval($c_member_id1), intval($c_member_id2));
    return (bool)db_get_one($sql, $params);
}

/**
 * 友達のメンバーIDリスト取得
 *
 * @param  int $c_member_id
 * @param  bool $except_blocked アクセスブロックされているメンバーを除外するか
 * @return array  友達のメンバーID配列
 */
function db_friend_c_member_id_list($c_member_id, $except_blocked = false)
{
    $sql = 'SELECT c_member_id_to FROM c_friend WHERE c_member_id_from = ? ORDER BY c_friend_id';
    $params = array(intval($c_member_id));
    $friends = db_get_col($sql, $params);

    if ($except_blocked) {
        $blocked = db_member_access_block_list4c_member_id_to($c_member_id);
        $friends = array_diff($friends, $blocked);
    }
    return $friends;
}

/**
 * 紹介文を取得
 */
function db_friend_c_friend_intro($c_member_id_from, $c_member_id_to)
{
    $sql = 'SELECT intro FROM c_friend WHERE c_member_id_from = ? AND c_member_id_to = ?';
    $params = array(intval($c_member_id_from), intval($c_member_id_to));
    return db_get_one($sql, $params);
}

/**
 * メンバーと自分の中間のフレンドを得る
 */
function db_friend_friend_path4c_member_ids($my_id, $target_id)
{
    if (db_friend_is_friend($my_id, $target_id)) {
        return null;
    }

    //自分の友達リスト
    $my_list = db_friend_c_member_id_list($my_id);

    //相手の友達リスト
    $target_list = db_friend_c_member_id_list($target_id);

    //共通の友達リスト
    $result_list = array_intersect($my_list, $target_list);
    if (!$result_list) {
        return null;
    }

    $result_key = array_rand($result_list);
    $result_id  = $result_list[$result_key];

    return db_member_c_member4c_member_id($result_id);
}

/**
 * 自分のフレンドのうち、対象のメンバーと
 * フレンドリンクしていないフレンドのリストを取得
 */
function db_friend_invite_list4c_member_ids($target_c_member_id, $u)
{
    // 自分の友達リスト
    $my_list = db_friend_c_member_id_list($u);

    // ターゲットの友達リスト
    $target_list = db_friend_c_member_id_list($target_c_member_id);
    $target_list[] = $target_c_member_id;

    // 自分の友達リストからターゲットの友達を引く
    $result = array_diff($my_list, $target_list);

    $list = array();
    foreach ($result as $value) {
        $list[] = db_member_c_member4c_member_id_LIGHT($value);
    }
    return $list;
}

//---

function db_friend_friend_list4c_member_id2($c_member_id, $page_size, $page, $orderby)
{
    switch ($orderby) {
    case "ld":
        $orderby = "m.access_date DESC";
        break;
    case "la":
        $orderby = "m.access_date";
        break;
    case "rd":
        $orderby = "f.r_datetime DESC";
        break;
    case "ra":
        $orderby = "f.r_datetime";
        break;
    default:
        $orderby = "f.r_datetime DESC";
    }

    $sql = "SELECT" .
          " m.c_member_id, m.access_date, m.nickname, m.image_filename" .
          ", f.intro, f.r_datetime" .
        " FROM c_member AS m, c_friend AS f" .
        " WHERE f.c_member_id_from = ?" .
          " AND f.c_member_id_to = m.c_member_id" .
        " ORDER BY ". $orderby;
    $params = array(intval($c_member_id));
    $friend_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($friend_list as $key => $value) {
        $friend_list[$key]['friend_count'] = db_friend_count_friends($value['c_member_id']);
    }

    $total_num = db_friend_count_friends($c_member_id);
    $total_page_num =  ceil($total_num / $page_size);

    $next = ($page < $total_page_num);
    $prev = ($page > 1);

    return array($friend_list , $prev , $next, $total_page_num);
}

function db_friend_intro_list4c_member_id($c_member_id)
{
    $sql = "SELECT c_member_id_from AS c_member_id, intro FROM c_friend" .
            " WHERE c_member_id_to = ? AND intro <> ''" .
            " ORDER BY r_datetime_intro DESC";
    $params = array(intval($c_member_id));

    $list = db_get_all($sql, $params);
    foreach ($list as $key => $value) {
        $list[$key] += db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
    }
    return $list;
}

function db_friend_intro_list_with_my_intro4c_member_id($c_member_id)
{
    $list = db_friend_intro_list4c_member_id($c_member_id);

    $sql = 'SELECT intro FROM c_friend WHERE c_member_id_from = ? AND c_member_id_to = ?';
    foreach ($list as $key => $value) {
        $params = array(intval($c_member_id), intval($value['c_member_id']));
        $list[$key]['has_intro_by_me'] = (db_get_one($sql, $params) !== '');
    }
    return $list;
}

/**
 * フレンドからの紹介文リスト
 */
function db_friend_c_friend_comment4c_member_id($c_member_id, $limit = 5)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_LONG, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $sql = "SELECT c_member_id_from AS c_member_id, intro FROM c_friend" .
            " WHERE c_member_id_to = ? AND intro <> ''" .
            " ORDER BY r_datetime_intro DESC";
    $params = array(intval($c_member_id));

    $list = db_get_all_limit($sql, 0, $limit, $params);
    foreach ($list as $key => $value) {
        $list[$key] += db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
    }
    return $list;
}

/**
 * c_friend取得
 */
function db_friend_c_friend4c_member_id_from4c_member_id_to($c_member_id_from,$c_member_id_to)
{
    $sql =  "SELECT c_friend_id,".
                "c_member_id_from,".
                "c_member_id_to,".
                "intro,".
                "r_datetime".
            " FROM c_friend".
            " WHERE c_friend.c_member_id_from = ?" .
                " AND c_friend.c_member_id_to = ?" .
                " AND intro <> ''";
    $params = array(intval($c_member_id_from), intval($c_member_id_to));
    return db_get_row($sql, $params);
}

/**
 * フレンドリスト
 */
function db_friend_c_friend_list4c_member_id($c_member_id, $limit = 0)
{
    $result = db_friend_c_friend_id_list4c_member_id($c_member_id, $limit);

    foreach ($result as $key => $value) {
        $result[$key] = db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
        $result[$key]['friend_count'] = db_friend_count_friends($value['c_member_id']);
    }
    return $result;
}

/**
 * フレンドリスト用IDリストを取得する関数
 */
function db_friend_c_friend_id_list4c_member_id($c_member_id, $limit)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_LONG, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $sql = 'SELECT c_member_id_to AS c_member_id FROM c_friend' .
            ' WHERE c_member_id_from = ?' . db_order_by_rand();
    $params = array(intval($c_member_id));
    if ($limit) {
        $result = db_get_all_limit($sql, 0, $limit, $params);
    } else {
        $result = db_get_all($sql, $params);
    }

    return $result;
}

function db_friend_intro_body4c_member_id($u, $target_c_member_id)
{
    $sql = "SELECT intro FROM c_friend" .
            " WHERE c_member_id_to = ? AND c_member_id_from = ?";
    $params = array(intval($target_c_member_id), intval($u));
    return db_get_one($sql, $params);
}

/**
 * あなたにフレンドリンクを要請しているメンバー
 *
 * @param   int $c_member_id_to : 要請されている方(あなた)
 * @return  array_of_array
 *              c_friend_confirm.*
 *              nickname        : 要請している人の名前
 *              image_filename  : 要請している人の画像
 * @see     h_confirm_list.php
 */
function db_friend_anatani_c_friend_confirm_list4c_member_id($c_member_id_to)
{
    $sql = 'SELECT * FROM c_friend_confirm WHERE c_member_id_to = ?' .
            ' ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id_to));
    $c_friend_confirm_list = db_get_all($sql, $params);

    foreach ($c_friend_confirm_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        $c_friend_confirm_list[$key]['nickname'] = $c_member['nickname'];
        $c_friend_confirm_list[$key]['image_filename'] = $c_member['image_filename'];
    }
    return $c_friend_confirm_list;
}

/**
 * あなたがフレンドリンクを要請しているメンバー
 *
 * @param   int $c_member_id_from   : 要請している方(あなた)
 * @return  array_of_array
 *              c_friend_confirm.*
 *              nickname        : 要請されている人の名前
 *              image_filename  : 要請されている人の画像
 * @see     h_confirm_list.php
 */
function db_friend_anataga_c_friend_confirm_list4c_member_id($c_member_id_from)
{
    $sql = 'SELECT * FROM c_friend_confirm WHERE c_member_id_from = ?' .
            ' ORDER BY r_datetime DESC';
    $params = array(intval($c_member_id_from));
    $c_friend_confirm_list = db_get_all($sql, $params);

    foreach ($c_friend_confirm_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        $c_friend_confirm_list[$key]['nickname'] = $c_member['nickname'];
        $c_friend_confirm_list[$key]['image_filename'] = $c_member['image_filename'];
    }
    return $c_friend_confirm_list;
}

function db_friend_c_friend_intro_list4c_member_id($c_member_id, $limit)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_LONG, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $sql = 'SELECT * FROM c_friend' .
            ' WHERE c_member_id_to = ? AND intro <> \'\'' . db_order_by_rand();
    $params = array(intval($c_member_id));
    $list = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($list as $key => $value) {
        $list[$key] += db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
    }
    return $list;
}

function db_friend_c_friend_list_disp4c_member_id($c_member_id, $page = 1, $size = 20)
{
    $sql =  "SELECT c_member_id,".
                "image_filename,".
                "nickname,".
                "intro,".
                "c_member_id_from,".
                "c_member_id_to,".
                "is_display_friend_home".
            " FROM c_member,".
                "c_friend".
            " WHERE c_member.c_member_id = c_friend.c_member_id_to".
                " AND c_friend.c_member_id_from = ?".
            " ORDER BY c_friend.r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_friend_list = db_get_all_page($sql, $page, $size, $params);

    foreach ($c_friend_list as $key => $value) {
        $c_friend = db_friend_c_friend4c_member_id_from4c_member_id_to($value['c_member_id_from'], $value['c_member_id_to']);
        $c_friend_list[$key]['intro'] = $c_friend['intro'];

        $c_friend_list[$key]['friend_count'] = db_friend_count_friends($value['c_member_id_to']);
    }

    $total_num = db_friend_count_friends($c_member_id);
    $prev = 0;
    $next = 0;
    if ($total_num) {
        $total_page_num = ceil($total_num / $size);
        if ($page < $total_page_num) {
            $next = $page + 1;
        }

        if ($page > 1) {
            $prev = $page - 1;
        }
    }

    return array($c_friend_list, $prev, $next, $total_num);
}

function db_friend_status($u, $target_c_member_id)
{
    $ret = array(
        'c_member'      => db_member_c_member4c_member_id($target_c_member_id),
        'is_friend'     => false,
        'is_friend_confirm' => false,
    );

    $ret['is_friend'] = db_friend_is_friend($u, $target_c_member_id);
    $ret['is_friend_confirm'] = db_friend_is_friend_link_wait($u, $target_c_member_id);

    return $ret;
}

/**
 * 友達リンク要請情報をIDから取得
 *
 * @param   int $c_friend_confirm_id
 * @return  array c_friend_confirm.*
 */
function db_friend_c_friend_confirm4c_friend_confirm_id($c_friend_confirm_id)
{
    $sql = 'SELECT * FROM c_friend_confirm WHERE c_friend_confirm_id = ?';
    $params = array(intval($c_friend_confirm_id));
    return db_get_row($sql, $params);
}

function db_friend_is_friend_link_wait($c_member_id_from, $c_member_id_to)
{
    //from→to
    $sql = "SELECT count(*)";
    $sql .= " FROM  c_friend_confirm";
    $sql .= " WHERE c_member_id_from = ?";
    $sql .= " AND c_member_id_to = ?";
    $params = array(intval($c_member_id_from), intval($c_member_id_to));
    $countA = db_get_one($sql, $params);

    //to→from
    $sql = "SELECT count(*)";
    $sql .= " FROM  c_friend_confirm";
    $sql .= " WHERE c_member_id_from = ?";
    $sql .= " AND c_member_id_to = ?";
    $params = array(intval($c_member_id_to), intval($c_member_id_from));
    $countB = db_get_one($sql, $params);

    if ($countA || $countB) {
        return true;
    } else {
        return false;
    }
}

function db_friend_c_friend_list4c_member_id2($c_member_id)
{
    $sql = "SELECT c_member.* FROM c_friend, c_member" .
        " WHERE c_friend.c_member_id_from = ?".
        " AND c_member.c_member_id=c_friend.c_member_id_to".
        " ORDER BY c_friend.r_datetime DESC";
    $params = array(intval($c_member_id));
    return db_get_all($sql, $params);
}

/**
 * フレンドのランダムなリストを得る
 */
function db_friend_c_friend_list_random4c_member_id($c_member_id, $limit)
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ

    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_LONG, __FUNCTION__, $funcargs);
        $is_recurred = false;
        return $result;
    }

    $sql = "SELECT cf.* , cm.nickname";
    $sql .= " FROM c_friend AS cf, c_member AS cm";
    $sql .= " WHERE cf.c_member_id_from = ?" .
            " AND cm.c_member_id=cf.c_member_id_to";
    $sql .= db_order_by_rand();
    $params = array(intval($c_member_id));
    $c_friend_list = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($c_friend_list as $key => $value) {
        $c_friend_list[$key]['count_friend'] = db_friend_count_friends($value['c_member_id_to']);
    }

    return $c_friend_list;
}

/**
 * ２つのメンバーIDからその２人の関係を返す。
 */
function db_friend_relationship4two_members($c_member_id, $target_c_member_id)
{
    $relation = array(
        'friend' => false,
        'wait'   => false
    );

    // リンク承認待ちかどうかをチェック
    $sql = 'SELECT c_friend_confirm_id FROM c_friend_confirm' .
            ' WHERE c_member_id_from = ? AND c_member_id_to = ?';
    $params = array(intval($c_member_id), intval($target_c_member_id));

    if (db_get_one($sql, $params)) {
        $relation['wait'] = true;
        return $relation;
    }

    // 友達かどうかチェック
    $sql = 'SELECT c_friend_id FROM c_friend' .
            ' WHERE c_member_id_from = ? AND c_member_id_to = ?';

    if (db_get_one($sql, $params)) {
        $relation['friend'] = true;
        return $relation;
    }

    //他人
    return $relation;
}

function db_friend_friend_list4c_member_id($c_member_id,$page_size,$page)
{
    $sql = "SELECT ".
            "c_friend_id,".
            "c_member_id_from,".
            "c_member_id_to,".
            "r_datetime,".
            "is_display_friend_home".
        " FROM ".
            "c_friend".
        " WHERE c_member_id_from = ?".
        " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_friend_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_friend_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id($value['c_member_id_to']);

        $c_friend_list[$key]['image_filename'] = $c_member['image_filename'];
        $c_friend_list[$key]['c_member_id'] = $c_member['c_member_id'];
        $c_friend_list[$key]['nickname'] = $c_member['nickname'];
        $c_friend_list[$key]['access_date'] = $c_member['access_date'];

        $c_friend_list[$key]['friend_count'] = db_friend_count_friends($c_member['c_member_id']);
    }

    $total_num = db_friend_count_friends($c_member_id);

    if ($total_num != 0) {
        $total_page_num =  ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        } else {
            $next = true;
        }

        if ($page <= 1) {
            $prev = false;
        } else {
            $prev = true;
        }
    }
    return array($c_friend_list, $prev, $next, $total_num);
}

/**
 * あなたにフレンドリンクを要請しているメンバー数を取得(リンク承認待ち)
 *
 * @param int $c_member_id
 * @return int 要請しているメンバー数
 */
function db_friend_count_c_anatani_friend_confirm($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_friend_confirm WHERE c_member_id_to = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * あなたにフレンドリンクを要請しているメンバー(リンク承認待ち)
 *
 * @param   int $c_member_id_to : 要請されている方(あなた)
 * @return  array_of_array
 *              c_friend_confirm.*
 *              nickname        : 要請している人の名前
 *              message_disp    : 表示用メッセージ
 */
function db_friend_ktai_anatani_c_friend_confirm_list4c_member_id($c_member_id_to)
{
    $sql = "SELECT * FROM c_friend_confirm WHERE c_member_id_to = ?";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id_to));
    $c_friend_confirm_list = db_get_all($sql, $params);

    foreach ($c_friend_confirm_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        $c_friend_confirm_list[$key]['nickname'] = $c_member['nickname'];
    }
    return $c_friend_confirm_list;
}

function db_friend_ktai_anatani_c_friend_confirm_list4c_member_id_with_pager($c_member_id_to, $page_size, $page)
{
    $sql = "SELECT * FROM c_friend_confirm WHERE c_member_id_to = ?";
    $sql .= " ORDER BY r_datetime ASC";
    $params = array(intval($c_member_id_to));
    $c_friend_confirm_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_friend_confirm_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_from']);
        $c_friend_confirm_list[$key]['nickname'] = $c_member['nickname'];
    }

    $total_num = db_friend_count_c_anatani_friend_confirm($c_member_id_to);

    if ($total_num != 0) {
        $total_page_num = ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        } else {
            $next = true;
        }

        if ($page <= 1) {
            $prev = false;
        } else {
            $prev = true;
        }
    }
    return array($c_friend_confirm_list, $prev, $next, $total_num);
}

/**
 * あなたがフレンドリンクを要請しているメンバー数を取得(リンク承認待ち)
 *
 * @param int $c_member_id
 * @return int 要請しているメンバー数
 */
function db_friend_count_c_anataga_friend_confirm($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_friend_confirm WHERE c_member_id_from = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * あなたがフレンドリンクを要請しているメンバー(リンク要請中)
 *
 * @param   int $c_member_id_from   : 要請している方(あなた)
 * @return  array_of_array
 *              c_friend_confirm.*
 *              nickname        : 要請されている人の名前
 *              message_disp    : 表示用メッセージ
 */
function db_friend_ktai_anataga_c_friend_confirm_list4c_member_id($c_member_id_from)
{
    $sql = "SELECT * FROM c_friend_confirm WHERE c_member_id_from = ?";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id_from));
    $c_friend_confirm_list = db_get_all($sql, $params);

    foreach ($c_friend_confirm_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        $c_friend_confirm_list[$key]['nickname'] = $c_member['nickname'];
    }
    return $c_friend_confirm_list;
}

function db_friend_ktai_anataga_c_friend_confirm_list4c_member_id_with_pager($c_member_id_from, $page_size, $page)
{
    $sql = "SELECT * FROM c_friend_confirm WHERE c_member_id_from = ?";
    $sql .= " ORDER BY r_datetime ASC";
    $params = array(intval($c_member_id_from));
    $c_friend_confirm_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_friend_confirm_list as $key => $value) {
        $c_member = db_member_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        $c_friend_confirm_list[$key]['nickname'] = $c_member['nickname'];
    }

    $total_num = db_friend_count_c_anataga_friend_confirm($c_member_id_from);

    if ($total_num != 0) {
        $total_page_num = ceil($total_num / $page_size);
        if ($page >= $total_page_num) {
            $next = false;
        } else {
            $next = true;
        }

        if ($page <= 1) {
            $prev = false;
        } else {
            $prev = true;
        }
    }
    return array($c_friend_confirm_list, $prev, $next, $total_num);
}

/**
 * 友達ランダム５０人
 */
function db_friend_ktai_c_friend_list_random4c_member_id($c_member_id)
{
    $sql = "SELECT cf.c_member_id_to, cm.nickname";
    $sql .= " FROM c_friend AS cf, c_member AS cm";
    $sql .= " WHERE cf.c_member_id_from = ?".
            " AND cf.c_member_id_to = cm.c_member_id";
    $sql .= db_order_by_rand();
    $params = array(intval($c_member_id));
    return db_get_all_limit($sql, 0, 50, $params);
}

function db_friend_intro_list4c_friend_comment_list($c_friend_comment_list, $page, $page_size)
{
    $lst = array_slice($c_friend_comment_list, ($page - 1) * $page_size, $page_size);
    $total_num = count($c_friend_comment_list);

    if ($total_num === 0) {
        $prev = $next = false;
    } else {
        $total_page_num =  ceil($total_num / $page_size);
        $next = ($page < $total_page_num) ? true : false;
        $prev = ($page > 1) ? true : false;
    }
    return array($lst, $prev, $next, $total_num);
}

/*** write ***/

//--- c_friend

/**
 * フレンドリンクを追加
 */
function db_friend_insert_c_friend($c_member_id_from, $c_member_id_to)
{
    //function cache削除
    cache_drop_c_member($c_member_id_from);
    cache_drop_c_member($c_member_id_to);

    if (($c_member_id_from < 1) || ($c_member_id_to < 1))
        return false;

    if (db_friend_is_friend($c_member_id_from, $c_member_id_to))
        return false;

    $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to' => intval($c_member_id_to),
        'r_datetime' => db_now(),
        'intro' => '',
    );
    db_insert('c_friend', $data);

    $data = array(
        'c_member_id_from' => intval($c_member_id_to),
        'c_member_id_to' => intval($c_member_id_from),
        'r_datetime' => db_now(),
        'intro' => '',
    );
    db_insert('c_friend', $data);
}

/**
 * リンク申請からフレンドリンクを追加
 *
 * @param   int $c_friend_confirm_id
 * @param   int $u  自分のc_member_id
 */
function db_friend_insert_c_friend4confirm($c_friend_confirm_id, $u)
{
    $confirm = db_friend_c_friend_confirm4c_friend_confirm_id($c_friend_confirm_id);
    if ($confirm['c_member_id_to'] != $u) {
        return false;
    }
    $c_member_id_from = $confirm['c_member_id_from'];
    $c_member_id_to   = $confirm['c_member_id_to'];

    // フレンドリンクを追加
    db_friend_insert_c_friend($c_member_id_from, $c_member_id_to);

    // フレンド申請を削除
    db_friend_delete_c_friend_confirm($c_friend_confirm_id, $u);
    return true;
}

/**
 * フレンドリンクを削除
 */
function db_friend_delete_c_friend($c_member_id_from, $c_member_id_to)
{
    //function cache削除
    cache_drop_c_member($c_member_id_from);
    cache_drop_c_member($c_member_id_to);

    $sql = 'DELETE FROM c_friend' .
            ' WHERE (c_member_id_from = ? AND c_member_id_to = ?)' .
               ' OR (c_member_id_to = ? AND c_member_id_from = ?)';
    $params = array(
        intval($c_member_id_from), intval($c_member_id_to),
        intval($c_member_id_from), intval($c_member_id_to));
    db_query($sql, $params);
}

/**
 * フレンド紹介文入力・編集
 */
function db_friend_update_c_friend_intro($c_member_id_from, $c_member_id_to, $intro)
{
    //function cacheを削除
    cache_drop_c_friend_intro($c_member_id_to);

    $data = array(
        'intro' => $intro,
        'r_datetime_intro' => db_now(),
    );
    $where = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to' => intval($c_member_id_to),
    );
    db_update('c_friend', $data, $where);
}

//--- c_friend_confirm

/**
 * フレンド申請を追加
 *
 * @param  int    $c_member_id_from
 * @param  int    $c_member_id_to
 * @param  string $message
 * @return int insert_id
 */
function db_friend_insert_c_friend_confirm($c_member_id_from, $c_member_id_to, $message)
{
    $data = array(
        'c_member_id_from' => intval($c_member_id_from),
        'c_member_id_to'   => intval($c_member_id_to),
        'message'          => $message,
        'r_datetime'       => db_now(),
    );
    return db_insert('c_friend_confirm', $data);
}

/**
 * フレンド申請を削除
 *
 * @param  int  $c_friend_confirm_id
 * @param  int  $u 自分のc_member_id
 */
function db_friend_delete_c_friend_confirm($c_friend_confirm_id, $u)
{
    $sql = 'DELETE FROM c_friend_confirm WHERE c_friend_confirm_id = ?' .
            ' AND (c_member_id_from = ? OR c_member_id_to = ?)';
    $params = array(intval($c_friend_confirm_id), intval($u), intval($u));
    db_query($sql, $params);
}

/**
 * フレンド最新書き込みのホーム表示設定
 *
 * @param int $c_member_id_from (自分)
 * @param int $c_member_id_to   (対象となるマイフレンド)
 * @param int $is_display_friend_home (表示するか否か)
 */
function db_friend_update_is_display_friend_home($c_member_id_from, $c_member_id_to, $is_display_friend_home)
{
    pne_cache_drop('p_h_home_c_diary_friend_list4c_member_id', (int)$c_member_id_from, 5, true);
    pne_cache_drop('p_h_home_c_diary_friend_list4c_member_id', (string)$c_member_id_from, 5, true);
    $data = array(
        'is_display_friend_home' => (bool)$is_display_friend_home,
    );
    $where = array(
        'c_member_id_from'  => intval($c_member_id_from),
        'c_member_id_to'    => intval($c_member_id_to),
    );
    return db_update('c_friend', $data, $where);
}
/**
 * 友達のメンバーで、新着表示可否のIDリスト取得
 *
 * @param  int $c_member_id
 * @param  bool $is_display_friend_home = 1:新着表示対象 / 0:新着表示対象外
 * @return array  友達のメンバーID配列
 */
function db_friend_is_display_friend_home_list($c_member_id, $is_display_friend_home = 1)
{
    $sql  = 'SELECT c_member_id_to ';
    $sql .= 'FROM c_friend ';
    $sql .= 'WHERE c_member_id_from = ? ';
    $sql .= 'AND is_display_friend_home = ? ';
    $sql .= 'ORDER BY c_friend_id';
    $params = array(intval($c_member_id), intval($is_display_friend_home));
    $friends = db_get_col($sql, $params);

    return $friends;
}

?>
