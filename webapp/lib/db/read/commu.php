<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//// c_commu

/**
 * コミュニティ情報をIDから取得
 * 
 * @param  int $c_commu_id
 * @return array コミュニティ情報
 */
function _db_c_commu4c_commu_id($c_commu_id)
{
    $sql = 'SELECT * FROM c_commu WHERE c_commu_id = ?';
    $params = array(intval($c_commu_id));
    if (!$c_commu = db_get_row($sql, $params)) return array();

    $c_commu['c_commu_category'] =
        db_commu_get_c_commu_category4id($c_commu['c_commu_category_id']);
    $c_commu['c_member_admin'] =
        db_common_c_member4c_member_id($c_commu['c_member_id_admin']);

    return $c_commu;
}

/**
 * コミュニティ情報を得る
 */
function p_c_home_c_commu4c_commu_id($c_commu_id)
{
    if ($c_commu = _db_c_commu4c_commu_id($c_commu_id)) {
        $c_commu['member_count'] = _db_count_c_commu_member_list4c_commu_id($c_commu_id);
    }
    return $c_commu;
}

/**
 * コミュニティ情報をIDから返す
 */
function k_p_c_home_c_commu4c_commu_id($c_commu_id)
{
    if ($c_commu = _db_c_commu4c_commu_id($c_commu_id)) {
        $c_commu['count_member'] = _db_count_c_commu_member_list4c_commu_id($c_commu_id);
    }
    return $c_commu;
}

function p_c_com_add_is_commu4c_commu_name($c_commu_name)
{
    $sql = 'SELECT c_commu_id FROM c_commu WHERE name = ?';
    $params = array($c_commu_name);
    return (bool)db_get_one($sql, $params);
}

/**
 * 登録時に強制参加させるコミュニティIDのリスト
 */
function db_commu_regist_join_list()
{
    $sql = 'SELECT c_commu_id FROM c_commu WHERE is_regist_join = 1';
    return db_get_col($sql);
}

//// c_commu_member

/**
 * コミュニティの参加メンバー数を取得
 * 
 * @param   int $c_commu_id
 * @return  int 参加メンバー数
 */
function _db_count_c_commu_member_list4c_commu_id($c_commu_id)
{
    $sql = 'SELECT COUNT(*) FROM c_commu_member WHERE c_commu_id = ?';
    $params = array(intval($c_commu_id));
    return db_get_one($sql, $params);
}

/**
 * メンバーの参加コミュニティ数を取得
 * 
 * @param int $c_member_id
 * @return int 参加コミュニティ数
 */
function p_common_count_c_commu4c_member_id($c_member_id)
{
    $sql = 'SELECT COUNT(*) FROM c_commu_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    return db_get_one($sql, $params);
}

//// c_commu_topic

//// c_commu_topic_comment

/**
 * max
 */
function db_commu_get_max_number4topic($c_commu_topic_id)
{
    $sql = 'SELECT MAX(number) FROM c_commu_topic_comment WHERE c_commu_topic_id = ?';
    $params = array(intval($c_commu_topic_id));
    return db_get_one($sql, $params);
}

/**
 * 次の書き込み番号取得
 * 
 * @param  int $c_commu_topic_id
 * @return int 次の書き込み番号
 */
function _do_c_commu_topic_comment_number4c_commu_topic_id($c_commu_topic_id)
{
    return db_commu_get_max_number4topic($c_commu_topic_id) + 1;
}

//// 判定

/** 
 * コミュニティのメンバーかどうか判定
 * 
 * @param  int c_commu_id
 * @param  int c_member_id
 * @return bool
 */
function _db_is_c_commu_member($c_commu_id, $c_member_id)
{
    $sql = 'SELECT c_commu_member_id FROM c_commu_member' .
            ' WHERE c_commu_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_id), intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

/**
 * コミュニティの管理者かどうかを判定
 * 
 * @param  int $c_commu_id
 * @param  int $c_member_id
 * @return bool
 */
function _db_is_c_commu_admin($c_commu_id, $c_member_id)
{
    $sql = 'SELECT c_commu_id FROM c_commu' .
            ' WHERE c_commu_id = ? AND c_member_id_admin = ?';
    $params = array(intval($c_commu_id), intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

function _db_is_c_topic_admin($c_commu_topic_id, $c_member_id)
{
    $sql = 'SELECT c_commu_topic_id FROM c_commu_topic' .
            ' WHERE c_commu_topic_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_topic_id), intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

/**
 * コミュニティ参加承認待ち状態かどうか
 */
function do_common_is_c_commu_join_wait($c_commu_id, $c_member_id)
{
    $sql = 'SELECT c_commu_member_confirm_id FROM c_commu_member_confirm' .
            ' WHERE c_commu_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_id), intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

function p_common_is_c_commu_view4c_commu_idAc_member_id($c_commu_id,$c_member_id)
{
    $ret = false;
    $c_commu = _db_c_commu4c_commu_id($c_commu_id);

    $is_c_commu_member = _db_is_c_commu_member($c_commu_id, $c_member_id);

    switch($c_commu['public_flag']) {
    case "public":
        $ret = true;
        break;
    case "auth_public":
        $ret = true;
        break;
    case "auth_sns":
        $ret = true;
        break;
    case "auth_commu_member":
        if ($is_c_commu_member) {
            $ret = true;
        } else {
            $ret = false;
        }
        break;
    }
    return $ret;
}

////

/**
 * コミュニティメール(ktai)受信設定を取得
 */
function db_commu_is_receive_mail_ktai($c_commu_id, $c_member_id)
{
    $sql = 'SELECT is_receive_mail FROM c_commu_member' .
            ' WHERE c_commu_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_id), intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * コミュニティメール(PC)受信設定を取得
 */
function db_commu_is_receive_mail_pc($c_commu_id, $c_member_id)
{
    $sql = 'SELECT is_receive_mail_pc FROM c_commu_member' .
            ' WHERE c_commu_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_id), intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * コミュニティメッセージ受信設定を取得
 */
function db_commu_is_receive_message($c_commu_id, $c_member_id)
{
    $sql = 'SELECT is_receive_message FROM c_commu_member' .
            ' WHERE c_commu_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_id), intval($c_member_id));
    return db_get_one($sql, $params);
}

/**
 * コミュニティメールの受信アドレスリスト(携帯)
 */
function db_common_receive_ktai_address_list4c_commu_id($c_commu_id)
{
    $sql = 'SELECT c_member_id FROM c_commu_member' .
            ' WHERE c_commu_id = ? AND is_receive_mail = 1';
    $params = array(intval($c_commu_id));
    $list = db_get_col($sql, $params);

    $ktai_list = array();
    foreach ($list as $c_member_id) {
        $sec = db_common_c_member_secure4c_member_id($c_member_id);
        if ($sec['ktai_address']) {
            $ktai_list[$c_member_id] = $sec['ktai_address'];
        }
    }
    return $ktai_list;
}

/**
 * コミュニティメールの受信アドレスリスト(PC)
 */
function db_common_receive_pc_address_list4c_commu_id($c_commu_id)
{
    $sql = "SELECT m.pc_address" .
            " FROM c_member_secure AS m, c_commu_member AS cm" .
            " WHERE cm.c_commu_id = ?".
            " AND cm.is_receive_mail_pc = 1" .
            " AND cm.c_member_id = m.c_member_id" .
            " AND m.pc_address <> ''";
    $params = array(intval($c_commu_id));
    $c_member_list = db_get_col($sql, $params);

    return array_map('t_decrypt', $c_member_list);
}

////

/**
 * 管理者交代の要請情報をIDから取得
 * 
 * @param  int $c_commu_admin_confirm_id
 * @return array
 *              c_commu_admin_confirm,
 *              c_member_id_admin       : 管理者のメンバーID
 */
function _db_c_commu_admin_confirm4c_commu_admin_confirm_id($c_commu_admin_confirm_id)
{
    $sql = "SELECT cac.*, c.c_member_id_admin FROM c_commu_admin_confirm AS cac, c_commu AS c";
    $sql .= " WHERE cac.c_commu_admin_confirm_id = ?";
    $sql .= " AND cac.c_commu_id=c.c_commu_id";
    $params = array(intval($c_commu_admin_confirm_id));
    return db_get_row($sql, $params);
}

// 参加コミュニティリスト
function p_fh_com_list_c_commu_list4c_member_id($c_member_id, $page, $page_size)
{
    $sql = "SELECT c_commu.*" .
            " FROM c_commu_member , c_commu";
    $sql .= " WHERE c_commu_member.c_member_id=?";
    $sql .= " AND c_commu.c_commu_id=c_commu_member.c_commu_id";
    $sql .= " ORDER BY c_commu.c_commu_id DESC ";
    $params = array(intval($c_member_id));
    $c_commu_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_commu_list as $key => $value) {
        $c_commu_list[$key]['count_members'] =
            _db_count_c_commu_member_list4c_commu_id($value['c_commu_id']);
    }

    $pager = array(
        "total_num" => p_common_count_c_commu4c_member_id($c_member_id),
        "disp_num"  => count($c_commu_list),
        "start_num" => 0,
        "end_num"   => 0,
        "total_page" => 0,
        "prev_page" => 0,
        "next_page" => 0,
    );

    if ($pager['disp_num'] > 0) {
        $pager['start_num'] = ($page - 1) * $page_size + 1;
        $pager['end_num'] = $pager['start_num'] + $pager['disp_num'] - 1;
    }

    if ($pager['total_num']) {
        $pager['total_page'] = ceil($pager['total_num'] / $page_size);

        if ($page < $pager['total_page']) {
            $pager['next_page'] = max($page + 1, 1);
        }
        if ($page > 1) {
            $pager['prev_page'] = min($page - 1, $pager['total_page']);
        }
    }

    return array($c_commu_list, $pager);
}

/**
 * コミュニティトピックからコミュニティIDを取得
 */
function p_c_bbs_c_commu_id4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT c_commu_id FROM c_commu_topic WHERE c_commu_topic_id = ?";
    $params = array(intval($c_commu_topic_id));
    return db_get_one($sql, $params);
}

// $c_commu_id の community に参加しているメンバを返す
function p_c_edit_member_c_member_list4c_commu_id($c_commu_id, $page_size, $page)
{
    $c_commu = _db_c_commu4c_commu_id($c_commu_id);

    $sql =  "SELECT c_member.c_member_id,".
                "nickname,".
                "image_filename ," .
                "c_commu_member.r_datetime".
            " FROM c_member,".
                "c_commu_member".
            " WHERE c_commu_id = ?".
            " AND c_commu_member.c_member_id = c_member.c_member_id".
            " ORDER BY c_commu_member.r_datetime DESC";
    $params = array(intval($c_commu_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    $new_list = array();
    foreach ($list as $key => $value) {
        $new_list[] = $value;
    }
    $list = $new_list;

    $sql = 'SELECT * FROM c_commu_admin_confirm WHERE c_commu_id = ?';
    $params = array(intval($c_commu_id));
    $c_commu_admin_confirm = db_get_row($sql, $params);

    if ($c_commu_admin_confirm) {
        foreach ($list as $key => $c_member) {
            if ($list[$key]['c_member_id'] == $c_commu_admin_confirm['c_member_id_to']) {
                $list[$key]['c_commu_admin_confirm_id'] = $c_commu_admin_confirm['c_commu_admin_confirm_id'];
            } else {
                $list[$key]['c_commu_admin_confirm_id'] = 0;
            }
        }
    } else {
        foreach ($list as $key => $c_member) {
            $list[$key]['c_commu_admin_confirm_id'] = -1;
        }
    }

    foreach ($list as $key => $c_member) {
        $list[$key]['is_c_commu_admin'] = _db_is_c_commu_admin($c_commu_id, $list[$key]['c_member_id']);
    }

    $total_num = _db_count_c_commu_member_list4c_commu_id($c_commu_id);
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

    return array($list, $prev, $next);
}

/**
 * コミュニティメンバーのリストを得る
 */
function p_c_home_c_commu_member_list4c_commu_id($c_commu_id ,$limit = 9)
{
    $sql = 'SELECT c_member.* FROM c_member, c_commu_member' .
            ' WHERE c_member.c_member_id = c_commu_member.c_member_id' .
            ' AND c_commu_id = ? ORDER BY RAND()';
    $params = array(intval($c_commu_id));
    $lst = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($lst as $key => $value) {
        $lst[$key]['friend_count'] = db_friend_count_friends($value['c_member_id']);
    }
    return $lst;
}

function p_c_home_new_topic_comment4c_commu_id($c_commu_id, $limit, $event_flag = 0)
{
    $sql = "SELECT cct.c_commu_topic_id , cct.name, MAX(cctc.r_datetime) as r_datetime , cct.c_commu_id " .
            " , cctc.image_filename1, cctc.image_filename2, cctc.image_filename3 " .
            " FROM c_commu_topic_comment as cctc , c_commu_topic as cct" .
            " WHERE cctc.c_commu_topic_id = cct.c_commu_topic_id " .
            " AND cct.event_flag = ?".
            " AND cct.c_commu_id = ?".
            " group by cct.c_commu_topic_id " .
            " order by r_datetime desc ";
    $params = array((bool)$event_flag, intval($c_commu_id));
    $list = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($list as $key => $value) {
        $list[$key]['count_comments'] = db_commu_get_max_number4topic($value['c_commu_topic_id']);
    }
    return $list;
}

/**
 * コミュニティに招待するMyフレンドのリストを得る
 * コミュニティに参加していないMyフレンドを全員表示
 * 
 * @param   int $c_member_id
 * @param   int $c_commu_id
 */
function p_c_invite_invite_list4c_member_id4c_commu_id($c_member_id, $c_commu_id)
{
    //友達リスト
    $friend_list = db_friend_c_member_id_list($c_member_id);

    //参加者リスト
    $sql = 'SELECT c_member_id FROM c_commu_member WHERE c_commu_id = ?';
    $params = array(intval($c_commu_id));
    $member_list = db_get_col($sql, $params);

    //友達リストから参加者リストを引く
    $result = array_diff($friend_list, $member_list);

    if (empty($result)) {
        return null;
    } else {
        $result = implode(",", $result);

        $sql = 'SELECT c_member_id, nickname '
            . ' FROM c_member'
            . ' WHERE c_member_id'
            . ' IN ( '. $result. ') ';

        return db_get_all($sql);
    }
}

function p_c_member_list_c_members4c_commu_id($c_commu_id, $page_size, $page)
{
    $sql = 'SELECT c_member_id FROM c_commu_member WHERE c_commu_id = ? ORDER BY r_datetime DESC';
    $params = array(intval($c_commu_id));
    $id_list = db_get_all_page($sql, $page, $page_size, $params);

    $list = array();
    foreach ($id_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_member['friend_count'] = db_friend_count_friends($value['c_member_id']);
        $list[] = $c_member;
    }

    $sql = 'SELECT COUNT(*) FROM c_commu_member WHERE c_commu_id = ?';
    $total_num = db_get_one($sql, $params);

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

    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num   = ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($list , $prev , $next, $total_num, $start_num, $end_num);
}

function p_f_home_c_commu_list4c_member_id($c_member_id, $limit = 9)
{
    $sql = "SELECT c_commu.c_commu_id, c_commu.image_filename, c_commu.name" .
        " FROM c_commu ,c_commu_member " .
        " WHERE c_commu_member.c_member_id = ?".
        " AND c_commu.c_commu_id =  c_commu_member.c_commu_id" .
        " ORDER BY RAND()";
    $params = array(intval($c_member_id));
    $lst = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($lst as $key => $value) {
        $lst[$key]['count_commu_member'] = _db_count_c_commu_member_list4c_commu_id($value['c_commu_id']);
    }
    return $lst;
}

/**
 * あなたに(の)管理コミュニティに参加を希望しているメンバー
 * 
 * @param   int $c_member_id    : 要請されている方(あなた＝管理者)
 * @return  array_of_array
 *              c_commu_member_confirm.*
 *              c_commu_name    : コミュニティの名前
 *              nickname        : 要請している人の名前
 *              image_filename  : 要請している人の画像
 * @see     h_confirm_list.php
 */
function p_h_confirm_list_anatani_c_commu_member_confirm_list4c_member_id($c_member_id)
{
    $sql = "SELECT cmc.*, c.name AS c_commu_name";
    $sql .= " FROM c_commu_member_confirm AS cmc, c_commu AS c";
    $sql .= " WHERE c.c_member_id_admin = ? AND cmc.c_commu_id=c.c_commu_id";
    $params = array(intval($c_member_id));
    $c_commu_member_confirm_list = db_get_all($sql, $params);

    foreach ($c_commu_member_confirm_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_commu_member_confirm_list[$key]['nickname'] = $c_member['nickname'];
        $c_commu_member_confirm_list[$key]['image_filename'] = $c_member['image_filename'];
    }
    return $c_commu_member_confirm_list;
}
/**
 * あなたがコミュニティ参加要請しているコミュニティ
 * 
 * @param   int $c_member_id    : 要請している方(あなた)
 * @return  array_of_array
 *              c_commu_member_confirm.*,
 *              c_commu_name        : コミュニティの名前
 *              c_member_id_admin   : 管理者のメンバーID
 *              nickname            : 管理者の名前
 *              image_filename      : 管理者の画像
 * @see     h_confirm_list.php
 */
function p_h_confirm_list_anataga_c_commu_member_confirm_list4c_member_id($c_member_id)
{
    $sql = "SELECT cmc.*, c.name AS c_commu_name, c.c_member_id_admin";
    $sql .= " FROM c_commu_member_confirm AS cmc, c_commu AS c";
    $sql .= " WHERE cmc.c_member_id = ? AND cmc.c_commu_id=c.c_commu_id";
    $params = array(intval($c_member_id));
    $c_commu_member_confirm_list = db_get_all($sql, $params);

    foreach ($c_commu_member_confirm_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_admin']);
        $c_commu_member_confirm_list[$key]['nickname'] = $c_member['nickname'];
        $c_commu_member_confirm_list[$key]['image_filename'] = $c_member['image_filename'];
    }
    return $c_commu_member_confirm_list;
}

/**
 * あなたにコミュニティ管理者交代を希望しているメンバー
 * 
 * @param   int $c_member_id_to : 要請されている方(あなた)
 * @return  array_of_array
 *              c_commu_admin_confirm.*
 *              c_commu_name        : コミュニティ名
 *              c_member_id_admin   : 要請している人(＝現管理者)のID
 *              nickname            : 要請している人の名前
 *              image_filename      : 要請している人の画像
 * @see     h_confirm_list.php
 */
function p_h_confirm_list_anatani_c_commu_admin_confirm_list4c_member_id($c_member_id_to)
{
    $sql = "SELECT cac.*, c.name AS c_commu_name, c.c_member_id_admin";
    $sql .= " FROM c_commu_admin_confirm AS cac, c_commu AS c";
    $sql .= " WHERE cac.c_member_id_to = ? AND cac.c_commu_id=c.c_commu_id";
    $params = array(intval($c_member_id_to));
    $c_commu_admin_confirm_list = db_get_all($sql, $params);

    foreach ($c_commu_admin_confirm_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_admin']);
        $c_commu_admin_confirm_list[$key]['nickname'] = $c_member['nickname'];
        $c_commu_admin_confirm_list[$key]['image_filename'] = $c_member['image_filename'];
    }
    return $c_commu_admin_confirm_list;
}

/**
 * あなたがコミュニティ管理者交代を要請しているメンバー
 * 
 * @param   int $c_member_id_admin  : 要請している方(あなた)
 * @return  array_of_array
 *              c_commu_admin_confirm.*
 *              nickname            : 要請されている人の名前
 *              image_filename      : 要請されている人の画像
 * @see     h_confirm_list.php
 */
function p_h_confirm_list_anataga_c_commu_admin_confirm_list4c_member_id($c_member_id_admin)
{
    $sql = "SELECT cac.*, c.name AS c_commu_name, c.c_member_id_admin";
    $sql .= " FROM c_commu_admin_confirm AS cac, c_commu AS c";
    $sql .= " WHERE c.c_member_id_admin = ? AND cac.c_commu_id=c.c_commu_id";
    $params = array(intval($c_member_id_admin));
    $c_commu_admin_confirm_list = db_get_all($sql, $params);

    foreach ($c_commu_admin_confirm_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_to']);
        $c_commu_admin_confirm_list[$key]['nickname'] = $c_member['nickname'];
        $c_commu_admin_confirm_list[$key]['image_filename'] = $c_member['image_filename'];
    }
    return $c_commu_admin_confirm_list;
}

/**
 * 参加コミュニティ新着書き込みリスト取得
 */
function p_h_home_c_commu_topic_comment_list4c_member_id($c_member_id, $limit)
{
    $sql = "SELECT cc.c_commu_topic_id, c.name AS c_commu_name, ct.name AS c_commu_topic_name , cm.c_member_id, cc.number, max(cc.r_datetime) as r_datetime";
    $sql .= " FROM c_commu_member AS cm, c_commu_topic_comment AS cc";
    $sql .= ", c_commu AS c, c_commu_topic AS ct";
    $sql .= " WHERE cm.c_member_id = ?";
    $sql .= " AND cc.c_commu_id=cm.c_commu_id";
    $sql .= " AND c.c_commu_id=cm.c_commu_id";
    $sql .= " AND ct.c_commu_id=cm.c_commu_id";
    $sql .= " AND ct.c_commu_topic_id=cc.c_commu_topic_id";
    $sql .= " GROUP BY c_commu_topic_id, c_commu_name, c_commu_topic_name ,c_member_id ";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_commu_topic_list = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($c_commu_topic_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_commu_topic_list[$key]['nickname'] = $c_member['nickname'];

        $sql = 'SELECT number, image_filename1, image_filename2, image_filename3' .
               ' FROM c_commu_topic_comment' .
               ' WHERE c_commu_topic_id = ? AND r_datetime = ?';
        $params = array(intval($value['c_commu_topic_id']), $value['r_datetime']);
        $temp = db_get_row($sql, $params);

        //最新の書き込み番号
        $number = db_commu_get_max_number4topic($value['c_commu_topic_id']);

        $c_commu_topic_list[$key]['number'] = $number;
        $c_commu_topic_list[$key]['image_filename1'] = $temp['image_filename1'];
        $c_commu_topic_list[$key]['image_filename2'] = $temp['image_filename2'];
        $c_commu_topic_list[$key]['image_filename3'] = $temp['image_filename3'];
    }

    return $c_commu_topic_list;
}

function p_h_com_comment_list_c_commu_topic_comment_list4c_member_id($c_member_id, $limit,$page)
{
    $sql = "SELECT cc.c_commu_topic_id, c.name AS c_commu_name, ct.name AS c_commu_topic_name , cm.c_member_id, cc.number, max(cc.r_datetime) as r_datetime";
    $sql .= " FROM c_commu_member AS cm, c_commu_topic_comment AS cc";
    $sql .= ", c_commu AS c, c_commu_topic AS ct";
    $sql .= " WHERE cm.c_member_id = ?";
    $sql .= " AND cc.c_commu_id=cm.c_commu_id";
    $sql .= " AND c.c_commu_id=cm.c_commu_id";
    $sql .= " AND ct.c_commu_id=cm.c_commu_id";
    $sql .= " AND ct.c_commu_topic_id=cc.c_commu_topic_id";
    $sql .= " group by c_commu_topic_id, c_commu_name, c_commu_topic_name ,c_member_id ";
    $sql .= " ORDER BY r_datetime DESC";
    $params = array(intval($c_member_id));
    $c_commu_topic_list = db_get_all_limit($sql, ($page-1)*$limit, $limit, $params);

    foreach ($c_commu_topic_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_commu_topic_list[$key]['nickname'] = $c_member['nickname'];

        $sql = 'SELECT number, image_filename1, image_filename2, image_filename3' .
               ' FROM c_commu_topic_comment ' .
               ' WHERE c_commu_topic_id = ? AND r_datetime = ?';
        $params = array(intval($value['c_commu_topic_id']), $value['r_datetime']);
        $temp = db_get_row($sql, $params);

        //最新の書き込み番号
        $number = db_commu_get_max_number4topic($value['c_commu_topic_id']);

        $c_commu_topic_list[$key]['number'] = $number;
        $c_commu_topic_list[$key]['image_filename1'] = $temp['image_filename1'];
        $c_commu_topic_list[$key]['image_filename2'] = $temp['image_filename2'];
        $c_commu_topic_list[$key]['image_filename3'] = $temp['image_filename3'];
    }

    $sql = "SELECT count(DISTINCT ct.c_commu_topic_id)";
    $sql .= " FROM c_commu_member AS cm, c_commu_topic_comment AS cc";
    $sql .= ", c_commu AS c, c_commu_topic AS ct";
    $sql .= " WHERE cm.c_member_id = ?";
    $sql .= " AND cc.c_commu_id=cm.c_commu_id";
    $sql .= " AND c.c_commu_id=cm.c_commu_id";
    $sql .= " AND ct.c_commu_id=cm.c_commu_id";
    $sql .= " AND ct.c_commu_topic_id=cc.c_commu_topic_id";
    $params = array(intval($c_member_id));
    $total_num = db_get_one($sql, $params);
    if ($total_num != 0) {
        $total_page_num =  ceil($total_num / $limit);
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
    return array($c_commu_topic_list , $prev , $next,$total_num);
}

/** 
 * 参加コミュニティのリスト
 * 
 * @param int $c_member_id
 * @param int $limit
 * @return  array コミュニティ情報
 */
function p_h_home_c_commu_list4c_member_id($c_member_id, $limit)
{
    $sql = "SELECT c.* FROM c_commu_member AS cm, c_commu AS c";
    $sql .= " WHERE cm.c_member_id=?";
    $sql .= " AND c.c_commu_id=cm.c_commu_id";
    $sql .= " ORDER BY RAND()";
    $params = array(intval($c_member_id));
    $c_commu_list = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($c_commu_list as $key => $value) {
        $c_commu_list[$key]['count_commu_members'] =
            _db_count_c_commu_member_list4c_commu_id($value['c_commu_id']);
    }
    return $c_commu_list;
}

function p_c_topic_list_c_topic_list4target_c_commu_id($c_commu_id, $c_member_id, $page = 1, $page_size = 10, $event_flag = 0, $topic_with_event = 0)
{
    $sql = " SELECT cct.c_commu_topic_id, max(cctc.r_datetime) as newest_write_datetime " .
            " FROM c_commu_topic as cct, c_commu_topic_comment as cctc " .
            " WHERE cct.c_commu_topic_id = cctc.c_commu_topic_id ";

    if ($topic_with_event) {
        $sql .= " AND cct.event_flag = $event_flag";
    }

    $sql .= " AND cct.c_commu_id = ?" .
            " GROUP BY c_commu_topic_id " .
            " ORDER BY newest_write_datetime DESC";
    $params = array(intval($c_commu_id));
    $lst = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($lst as $key => $value) {
        $sql = "SELECT cct.c_commu_topic_id, cct.name, cct.r_datetime, cctc.body , cctc.image_filename1, cctc.image_filename2, image_filename3" .
               " FROM c_commu_topic as cct, c_commu_topic_comment as cctc" .
               " WHERE cct.c_commu_topic_id = cctc.c_commu_topic_id" .
               " AND cctc.number = 0" .
               " AND cct.c_commu_topic_id = ?";
        $params = array(intval($value['c_commu_topic_id']));
        $lst[$key] = db_get_row($sql, $params);
    }

    foreach ($lst as $key => $value) {
        $lst[$key]['is_c_event_member'] = _db_is_c_event_member($value['c_commu_topic_id'], $c_member_id);
        $lst[$key]['is_c_topic_admin'] = _db_is_c_topic_admin($value['c_commu_topic_id'], $c_member_id);
        $lst[$key]['write_num'] = db_commu_get_max_number4topic($value['c_commu_topic_id']);
    }

    $sql = 'SELECT COUNT(*) FROM c_commu_topic WHERE c_commu_id = ?';
    if ($topic_with_event) {
        $sql .= " AND event_flag = $event_flag";
    }
    $params = array(intval($c_commu_id));
    $total_num = db_get_one($sql, $params);

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
    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num   = ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($lst, $prev, $next, $total_num, $start_num, $end_num);
}

function c_topic_detail_c_topic4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT ct.*, ctc.*, c_member.nickname" .
        " FROM c_commu_topic AS ct" .
            " LEFT JOIN c_member USING (c_member_id)" .
            ", c_commu_topic_comment AS ctc" .
        " WHERE ct.c_commu_topic_id = ctc.c_commu_topic_id " .
            " AND ct.c_commu_topic_id = ?".
            " AND ctc.number = 0";
    $params = array(intval($c_commu_topic_id));
    return db_get_row($sql, $params);
}

function p_c_edit_is_topic4c_commu_id($c_commu_id)
{
    $sql = 'SELECT c_commu_topic_id FROM c_commu_topic WHERE c_commu_id = ?';
    $params = array(intval($c_commu_id));
    return db_get_one($sql, $params);
}

/**
 * IDからコミュニティトピックコメントの情報を取得
 * 
 * @param int $c_commu_topic_comment_id
 * @return array
 */
function _db_common_c_commu_topic_comment4c_commu_topic_comment_id($c_commu_topic_comment_id)
{
    $sql = "SELECT ctc.*, ct.name AS topic_name, c.name AS commu_name" .
        " FROM c_commu_topic_comment AS ctc, c_commu_topic AS ct, c_commu AS c" .
        " WHERE ctc.c_commu_topic_comment_id=?" .
        " AND ct.c_commu_topic_id=ctc.c_commu_topic_id" .
        " AND c.c_commu_id=ctc.c_commu_id";
    $params = array(intval($c_commu_topic_comment_id));
    return db_get_row($sql, $params);
}

function db_common_commu_status($u, $target_c_commu_id)
{
    $ret = array(
        'c_commu' => _db_c_commu4c_commu_id($target_c_commu_id),
        'is_bbs_view'     => false,
        'is_commu_member' => false,
        'is_commu_admin'  => false,
        'is_receive_mail'    => false,
        'is_commu_member_confirm' => false,
    );

    if (_db_is_c_commu_member($target_c_commu_id, $u)) {
        $ret['is_commu_member'] = true;

        $c_commu_member = _db_c_commu_member4c_member_id($u, $target_c_commu_id);
        if ($c_commu_member['is_receive_mail']) {
            $ret['is_receive_mail'] = true;
        }

        if ($ret['c_commu']['c_member_id_admin'] == $u) {
            $ret['is_commu_admin']  = true;
        }
    } else {
        if (_db_is_c_commu_member_confirm($u, $target_c_commu_id)) {
            $ret['is_commu_member_confirm'] = true;
        }
    }

    switch ($ret['c_commu']['public_flag']) {
    case "public":
    case "auth_public":
    case "auth_sns":
        $ret['is_bbs_view'] = true;
        break;
    case "auth_commu_member":
        $ret['is_bbs_view'] = $ret['is_commu_member'];
        break;
    }

    return $ret;
}

function _db_is_c_commu_member_confirm($c_member_id, $c_commu_id)
{
    $sql = "SELECT COUNT(*) FROM c_commu_member_confirm" .
        " WHERE c_member_id = ? AND c_commu_id = ?";
    $params = array(intval($c_member_id), intval($c_commu_id));
    return db_get_one($sql, $params);
}

function _db_c_commu_member4c_member_id($c_member_id, $c_commu_id)
{
    $sql = "SELECT * FROM c_commu_member" .
            " WHERE c_member_id=? AND c_commu_id=?";
    $params = array(intval($c_member_id), intval($c_commu_id));
    return db_get_row($sql, $params);
}

/**
 * コミュニティトピック情報取得
 * 
 * @param   int $c_commu_topic_id
 * @return  array トピック情報
 */
function _do_c_bbs_c_commu_topic4c_commu_topic_id($c_commu_topic_id)
{
    $sql = 'SELECT * FROM c_commu_topic WHERE c_commu_topic_id = ?';
    $params = array(intval($c_commu_topic_id));
    return db_get_row($sql, $params);
}

/**
 * コミュニティ参加要請情報をIDから取得
 * 
 * @param   int $c_commu_member_confirm_id
 * @return  array
 *              c_commu_member_confirm.*,
 *              c_member_id_admin
 */
function _do_c_commu_member_confirm4c_commu_member_confirm_id($c_commu_member_confirm_id)
{
    $sql = "SELECT cmc.*, c.c_member_id_admin";
    $sql .= " FROM c_commu_member_confirm AS cmc, c_commu AS c";
    $sql .= " WHERE cmc.c_commu_member_confirm_id=?";
    $sql .= " AND cmc.c_commu_id=c.c_commu_id";
    $params = array(intval($c_commu_member_confirm_id));
    return db_get_row($sql, $params);
}

//TODO:constant
define('STATUS_C_JOIN_REQUEST_FREE', "1"); //コミュニティ参加(承認必要なし)
define('STATUS_C_JOIN_REQUEST_NEED', "2"); //コミュニティ参加(承認必要)
define('STATUS_C_JOIN_WAIT', "3"); //コミュニティ参加(承認待ち)
define('STATUS_C_JOIN_ALREADY', "4"); //コミュニティ参加(既に参加)

function do_common_get_c_join_status($c_member_id,$c_commu_id)
{
    $is_c_commu_member = _db_is_c_commu_member($c_commu_id, $c_member_id);
    $is_wait = do_common_is_c_commu_join_wait($c_commu_id, $c_member_id);
    $c_commu = _db_c_commu4c_commu_id($c_commu_id);
    $is_join_request_free = false;
    if ($c_commu['public_flag'] == "public") {
        $is_join_request_free = true;
    }

    $ret = STATUS_C_JOIN_ALREADY;
    if (!$is_c_commu_member) { //メンバーで無い
        if ($is_wait == true) {
            $ret = STATUS_C_JOIN_WAIT;
        } else {
            if ($is_join_request_free) {
                $ret = STATUS_C_JOIN_REQUEST_FREE;
            } else {
                $ret = STATUS_C_JOIN_REQUEST_NEED;
            }
        }
    }
    return $ret;
}

/**
 * トピックコメントIDからトピックを得る
 */
function do_c_bbs_c_commu_topic_comment4c_commu_topic_comment_id($c_commu_topic_comment_id)
{
    $sql = 'SELECT * FROM c_commu_topic_comment WHERE c_commu_topic_comment_id = ?';
    $params = array(intval($c_commu_topic_comment_id));
    return db_get_row($sql, $params);
}

/**
 * トピック情報取得
 * 
 * @param   int $c_commu_topic_id
 * @return  array $c_commu_topic
 */
function do_common_c_commu_topic4c_commu_topic_id($c_commu_topic_id, $c_member_id)
{
    $sql = "SELECT * FROM c_commu_topic WHERE c_commu_topic_id = ?";
    $params = array(intval($c_commu_topic_id));
    $one = db_get_row($sql, $params);

    if ($one['c_member_id'] == $c_member_id) {
        $one['is_c_commu_topic_admin'] = true;
    }
    return $one;
}

function k_p_h_home_c_commu_list_lastupdate4c_member_id($c_member_id, $limit)
{
    $sql = 'SELECT DISTINCT c.* FROM c_commu_member AS cm, c_commu AS c' .
            ' WHERE cm.c_member_id = ? AND c.c_commu_id = cm.c_commu_id' .
            ' ORDER BY RAND()';
    $params = array(intval($c_member_id));
    $c_commu_list = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($c_commu_list as $key => $value) {
        $c_commu_list[$key]['count_members'] =
            _db_count_c_commu_member_list4c_commu_id($value['c_commu_id']);
    }

    return $c_commu_list;
}

/**
 * 参加不参加にかかわらず、最新書き込みのあったコミュニティリストを取得
 */
function k_p_h_com_find_all_c_commu_list_lastupdated($limit = 5)
{
    $sql = "SELECT c_commu_id, MAX(r_datetime) as updatetime" .
        " FROM c_commu_topic_comment" .
        " GROUP BY c_commu_id" .
        " ORDER BY updatetime DESC";
    $comments = db_get_all_limit($sql, 0, $limit);

    $c_commu_list = array();
    foreach ($comments as $comment) {
        $c_commu = _db_c_commu4c_commu_id($comment['c_commu_id']);
        $c_commu['updatetime'] = $comment['updatetime'];
        $c_commu_list[] = $c_commu;
    }
    return $c_commu_list;
}

/**
 * トピック名を取得
 */
function k_p_c_bbs_c_commu_topic_name4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT name FROM c_commu_topic WHERE c_commu_topic_id = ?";
    $params = array(intval($c_commu_topic_id));
    return db_get_one($sql, $params);
}

/**
 * トピックのコメントリストを取得
 * 引数のメンバＩＤが書き込んだコメントに対しては、
 * is_c_commu_topic_comment_admin=1が返る。
 */
function k_p_c_bbs_c_commu_topic_comment_list4c_c_commu_topic_id($c_commu_topic_id, $c_member_id, $page_size, $page)
{
    $sql = "SELECT c_commu_topic_comment.*, c_member.nickname" .
        " FROM c_commu_topic_comment" .
            " LEFT JOIN c_member USING (c_member_id)" .
        " WHERE c_commu_topic_id = ?" .
        " ORDER BY number DESC";
    $params = array(intval($c_commu_topic_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($list as $key => $value) {
        if ($list[$key]['c_member_id'] == $c_member_id) {
            $list[$key]['is_c_commu_topic_comment_admin'] = true;
        }
    }

    $sql = "SELECT COUNT(*) FROM c_commu_topic_comment WHERE c_commu_topic_id = ?";
    $params = array(intval($c_commu_topic_id));
    $total_num = db_get_one($sql, $params) - 1;

    if ($total_num > 0) {
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
    return array($list , $prev , $next);
}

/**
 * トピックＩＤからコミュニティIDと名前を取得
 */
function k_p_c_bbs_c_commu4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT cc.c_commu_id , cc.name FROM c_commu_topic AS cct, c_commu AS cc ";
    $sql .= " WHERE cct.c_commu_topic_id = ?";
    $sql .= " AND cc.c_commu_id = cct.c_commu_id ";
    $params = array(intval($c_commu_topic_id));
    return db_get_row($sql, $params);
}

/**
 * 指定したメンバがコミュニティ管理者かどうかを判定
 */
function k_p_c_bbs_is_admin4c_member_id_c_commu_topic_id($c_member_id, $c_commu_topic_id)
{
    $c_commu = k_p_c_bbs_c_commu4c_commu_topic_id($c_commu_topic_id);
    $c_commu_id = $c_commu['c_commu_id'];

    $sql = "SELECT c_member_id_admin";
    $sql .= " FROM c_commu";
    $sql .= " WHERE c_commu_id = ?";
    $params = array(intval($c_commu_id));
    $c_commu_id_admin = db_get_one($sql, $params);

    if ($c_member_id == $c_commu_id_admin) {
        return true;
    }
    return false;
}

/**
 * コミュニティの管理者(ID, nickname)を取得
 */
function k_p_c_bbs_c_member_admin4c_commu_topic_id($c_commu_topic_id)
{
    $c_commu = k_p_c_bbs_c_commu4c_commu_topic_id($c_commu_topic_id);
    $c_commu_id = $c_commu['c_commu_id'];

    $sql = "SELECT c_member_id_admin , nickname";
    $sql .= " FROM c_commu, c_member";
    $sql .= " WHERE c_commu_id=?".
            " AND c_member_id=c_member_id_admin";
    $params = array(intval($c_commu_id));
    return db_get_row($sql, $params);
}

/**
 * 参加コミュニティリストを取得
 * 範囲を指定できる
 * ＩＤが新しいもの順
 */
function k_p_fh_com_list_c_commu_list4c_member_id($c_member_id, $page_size, $page)
{
    $sql = "SELECT name, c_commu.c_commu_id FROM c_commu_member , c_commu";
    $sql .= " WHERE c_commu_member.c_member_id = ?";
    $sql .= " AND c_commu.c_commu_id=c_commu_member.c_commu_id";
    $sql .= " ORDER BY c_commu.c_commu_id DESC ";

    $params = array(intval($c_member_id));
    $c_commu_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_commu_list as $key => $value) {
        $c_commu_list[$key]['count_members'] =
            _db_count_c_commu_member_list4c_commu_id($value['c_commu_id']);
    }

    $total_num = p_common_count_c_commu4c_member_id($c_member_id);
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
    return array($c_commu_list , $prev , $next, $total_num);
}

/**
 * メンバＩＤのメンバと、コミュニティＩＤのコミュニティの関係を返す
 */
function k_p_c_home_relationship_between_member_commu($c_commu_id, $c_member_id)
{
    $relation = array(
        'join' => false,
        'wait' => false
    );

    //参加承認待ちかどうかをチェック
    $sql = "SELECT COUNT(*) ";
    $sql .= "FROM c_commu_member_confirm ";
    $sql .= "WHERE c_commu_id = ? AND c_member_id = ?";
    $params = array(intval($c_commu_id), intval($c_member_id));
    if (db_get_one($sql, $params)) {
        //承認待ちなら
        $relation['wait'] = true;
        return $relation;
    }

    //参加してるかどうかチェック
    $sql = "SELECT COUNT(*) ";
    $sql .= "FROM c_commu_member ";
    $sql .= "WHERE c_commu_id = ? AND c_member_id = ?";
    $params = array(intval($c_commu_id), intval($c_member_id));
    if (db_get_one($sql, $params)) {
        //参加なら
        $relation['join'] = true;
    }
    return $relation;
}

/**
 * コミュニティのメンバリストをランダムに取得
 */
function k_p_c_home_c_commu_member_list_random4c_commu_id($c_commu_id, $limit)
{
    $sql = "SELECT cm.c_member_id, cm.nickname ";
    $sql .= "FROM c_member AS cm , c_commu_member AS ccm ";
    $sql .= "WHERE ccm.c_commu_id = ?" .
            " AND ccm.c_member_id = cm.c_member_id";
    $sql .= " ORDER BY RAND()";
    $params = array(intval($c_commu_id));
    $c_commu_member_list = db_get_all_limit($sql, 0, $limit, $params);

    foreach ($c_commu_member_list as $key => $value) {
        $c_commu_member_list[$key]['count_friend'] =
            db_friend_count_friends($value['c_member_id']);
    }

    return $c_commu_member_list;
}

/**
 * コミュニティメンバのリストをID新しいもの順に取得する。
 * 取得する範囲を指定できる。
 */
function k_p_c_member_list_c_members_disp4c_commu_id($c_commu_id, $page_size, $page)
{
    $sql = 'SELECT c_member.c_member_id, nickname '
        . ' FROM c_member, c_commu_member'
        . ' WHERE c_member.c_member_id = c_commu_member.c_member_id' .
                ' AND c_commu_member.c_commu_id = ?'.
        ' ORDER BY c_member.c_member_id DESC';
    $params = array(intval($c_commu_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($list as $key => $value) {
        $list[$key]['friend_count'] = db_friend_count_friends($value['c_member_id']);
    }

    $total_num = _db_count_c_commu_member_list4c_commu_id($c_commu_id);
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
    return array($list , $prev , $next);
}

/**
 * Myフレンドから指定コミュに参加していない人をランダムに選ぶ
 */
function k_p_c_invite_c_friend_list_random4c_member_id4c_commu_id($c_member_id, $c_commu_id, $limit)
{
    //友達リスト
    $friend_list = db_friend_c_member_id_list($c_member_id);

    //参加者リスト
    $sql = "SELECT c_member_id FROM c_commu_member WHERE c_commu_id = ?";
    $params = array(intval($c_commu_id));
    $member_list = db_get_col($sql, $params);

    //友達リストから参加者リストを引く
    $result = array_diff($friend_list, $member_list);

    if (!$result) {
        return null;
    }

    $result = implode(',', array_map('intval', $result));
    $sql = 'SELECT c_member_id, nickname FROM c_member' .
            ' WHERE c_member_id IN ( '. $result . ') ' .
            ' ORDER BY RAND()';
    return db_get_all_limit($sql, 0, $limit);
}

/**
 * 参加コミュニティ新着書き込みリスト取得
 */
function k_p_h_home_c_commu_topic_comment_list4c_member_id($c_member_id, $page_size, $page)
{
    $sql = "SELECT cc.c_commu_topic_id, c.name AS c_commu_name, ct.name AS c_commu_topic_name , cm.c_member_id, cc.number, max(cc.r_datetime) as r_datetime";
    $sql .= " FROM c_commu_member AS cm, c_commu_topic_comment AS cc";
    $sql .= ", c_commu AS c, c_commu_topic AS ct";
    $sql .= " WHERE cm.c_member_id = ?";
    $sql .= " AND cc.c_commu_id = cm.c_commu_id";
    $sql .= " AND c.c_commu_id = cm.c_commu_id";
    $sql .= " AND ct.c_commu_id = cm.c_commu_id";
    $sql .= " AND ct.c_commu_topic_id = cc.c_commu_topic_id";
    $sql .= " group by c_commu_topic_id, c_commu_name, c_commu_topic_name ,c_member_id ";
    $sql .= " ORDER BY r_datetime DESC";

    $params = array(intval($c_member_id));
    $c_commu_topic_list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($c_commu_topic_list as $key => $value) {
        $c_commu_topic_list[$key]['number'] = db_commu_get_max_number4topic($value['c_commu_topic_id']);
    }

    $sql = "SELECT count(*) ";
    $sql .= " FROM c_commu_member AS cm";
    $sql .= ", c_commu AS c, c_commu_topic AS ct";
    $sql .= " WHERE cm.c_member_id = ?";
    $sql .= " AND c.c_commu_id = cm.c_commu_id";
    $sql .= " AND ct.c_commu_id = cm.c_commu_id";
    $params = array(intval($c_member_id));
    $total_num = db_get_one($sql, $params);

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
    return array($c_commu_topic_list, $prev, $next, $total_num);
}

/**
 * あなたに(の)管理コミュニティに参加を希望しているメンバー(参加承認待ち)
 * 
 * @param   int $c_member_id    : 要請されている方(あなた＝管理者)
 * @return  array_of_array
 *              c_commu_member_confirm.*
 *              c_commu_name    : コミュニティの名前
 *              nickname        : 要請している人の名前
 *              message_disp    : 表示用メッセージ
 */
function k_p_h_confirm_list_anatani_c_commu_member_confirm_list4c_member_id($c_member_id)
{
    $sql = "SELECT cmc.*, c.name AS c_commu_name";
    $sql .= " FROM c_commu_member_confirm AS cmc, c_commu AS c";
    $sql .= " WHERE c.c_member_id_admin = ?" .
            " AND cmc.c_commu_id=c.c_commu_id";
    $params = array(intval($c_member_id));
    $c_commu_member_confirm_list = db_get_all($sql, $params);

    foreach ($c_commu_member_confirm_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
        $c_commu_member_confirm_list[$key]['nickname'] = $c_member['nickname'];
    }
    return $c_commu_member_confirm_list;
}


/**
 * あなたがコミュニティ参加要請しているコミュニティ(参加要請中)
 * 
 * @param   int $c_member_id    : 要請している方(あなた)
 * @return  array_of_array
 *              c_commu_member_confirm.*,
 *              c_commu_name        : コミュニティの名前
 *              c_member_id_admin   : 管理者のメンバーID
 *              nickname            : 管理者の名前
 */
function k_p_h_confirm_list_anataga_c_commu_member_confirm_list4c_member_id($c_member_id)
{
    $sql = "SELECT cmc.*, c.name AS c_commu_name, c.c_member_id_admin";
    $sql .= " FROM c_commu_member_confirm AS cmc, c_commu AS c";
    $sql .= " WHERE cmc.c_member_id = ?" .
            " AND cmc.c_commu_id = c.c_commu_id";
    $params = array(intval($c_member_id));
    $c_commu_member_confirm_list = db_get_all($sql, $params);

    foreach ($c_commu_member_confirm_list as $key => $value) {
        $c_member = db_common_c_member4c_member_id_LIGHT($value['c_member_id_admin']);
        $c_commu_member_confirm_list[$key]['nickname'] = $c_member['nickname'];
    }
    return $c_commu_member_confirm_list;
}

/**
 * トピックIDからトピック情報を取得
 * 
 * @param int c_commu_topic_id
 * @return array_of_array c_commu_topic.*, commu_name
 */
function mail_c_commu_topic4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT t.*, c.name AS commu_name" .
        " FROM c_commu_topic AS t, c_commu AS c" .
        " WHERE t.c_commu_topic_id = ?" .
        " AND c.c_commu_id = t.c_commu_id";
    $params = array(intval($c_commu_topic_id));
    return db_get_row($sql, $params);
}

///

//// c_commu_category

function _db_c_commu_category4null()
{
    $sql = 'SELECT cat.* FROM c_commu_category AS cat' .
            ' INNER JOIN c_commu_category_parent AS pcat' .
            ' USING (c_commu_category_parent_id)' .
            ' ORDER BY pcat.sort_order, cat.sort_order';
    return db_get_all($sql);
}

function p_h_com_find_all_c_commu_category_list4null()
{
    $list = _db_c_commu_category4null();

    // カテゴリごとのコミュニティ数を取得
    $sql = 'SELECT c_commu_category_id, COUNT(*) as count FROM c_commu' .
        ' GROUP BY c_commu_category_id';
    $counts = db_get_assoc($sql);

    $c_commu_category_list = array();
    foreach ($list as $item) {
        $item['count_commu_category'] = intval($counts[$item['c_commu_category_id']]);
        $c_commu_category_list[$item['c_commu_category_parent_id']][] = $item;
    }
    return $c_commu_category_list;
}

/**
 * 中カテゴリリストを取得
 * 
 * @return  array 中カテゴリリスト
 */
function _db_c_commu_category_parent_list4null()
{
    $hint = db_mysql_hint('FORCE INDEX (sort_order)');
    $sql = 'SELECT * FROM c_commu_category_parent' . $hint . ' ORDER BY sort_order';
    return db_get_all($sql);
}

/**
 * カテゴリ情報をIDから取得
 */
function db_commu_get_c_commu_category4id($c_commu_category_id)
{
    $sql = 'SELECT * FROM c_commu_category WHERE c_commu_category_id = ?';
    $params = array(intval($c_commu_category_id));
    return db_get_row($sql, $params);
}

/** 
 * コミュニティの小カテゴリＩＤから小カテゴリ名を得る
 */
function k_p_h_com_category_c_commu_category_name4c_commu_category_id($c_commu_category_id)
{
    $sql = 'SELECT name FROM c_commu_category WHERE c_commu_category_id = ?';
    $params = array(intval($c_commu_category_id));
    return db_get_one($sql, $params);
}

function k_p_h_com_category_c_commu_category_parent_id4c_commu_category_id($c_commu_category_id)
{
    $cat = db_commu_get_c_commu_category4id($c_commu_category_id);
    return $cat['c_commu_category_parent_id'];
}

function p_h_com_find_all_search_c_commu4c_commu_category(
            $search_word,
            $c_commu_category_parent_id,
            $page_size,
            $page,
            $val_order = 'r_datetime',
            $c_commu_category_id = 0)
{
    $select = 'SELECT c_commu.*';

    $where = ' WHERE 1';
    $params = array();
    if ($c_commu_category_id) {
        $where .= ' AND c_commu.c_commu_category_id = ?';
        $params[] = $c_commu_category_id;
    }
    if ($search_word) {
        $words = explode(' ', $search_word);
        foreach ($words as $word) {
            $word = check_search_word($word);

            $where .= ' AND (c_commu.name LIKE ? OR c_commu.info LIKE ?)';
            $params[] = '%'.$word.'%';
            $params[] = '%'.$word.'%';
        }
    }

    switch ($val_order) {
    case 'r_datetime':
    default:
        $from = ' FROM c_commu';
        $order = ' ORDER BY c_commu.r_datetime DESC';
        $sql = $select.$from.$where.$order;
        break;

    case 'count':
        $from  = ' FROM c_commu, c_commu_member';
        $order = ' ORDER BY count_commu_member DESC';
        $group = ' GROUP BY c_commu_member.c_commu_id';
        $sql = $select . ', COUNT(c_commu_member.c_member_id) AS count_commu_member' .
            $from .
            $where . ' AND c_commu_member.c_commu_id = c_commu.c_commu_id' .
            $group .
            $order;
        break;
    }

    $list = db_get_all_page($sql, $page, $page_size, $params);
    foreach ($list as $key => $value) {
        $sql = 'SELECT name FROM c_commu_category WHERE c_commu_category_id = ?';
        $p2 = array(intval($value['c_commu_category_id']));
        $list[$key]['c_commu_category_name'] = db_get_one($sql, $p2);

        if (!isset($value['count_commu_member'])) {
            $list[$key]['count_commu_member'] =
                _db_count_c_commu_member_list4c_commu_id($value['c_commu_id']);
        }
    }

    $sql = 'SELECT COUNT(*) FROM c_commu' . $where;
    $total_num = db_get_one($sql, $params);

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

    $start_num = ($page - 1) * $page_size + 1;
    $end_num   = $start_num + $page_size >= $total_num ? $total_num : $start_num + $page_size - 1;

    return array($list, $prev, $next, $total_num, $start_num, $end_num);
}

function k_p_h_com_category_c_commu_list4c_commu_category_id_search($c_commu_category_id, $page_size, $page, $search_word)
{
    $sql = 'SELECT * FROM c_commu';

    $where = ' WHERE 1';
    $params = array();
    if ($search_word) {
        $where .= ' AND (name LIKE ? OR info LIKE ?)';
        $params[] = '%'.$search_word.'%';
        $params[] = '%'.$search_word.'%';
    }
    if ($c_commu_category_id != 'all' && $c_commu_category_id) {
        $where .= ' AND c_commu_category_id = ?';
        $params[] = intval($c_commu_category_id);
    }

    $sql .= $where . ' ORDER BY r_datetime DESC';
    $list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($list as $key => $value) {
        $list[$key]['count_commu_member'] =
            _db_count_c_commu_member_list4c_commu_id($value['c_commu_id']);
    }

    $sql = 'SELECT COUNT(*) FROM c_commu' . $where;
    $total_num = db_get_one($sql, $params);

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

    return array($list, $prev, $next, $total_num);
}

///

function _db_is_c_event_admin($c_commu_topic_id, $c_member_id)
{
    $sql = 'SELECT c_event_member_id FROM c_event_member' .
            ' WHERE c_commu_topic_id = ? AND c_member_id = ? AND is_admin = 1';
    $params = array(intval($c_commu_topic_id), intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

function _db_is_c_event_member($c_commu_topic_id, $c_member_id)
{
    $sql = 'SELECT c_event_member_id FROM c_event_member' .
            ' WHERE c_commu_topic_id = ? AND c_member_id = ?';
    $params = array(intval($c_commu_topic_id), intval($c_member_id));
    return (bool)db_get_one($sql, $params);
}

function c_event_detail_c_topic4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT cct.*, cctc.*, cm.nickname, cpp.pref" .
        " FROM c_commu_topic as cct" .
        " LEFT JOIN c_commu_topic_comment as cctc ON cct.c_commu_topic_id = cctc.c_commu_topic_id" .
        " LEFT JOIN c_member as cm ON cct.c_member_id = cm.c_member_id" .
        " LEFT JOIN c_profile_pref as cpp ON cct.open_pref_id = cpp.c_profile_pref_id" .
        " WHERE cct.c_commu_topic_id = ?".
            " AND cctc.number = 0";
    $params = array(intval($c_commu_topic_id));
    $lst = db_get_row($sql, $params);

    $sql = "SELECT COUNT(*) FROM c_event_member" .
        " WHERE c_commu_topic_id = ?";
    $lst['member_num'] = db_get_one($sql, $params);

    return $lst;
}

function c_event_detail_c_topic_write4c_commu_topic_id($c_commu_topic_id,$page,$page_size)
{
    $sql = "SELECT ctc.*, c_member.nickname " .
        " FROM c_commu_topic_comment AS ctc" .
            " LEFT JOIN c_member USING (c_member_id)" .
        " WHERE ctc.c_commu_topic_id = ? AND ctc.number > 0 " .
        " ORDER BY ctc.r_datetime DESC";
    $params = array(intval($c_commu_topic_id));
    $lst = db_get_all_page($sql, $page, $page_size, $params);

    $sql = "SELECT count(*) FROM c_commu_topic_comment" .
        " WHERE c_commu_topic_id = ? AND number > 0";
    $total_num = db_get_one($sql, $params);

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
    $lst = array_reverse($lst);

    $start = reset($lst);
    $start_num = $start['number'];

    $end = end($lst);
    $end_num = $end['number'];

    return array($lst, $prev, $next, $total_num, $start_num, $end_num);
}

function c_event_write_delete_confirm_c_commu_topic_comment4c_commu_topic_comment_id($c_commu_topic_comment_id)
{
    $sql = "SELECT tc.*,cm.nickname FROM c_commu_topic_comment AS tc " .
            " LEFT JOIN c_member as cm ON cm.c_member_id = tc.c_member_id " .
            " WHERE tc.c_commu_topic_comment_id = ?";
    $params = array(intval($c_commu_topic_comment_id));
    return db_get_row($sql, $params);
}

function c_event_member_list4c_commu_topic_id($c_commu_topic_id, $page, $page_size)
{
    $sql = "SELECT cm.* FROM c_member as cm, c_event_member as cem" .
            " WHERE cm.c_member_id = cem.c_member_id" .
            " AND cem.c_commu_topic_id = ?";
    $params = array(intval($c_commu_topic_id));
    return db_get_all_page($sql, $page, $page_size, $params);
}

function count_c_event_member_list4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT COUNT(*) FROM c_member as cm, c_event_member as cem" .
            " WHERE cm.c_member_id = cem.c_member_id" .
            " AND cem.c_commu_topic_id = ?";
    $params = array(intval($c_commu_topic_id));
    return db_get_one($sql, $params);
}

function p_c_event_mail_list4c_commu_topic_id($c_commu_topic_id, $excepted_id = 0)
{
    $sql = 'SELECT c_member_id FROM c_event_member WHERE c_commu_topic_id = ?';
    $params = array(intval($c_commu_topic_id));
    $list = db_get_col($sql, $params);

    $result = array();
    foreach ($list as $c_member_id) {
        if ($c_member_id != $excepted_id) {
            $result[] = db_common_c_member4c_member_id_LIGHT($c_member_id);
        }
    }
    return $result;
}

function p_c_event_mail_confirm_list4c_member_ids($c_member_ids)
{
    $c_member_id_str = implode(',', array_map('intval', $c_member_ids));
    $sql = "SELECT * FROM c_member" .
            " WHERE c_member_id IN (".$c_member_id_str.")";
    return db_get_all($sql);
}

function p_c_event_add_year4null()
{
    $y = date('Y');
    return array($y, $y+1);
}

function p_common_is_c_event_member($c_commu_topic_id, $c_member_id)
{
  $sql = "SELECT COUNT(*) FROM c_event_member" .
      " WHERE c_commu_topic_id = ?".
      " AND c_member_id = ?";
  $params = array(intval($c_commu_topic_id), intval($c_member_id));
  return db_get_one($sql, $params);
}

function p_h_home_event4c_member_id($year, $month, $day, $c_member_id)
{
    $sql = 'SELECT c_commu_id FROM c_commu_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    $ids = db_get_col($sql, $params);
    $ids = implode(", ", $ids);
    if (!$ids) {
        return array();
    }

    $today = sprintf("%04d-%02d-%02d", $year, $month, $day);
    $sql = "SELECT * FROM c_commu_topic" .
        " WHERE c_commu_id IN ($ids)" .
        " AND event_flag = 1" .
        " AND open_date = ?";
    $params = array($today);
    $list = db_get_all($sql, $params);

    foreach ($list as $key => $item) {
        $list[$key]['is_join'] = p_common_is_c_event_member($item['c_commu_topic_id'], $c_member_id);
    }
    return $list;
}

function k_p_c_event_member_list4c_commu_topic_id($c_commu_topic_id, $page_size, $page)
{
    $sql = "SELECT cm.* FROM c_member AS cm, c_event_member AS cem" .
            " WHERE cm.c_member_id = cem.c_member_id " .
            " AND cem.c_commu_topic_id = ?";
    $params = array(intval($c_commu_topic_id));
    $list[0] = db_get_all_page($sql, $page, $page_size, $params);

    $total_c_event_member = k_p_count_c_event_member_list4c_commu_topic_id($c_commu_topic_id);
    $start_num = ($page-1) * $page_size + 1;
    $end_num   = $page * $page_size;
    if ($end_num > $total_c_event_member) {
        $end_num = $total_c_event_member;
    }
    $end_page = ceil($total_c_event_member / $page_size);

    $list[1] = ($start_num != 1);
    $list[2] = ($end_num != $total_c_event_member);

    return $list;
}

function k_p_count_c_event_member_list4c_commu_topic_id($c_commu_topic_id)
{
    $sql = "SELECT COUNT(*) FROM c_member AS cm, c_event_member AS cem" .
            " WHERE cm.c_member_id = cem.c_member_id" .
            " AND cem.c_commu_topic_id = ?";
    $params = array(intval($c_commu_topic_id));
    return db_get_one($sql, $params);
}

/**
 * 非公開コミュニティへの承認なし参加フラグが立っているかどうか
 */
function db_c_commu4c_admin_invite_id($c_commu_id, $c_member_id_to)
{
    // すでにフラグが立っている
    $sql = 'SELECT c_commu_admin_invite_id FROM c_commu_admin_invite' .
            ' WHERE c_commu_id = ? AND c_member_id_to = ?';
    $params = array(intval($c_commu_id), intval($c_member_id_to));
    $result = db_get_one($sql, $params);
    if ($result) {
        return $result;
    } else {
        return false;
    }
}

/**
 * コミュニティメンバーのリストを得る
 */
function p_c_commu_member_id_list4c_commu_id($c_commu_id)
{
    $sql = 'SELECT c_member_id FROM c_commu_member' .
            ' WHERE c_commu_id = ? AND is_receive_message = 1';

    $params = array(intval($c_commu_id));
    $lst = db_get_col($sql, $params);
    return $lst;
}

?>
