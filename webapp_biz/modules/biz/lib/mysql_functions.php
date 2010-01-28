<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//bizモジュール用 MySQL接続、操作用ライブラリ

//予期しない多重定義を避けるため、必ず関数名にはbiz_というprefixをつける

//GET---------------------------------------------

//schedule_idの最大値を得る関数
function biz_getScheduleMax()
{
    $sql = 'SELECT MAX(biz_schedule_id) FROM biz_schedule';
    if ($count = db_get_one($sql, $params)) {
        return $count;
    } else {
        return false;
    }
}

//group_idの最大値を得る関数
function biz_getGroupMax()
{
    $sql = 'SELECT MAX(biz_group_id) FROM biz_group';
    if ($count = db_get_one($sql)) {
        return $count;
    } else {
        return false;
    }
}

//member_idの最大値を得る関数
function biz_getMenberMax()
{
    $sql = 'SELECT MAX(c_member_id) FROM c_member';
    if ($count = db_get_one($sql, $params)) {
        return $count;
    } else {
        return false;
    }
}

function biz_getShisetsuScheduleMax()
{
    $sql = 'SELECT MAX(biz_shisetsu_schedule_id) FROM biz_shisetsu_schedule';
    if ($count = db_get_one($sql, $params)) {
        return $count;
    } else {
        return false;
    }
}

//指定された日付に存在する予定IDを得る関数
function biz_getDateSchedule($y,$m,$d)
{
    $sql = 'SELECT biz_schedule_id FROM biz_schedule WHERE begin_date LIKE \''."$y-$m-$d%".'\' ORDER BY begin_time ASC ;';
    return db_get_col($sql, $params);
}

//指定された予定IDの情報を得る関数
function biz_getScheduleInfo($schedule_id)
{
    $sql = 'SELECT * FROM biz_schedule WHERE biz_schedule_id = ?';
    $params = array(
        intval($schedule_id),
    );
    return db_get_row($sql, $params);
}

function biz_getMemberNickname($c_member_id)
{
    $sql = 'SELECT nickname FROM c_member WHERE c_member_id = ?';
    $params = array(
        intval($c_member_id),
    );

    return db_get_one($sql, $params);
}

//指定された予定と同じ繰り返しグループに属するすべての予定idを得る関数
function biz_getRepeatScheduleID($schedule_id)
{
    $sql = 'SELECT rep_first FROM biz_schedule WHERE biz_schedule_id = ?';
    $params = array(
        intval($schedule_id),
    );
    $first_id = db_get_one($sql, $params);

    if (!$first_id) {  // 削除しようとした繰り返し予定が存在しない
        return array();
    } else {
        $sql = 'SELECT biz_schedule_id FROM biz_schedule WHERE rep_first = ? ORDER BY begin_date';
        $params = array(
            intval($first_id),
        );
        $schedule = db_get_col($sql, $params);

        return $schedule;
    }
}

//指定された繰り返し予定IDの開始日を得る関数
function biz_getRepeatBegin($schedule_id)
{
    $sql = 'SELECT rep_first FROM biz_schedule WHERE biz_schedule_id = ?';
    $params = array(
        intval($schedule_id),
    );

    $first_id = db_get_one($sql, $params);

    $sql = 'SELECT begin_date FROM biz_schedule WHERE rep_first = ? ORDER BY begin_date';
    $params = array(
        intval($first_id),
    );
    $schedule = db_get_one($sql, $params);

    return $schedule;
}

//指定された繰り返し予定IDの終了日を得る関数
function biz_getRepeatFinish($schedule_id)
{
    $sql = 'SELECT rep_first FROM biz_schedule WHERE biz_schedule_id = ?';
    $params = array(
        intval($schedule_id),
    );
    $first_id = db_get_one($sql, $params);

    $sql = 'SELECT begin_date FROM biz_schedule WHERE rep_first = ? ORDER BY begin_date DESC';
    $params = array(
        intval($first_id),
    );
    $schedule = db_get_one($sql, $params);

    return $schedule;
}

//指定された予定に関する権限があるかどうかをチェックする関数
function biz_isPermissionSchedule($u, $biz_schedule_id)
{
    $biz_schedule = biz_getScheduleInfo($biz_schedule_id);
    $biz_schedule_member = biz_getJoinIdSchedule($biz_schedule_id);
    $public_flag = $biz_schedule['public_flag'];
    $biz_group_id = $biz_schedule['biz_group_id'];
    $target_c_member_id = $biz_schedule['c_member_id'];

    if (empty($biz_schedule)) {  // 存在しない予定には表示権限がない
        return false;
    }

    switch ($public_flag) {
    case 'private' :  // 予定参加者にのみ権限が与えられる予定
        if ($target_c_member_id == $u) {  // 自分が予定作成者
            return true;
        } elseif(in_array($u, $biz_schedule_member)) {
            return true;
        } else {
            return false;
        }
    default :  // すべてのメンバーに権限が与えられる予定
        return true;
    }
}

//指定された日付に存在する特定メンバーの予定idのみを得る関数
function biz_getDateMemberSchedule($y, $m, $d, $target_c_member_id, $u)
{
    $schedule = array();
    $contain = array();

    $tmp = biz_getDateSchedule($y, $m, $d);
    $sc_list = array();

    $biz_group_id_list = array();
    foreach(biz_getJoinGroup($target_c_member_id) as $value) {
        $biz_group_id_list[] = $value['biz_group_id'];
    }

    foreach ($tmp as $biz_schedule_id) {
        $biz_schedule = biz_getScheduleInfo($biz_schedule_id);
        $sql = 'SELECT c_member_id FROM biz_schedule_member WHERE biz_schedule_id = ?';
        $biz_schedule_member_id_list = db_get_col($sql, array(intval($biz_schedule_id)));

        // スケジュールに参加しているメンバー
        $members = biz_getJoinIdSchedule($biz_schedule_id);
        if (biz_isPermissionSchedule($u, $biz_schedule_id)) {
            if (in_array($target_c_member_id, $members)) {
                $contain[] = $biz_schedule_id;
            }
        }
    }

    $tmp = array_unique($tmp);

    foreach ($contain as $key => $value) {
        if (!is_null($value)) {

            //そのidの予定を得る
            $sql = 'SELECT * FROM biz_schedule WHERE biz_schedule_id = ?';
            $params = array(
                intval($value),
            );
            $schedule += array($key => db_get_row($sql, $params));
        }
    }
    return $schedule;
}

//指定された予定idの保持するメンバーIDを得る関数
function biz_getJoinIdSchedule($id)
{
    $sql = 'SELECT c_member_id FROM biz_schedule_member WHERE biz_schedule_id = ?';
    $params = array(
        intval($id),
    );

    $ids = db_get_col($sql, $params);

    return $ids;
}

//指定されたメンバーIDと関連付いた未読予定idを得たうえに、予定のデータまでつけてしまう関数
function biz_getJoinIdNewSchedule($id)
{
    $sql = 'SELECT biz_schedule_id FROM biz_schedule_member WHERE c_member_id = ? AND is_read = 0;';
    $params = array(
        intval($id),
    );

    $ids = db_get_col($sql, $params);

    $schedule = array();

    foreach ($ids as $value) {
        $sql = 'SELECT * FROM biz_schedule WHERE biz_schedule_id = ?';
        $params = array(intval($value));
        $schedule[] = db_get_row($sql, $params);
    }

    return $schedule;
}

//指定された予定IDを保持しているメンバー情報を得る関数
function biz_getJoinMemberSchedule($id)
{
    $sql = 'SELECT c_member_id FROM biz_schedule_member WHERE biz_schedule_id = ?';
    $params = array(
        intval($id),
    );

    $tmp = db_get_col($sql, $params);
    $members = array();

    foreach ($tmp as $value) {
        $sql = 'SELECT nickname FROM c_member WHERE c_member_id = ?';
        $params = array(
            intval($value),
        );

        $members[$value] = db_get_one($sql, $params);
    }

    return $members;
}

function biz_getJoinShisetsuScheduleID($id)
{
    $sql = 'SELECT biz_shisetsu_id FROM biz_shisetsu_schedule WHERE biz_shisetsu_schedule_id = ?';

    $params = array(
        intval($id),
    );

    return db_get_one($sql, $params);
}

//指定メンバーidが加入しているグループ数を得る関数
function biz_getGroupCount($id)
{
    $sql = 'SELECT * FROM biz_group_member WHERE c_member_id = ?';

    $params = array(
        intval($id),
    );


    return count(db_get_col($sql, $params));
}

//指定グループidのメンバーを得る関数
function biz_getGroupMember($id, $limit=null, $start=null)
{
    $params = array(
        intval($id),
    );

    $sql = 'SELECT * FROM biz_group_member WHERE biz_group_id = ? ';

    if ($start) {
        $sql .= 'AND c_member_id <= ? ';
        $params[] = intval($start);
    }

    $sql .= 'ORDER BY c_member_id';

    if ($limit) {
        $list = db_get_all_limit($sql, 0, $limit, $params);
    } else {
        $list = db_get_all($sql, $params);
    }

    return $list;
}

//指定されたグループidの情報を得る関数
function biz_getGroupData($id)
{
    $sql = "SELECT * FROM biz_group WHERE biz_group_id = ?";
    $params = array(
        intval($id),
    );
    if (!$group = db_get_row($sql, $params))
        return array();

    return $group;
}

//指定メンバーidが加入しているグループの情報を得る関数
function biz_getJoinGroup($id, $limit = null)
{
    $list = array();
    $sql = "SELECT * FROM biz_group_member";
    $sql .= " WHERE c_member_id = ?";
    $sql .= db_order_by_rand();

    $params = array(
        intval($id),
    );

    if (!is_null($limit)) {
        $list = db_get_all_limit($sql, 0, intval($limit), $params);
    } else {
        $list = db_get_all($sql, $params);
    }

    foreach ($list as $key => $value) {
        $list[$key] += biz_getGroupData($value['biz_group_id']);
        $list[$key]['count'] = count(biz_getGroupMember($value['biz_group_id']));
    }

    return $list;
}

//指定メンバーがグループに所属しているかどうかを返す関数
function biz_isGroupMember($member_id, $group_id)
{
    $sql = 'SELECT * FROM biz_group_member WHERE c_member_id = ? AND biz_group_id = ?';
    $params = array(
        intval($member_id),
        intval($group_id),
    );

    return db_get_one($sql, $params);
}

//指定された条件に見合うグループのリストを得る関数
function biz_getGroupList($keyword = '', $page = 0, $page_size = 20)
{

    //keywordあり
    if ($keyword) {
        $where = ' WHERE info LIKE ? OR name LIKE ? ORDER BY biz_group_id';
        $sql = 'SELECT * FROM biz_group'. $where;

        $params = array(
            '%'.$keyword.'%',
            '%'.$keyword.'%',
        );
        $list = db_get_all_page($sql, $page, $page_size, $params);
    //keywordなし(全件表示)
    } else {
        $where = '';
        $sql = 'SELECT * FROM biz_group ORDER BY biz_group_id';

        $params = array();
        $list = db_get_all_page($sql, $page, $page_size);
    }

    if (!$list) {
        return array();
    }

    foreach ($list as $key => $value) {
        $count = count(biz_getGroupMember($value['biz_group_id']));
        $list[$key]['count'] = $count;
    }

    $sql = 'SELECT COUNT(*) FROM biz_group' . $where;
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

//指定日の施設予定を得る関数
function biz_getShisetsuSchedule($y, $m, $d, $id=false)
{
    $params = array(
        intval($y),
        intval($m),
        intval($d),
    );

    if ($id) {
        $params[] = intval($id);
        $sql = 'SELECT * FROM biz_shisetsu_schedule WHERE date = \'?-?-?\' AND biz_shisetsu_id = ? ORDER BY begin_time ASC';
    } else {
        $sql = 'SELECT * FROM biz_shisetsu_schedule WHERE date = \'?-?-?\' ORDER BY begin_time ASC';
    }
    $list = db_get_all($sql, $params);
    foreach ($list as $key => $value) {
        $params = array(
            intval($list[$key]['c_member_id']),
        );
        $sql = 'SELECT nickname FROM c_member WHERE c_member_id = ?';
        $list[$key]['c_member_name'] = db_get_one($sql, $params);
    }

    return $list;
}

//施設施設予定の情報を得る関数
function biz_getShisetsuScheduleID($id)
{
    $sql = 'SELECT * FROM biz_shisetsu_schedule WHERE biz_shisetsu_schedule_id = ?';

    $params = array(
        intval($id),
    );

    $list = db_get_row($sql, $params);

    $sql = 'SELECT nickname FROM c_member WHERE c_member_id = ?';
    $params = array(
        intval($list['c_member_id']),
    );
    $list['member_name'] = db_get_one($sql, $params);

    return $list;
}

//施設のリストを得る関数
function biz_getShisetsuList()
{
    $sql = 'SELECT * FROM biz_shisetsu';
    $list = db_get_all($sql, $params);

    return $list;
}

//指定施設の情報を得る関数
function biz_getShisetsuData($shisetsu_id)
{
    $sql = 'SELECT * FROM biz_shisetsu WHERE biz_shisetsu_id = ?';

    $params = array(
        intval($shisetsu_id),
    );

    $list = db_get_row($sql, $params);

    return $list;
}

//バッティングしているかどうかを判定する関数
function biz_isBatting($shisetsu_id, $y, $m, $d, $begin_time, $finish_time)
{
    $list = biz_getShisetsuSchedule($y, $m, $d, $shisetsu_id);

    if (empty($list)) {
        //初めての予定登録
        return true;
    }

    $result = false;

    foreach ($list as $value) {
        //日付を演算できる値に変換
        $b_begin = strtotime($value['begin_time']);
        $b_finish = strtotime($value['finish_time']);
        $t_begin = strtotime($begin_time);
        $t_finish = strtotime($finish_time);

        //OKパターンの判別
        if ($t_begin >= $b_finish) {
            //登録される予定開始が、既存予定終了以下である
            $result = true;
        } elseif ($t_finish <= $b_begin) {
            //登録される予定終了が、既存予定開始以下である
            $result = true;
        } else {
            //OKパターンに当てはまらない予定である
            return false;
        }
    }

    return $result;
}

//その月のバナー予定を得る関数
function biz_getBannerScheduleList($y, $m, $id)
{
    $schedule = array();
    $contain = array();

    $sql = 'SELECT biz_schedule_id FROM biz_schedule WHERE (begin_date LIKE \''.$y.'-'.$m.'%\' OR finish_date LIKE \''.$y.'-'.$m.'%\') AND begin_date != finish_date';
    $tmp = db_get_all($sql, $params);

    if (!$tmp) {
        return false;
    }

    foreach ($tmp as $index) {
        foreach ($index as $value) {
            $members = biz_getJoinIdSchedule($value);
            if (in_array($id, $members)) {
                $contain[] = $value;
            }
        }
    }

    $tmp = array_unique($tmp);

    foreach ($contain as $key => $value) {
        if (!is_null($value)) {
            $sql = 'SELECT * FROM biz_schedule WHERE biz_schedule_id = ?'; //そのidの予定を得る
            $params = array(intval($value));
            $schedule += array($key => db_get_row($sql, $params));
        }
    }
    return $schedule;
}
//その日付がバナー予定のなかに含まれているかどうか
function biz_isBannerSchedule($y, $m, $d, $id)
{
    $month_banner = biz_getBannerScheduleList($y, $m, $id);

    $schedule = array();

    $testing = mktime(0, 0, 0, $m, $d, $y);

    if (!empty($month_banner)) {
        foreach ($month_banner as $value) {
            $begin_date = strtotime($value['begin_date'].' 00:00:00');
            $finish_date = strtotime($value['finish_date'].' 00:00:00');

            if (($begin_date < $testing) && ($finish_date >= $testing)) {
                $schedule[] = biz_getScheduleInfo($value['biz_schedule_id']);
            }
        }
    }

    return $schedule;
}

//指定されたTodoに関する権限があるかどうかをチェックする関数
function biz_isPermissionTodo($u, $biz_todo_id)
{
    $biz_todo = biz_getTodo($biz_todo_id);
    $public_flag = $biz_todo['public_flag'];
    $biz_group_id = $biz_todo['biz_group_id'];
    $target_c_member_id = $biz_todo['c_member_id'];
    $writer_id = $biz_todo['writer_id'];

    switch ($public_flag) {
    case 'group' :  //グループのメンバーにのみ権限が与えられるTodo
        $biz_group = biz_getGroupData($biz_group_id);
        if (biz_isGroupMember($u, $biz_group_id)) {
            return true;
        } elseif (empty($biz_group)) {  //グループが存在しない場合はTodoを公開する
            return true;
        } else {
            return false;
        }
        break;
    case 'private' :  //投稿者にのみ権限が与えられるTodo
        if ($target_c_member_id == $u) {
            return true;
        } elseif ($writer_id == $u) {  //非公開の共有Todo
            return true;
        } else {
            return false;
        }
        break;
    default :  //すべてのメンバーに権限が与えられるTodo
        return true;
    }
}

//指定メンバーのTodoを得る
function biz_getMemberTodo($u, $target_c_member_id, $cat = null)
{
    $sql = 'SELECT * FROM biz_todo WHERE c_member_id = ? AND is_check = ? ORDER BY biz_todo_id DESC;';  //メンバーが保有しているtodoid一覧
    $params = array(
        intval($target_c_member_id),
        intval($cat),
    );

    //priorityの高い順にソート
    $membertodo = db_get_all($sql, $params);
    foreach ($membertodo as $key => $row) {
       $priority[$key]  = $row['priority'];
    }
    if(!is_null($priority)) {
        array_multisort($priority, SORT_ASC, $membertodo);
    }

    $sql = 'SELECT * FROM biz_todo WHERE c_member_id = 0 AND is_check = ? ORDER BY biz_todo_id DESC;';  //共有Todo
    $params = array(
        intval($cat),
    );
    $sharetodo = db_get_all($sql, $params);

    $list = array();  //各Todoの連結処理

    foreach (array_merge($membertodo, $sharetodo) as $key => $value) {
        if (biz_isPermissionTodo($u, $value['biz_todo_id'])) {
            $sql = 'SELECT nickname FROM c_member WHERE c_member_id = ?';
            $params = array(
                intval($value['writer_id']),
            );
            $list[$key] = $value;
            $list[$key]['writer_name'] = db_get_one($sql, $params);
        }
    }

    return $list;
}

//指定idのTodoを得る
function biz_getTodo($id)
{
    //メンバーが保有しているtodoid一覧
    $sql = 'SELECT * FROM biz_todo WHERE biz_todo_id = ?';

    $params = array(
        intval($id),
    );

    return db_get_row($sql, $params);
}

//カレンダー表示用期限付きTodoリストの取得
function biz_schedule_todo4c_member_id($u, $c_member_id, $year, $month, $day = null)
{
    $sql = 'SELECT biz_todo_id FROM biz_todo WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    $ids = db_get_col($sql, $params);
    $ids = implode(', ', $ids);
    if (!$ids) {
        return array();
    }

    if (!is_null($day)) {
        $sql = 'SELECT * FROM biz_todo WHERE biz_todo_id IN ('.$ids.')' .
                ' AND due_datetime = ?';
        $params = array(
            sprintf('%04d-%02d-%02d', intval($year), intval($month), intval($day)) . ' 00:00:00',
        );

        $list = array();
        foreach(db_get_all($sql, $params) as $key => $value) {
            if(biz_isPermissionTodo($u, $value['biz_todo_id'])) {
                $list[$key] = $value;
            }
        }

        return $list;
    } else {
        $sql = 'SELECT * FROM biz_todo WHERE biz_todo_id IN ('.$ids.')' .
                ' AND due_datetime > ? AND due_datetime <= ?';
        $max_day = date("t", mktime(0,0,0,intval($month),1,intval($year) ));
        $params = array(
            sprintf('%04d-%02d', intval($year), intval($month)) . '-01 00:00:00',
            sprintf('%04d-%02d', intval($year), intval($month)) . '-' . $max_day . ' 23:59:59'
        );
        $list = db_get_all($sql, $params);

        $res = array();
        foreach ($list as $item) {
            if(biz_isPermissionTodo($u, $item['biz_todo_id'])) {
                $day = date('j', strtotime($item['due_datetime']));
                $res[$day][] = $item;
            }
        }
        return $res;
    }
}

//自分が投稿したTodoの一覧を得る
function biz_getPostedTodo($id, $limit = null)
{

    $sql = 'SELECT * FROM biz_todo WHERE writer_id = ? ORDER BY r_datetime DESC';
    $params = array(
        intval($id),
    );

    if ($limit) {
        $tmp = db_get_all_limit($sql, 0, intval($limit), $params);
    } else {
        $tmp = db_get_all($sql, $params);
    }

    $list = array();
    foreach ($tmp as $key => $value) {
        if (!biz_isPermissionTodo($id, $value['biz_todo_id'])) {
            continue;
        }
        $list[$key] = $value;
        $sql = 'SELECT nickname FROM c_member WHERE c_member_id = ?';
        $params = array(
            intval($list[$key]['c_member_id']),
        );
        $list[$key]['member_name'] = db_get_one($sql, $params);
    }

    return $list;
}

//指定メンバーのstateを得る
function biz_getState($member_id)
{
    $sql = 'SELECT * FROM biz_state WHERE c_member_id = ?';
    $params = array(
        intval($member_id),
    );


    return db_get_row($sql, $params);
}

// 参加グループリスト
function biz_getJoinGroupList($c_member_id, $page, $page_size)
{
    $start = ($page - 1) * $page_size;

    $sql = "SELECT biz_group.*" .
            " FROM biz_group_member , biz_group";
    $sql .= " WHERE biz_group_member.c_member_id = ?";
    $sql .= " AND biz_group.biz_group_id=biz_group_member.biz_group_id";
    $sql .= " ORDER BY biz_group.biz_group_id DESC ";

    $params = array(
        intval($c_member_id),
    );

    $biz_group_list = db_get_all_limit($sql, $start, $page_size, $params);

    foreach ($biz_group_list as $key => $value) {
        $biz_group_list[$key]['count_members'] =
           count(biz_getGroupMember($value['biz_group_id']));
    }

    $pager = array(
        "total_num" => biz_getGroupCount($c_member_id),
        "disp_num"  => count($biz_group_list),
        "start_num" => 0,
        "end_num"   => 0,
        "total_page" => 0,
        "prev_page" => 0,
        "next_page" => 0,
    );

    if ($pager['disp_num'] > 0) {
        $pager['start_num'] = $start + 1;
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

    return array($biz_group_list, $pager);
}


//SET---------------------------------------------

//スケジュール登録
function biz_insertSchedule($title, $c_member_id, $begin_date, $finish_date, $begin_time = null, $finish_time = null,
                                                        $value = '', $rep_type, $first_id = 0,
                                                        $biz_group_id = 0, $public_flag = "public", $join_members = array())
{
    //登録値のセット、チェック
    if (!$value) {
        $value = '';
    }

    if (!$rep_type) {
        $rep_type = 0;
    }

    // 書き込み内に書いてあるURLがSNS内でありセッションパラメータを含んでいた場合は削除
    $title = db_ktai_delete_url_session_parameter($title);
    $value = db_ktai_delete_url_session_parameter($value);

    //biz_scheduleにデータを追加する
    $data = array(
        'title' => $title,
        'c_member_id' => intval($c_member_id),
        'begin_date' => $begin_date,
        'finish_date' => $finish_date,
        'begin_time' => $begin_time,
        'finish_time' => $finish_time,
        'value' => $value,
        'rep_type' => $rep_type,
        'rep_first' => $first_id,
        'biz_group_id' => $biz_group_id,
        'public_flag' => $public_flag,
    );
    $new_schedule_id = db_insert('biz_schedule', $data);

    // 参加者が指定されていない場合は、c_memberすべてが予定の参加者に
    if (empty($join_members)) {
        $sql = 'SELECT c_member_id FROM c_member';
        $join_members = db_get_col($sql);
    }
    foreach ($join_members as $value) {
        $data = array(
            'c_member_id' => $value,
            'biz_schedule_id' => $new_schedule_id,
            'is_read' => 0,
        );
        db_insert('biz_schedule_member', $data);
    }
}

//スケジュール削除
function biz_deleteSchedule($id)
{
    $sql = 'DELETE FROM biz_schedule WHERE biz_schedule_id = ?';
    $params = array(
        intval($id),
    );
    db_query($sql, $params);
    $sql = 'DELETE FROM biz_schedule_member WHERE biz_schedule_id = ?';
    $params = array(
        intval($id),
    );
    db_query($sql, $params);
}

//スケジュール編集
function biz_editSchedule($title, $member_id, $begin_date, $finish_date, $begin_time = null, $finish_time = null,
                                                    $value = '', $rep_type, $first_id = 0,
                                                    $biz_group_id = 0, $public_flag = "public",
                                                    $id, $join_members = array())
{
    $sql = 'UPDATE biz_schedule SET title = ?,c_member_id = ?,begin_date = ?,finish_date = ?,begin_time = ?,finish_time = ?,value = ?,rep_type = ?,rep_first = ?, biz_group_id = ?, public_flag = ?, is_read = 0 WHERE biz_schedule_id = ?';

    //登録値のセット、チェック
    if (!$value) {
        $value = '';
    }

    if (!$rep_type) {
        $rep_type = 0;
    }

    // 書き込み内に書いてあるURLがSNS内でありセッションパラメータを含んでいた場合は削除
    $title = db_ktai_delete_url_session_parameter($title);
    $value = db_ktai_delete_url_session_parameter($value);

    $params = array(
        $title,
        intval($member_id),
        $begin_date,
        $finish_date,
        $begin_time,
        $finish_time,
        $value,
        intval($rep_type),
        intval($first_id),
        intval($biz_group_id),
        $public_flag,
        intval($id),
    );
    db_query($sql, $params);

    $sql = 'DELETE FROM biz_schedule_member WHERE biz_schedule_id = ?';
    $params = array(
        intval($id),
    );
    db_query($sql, $params);

    foreach ($join_members as $value) {
        $data = array(
            'c_member_id' => $value,
            'biz_schedule_id' => intval($id),
            'is_read' => 0,
        );

        db_insert('biz_schedule_member', $data);
    }
}

//スケジュールを既読済みに
function biz_readSchedule($member_id, $schedule_id)
{
    $sql = 'SELECT biz_schedule_member_id FROM biz_schedule_member WHERE biz_schedule_id = ? AND c_member_id = ?';
    $params = array(
        intval($schedule_id),
        intval($member_id),
    );
    $sid = db_get_one($sql, $params);

    $sql = 'UPDATE biz_schedule_member SET is_read = \'1\' WHERE biz_schedule_member_id = ?';
    $params = array(
        intval($sid),
    );
    db_query($sql, $params);
}

//グループ登録
function biz_insertGroup($name, $member_id, $info, $image_name, $members = array())
{
    //登録値のセット、チェック
    if (!$image_name) {
        $image_name = '';
    }
    if (!$info) {
        $info = "";
    }
    if (empty($members)) {
        $members = array($member_id);
    }

    // 書き込み内に書いてあるURLがSNS内でありセッションパラメータを含んでいた場合は削除
    $name = db_ktai_delete_url_session_parameter($name);
    $info = db_ktai_delete_url_session_parameter($info);

    //biz_groupにデータを追加する
    $data = array(
        'name' => $name,
        'info' => $info,
        'admin_id' => intval($member_id),
        'image_filename' => $image_name,
    );
    $new_group_id = db_insert('biz_group', $data);

    foreach ($members as $key => $value) {
        $data = array(
            'c_member_id' => $value,
            'biz_group_id' => $new_group_id,
        );
        db_insert('biz_group_member', $data);
    }
}

function biz_editGroup($biz_group_id, $name, $member_id, $info, $image_name, $members = array())
{
    //登録値のセット、チェック
    if (!$image_name) {
        $image_name = 0;
    }

    if (!$info) {
        $info = "";
    }

    if (empty($members)) {
        $members = array($member_id);
    }

    // 書き込み内に書いてあるURLがSNS内でありセッションパラメータを含んでいた場合は削除
    $name = db_ktai_delete_url_session_parameter($name);
    $info = db_ktai_delete_url_session_parameter($info);

    //biz_groupにデータを追加する
    $sql = 'UPDATE biz_group SET name = ?,info = ?,image_filename = ? WHERE biz_group_id = ?';
    $params = array(
        $name,
        $info,
        $image_name,
        intval($biz_group_id),
    );
    db_query($sql, $params);

    $sql = 'DELETE FROM biz_group_member WHERE biz_group_id = ?';
    $params = array(
        intval($biz_group_id),
    );
    $result = db_query($sql, $params);

    foreach ($members as $key => $value) {
        $data = array(
            'c_member_id' => $value,
            'biz_group_id' => intval($biz_group_id),
        );
        db_insert('biz_group_member', $data);
    }
}

//グループの削除
function biz_deleteGroup($group_id, $c_member_id)
{
    // 画像削除
    $sql = 'SELECT image_filename FROM biz_group '
         . 'WHERE biz_group_id = ? ';
    $params = array(intval($group_id));
    $image_filename = db_get_one($sql, $params, 'main');
    db_image_data_delete($image_filename, $c_member_id);

    $sql = 'DELETE FROM biz_group_member WHERE biz_group_id = ?';
    $params = array(
        intval($group_id),
    );
    $result = db_query($sql, $params);
    $sql = 'DELETE FROM biz_group WHERE biz_group_id = ?';
    $params = array(
        intval($group_id),
    );    $result = db_query($sql, $params);


    $sql = 'UPDATE biz_schedule SET public_flag = "private", biz_group_id = NULL WHERE biz_group_id = ?';
    db_query($sql, array(intval($group_id)));

    $sql = 'DELETE FROM biz_todo WHERE biz_group_id = ?';
    db_query($sql, array(intval($group_id)));

}

//グループに参加
function biz_joinGroup($member_id, $group_id)
{
    $data = array(
        'c_member_id' => intval($member_id),
        'biz_group_id' => intval($group_id),
    );
    db_insert('biz_group_member', $data);
}

//施設追加
function biz_addShisetsu($name, $image_name, $info = '')
{
    if (!$image_name) {
        $image_name = '';
    }

    // 書き込み内に書いてあるURLがSNS内でありセッションパラメータを含んでいた場合は削除
    $name = db_ktai_delete_url_session_parameter($name);
    $info = db_ktai_delete_url_session_parameter($info);

    $data = array(
        'name' => $name,
        'image_filename' => $image_name,
        'info' => $info,
    );
    db_insert('biz_shisetsu', $data);
}

//施設編集
function biz_editShisetsu($id, $name, $image_name, $info = '')
{
    if (!$image_name) {
        $image_name = 0;
    }

    // 書き込み内に書いてあるURLがSNS内でありセッションパラメータを含んでいた場合は削除
    $name = db_ktai_delete_url_session_parameter($name);
    $info = db_ktai_delete_url_session_parameter($info);

    $sql = 'UPDATE biz_shisetsu SET name = ?,image_filename = ?, info = ? WHERE biz_shisetsu_id = ?';
    $params = array(
        $name,
        $image_name,
        $info,
        intval($id),
    );
    db_query($sql, $params);
}

//施設予定追加
function biz_addShisetsuSchedule($shisetsu_id, $member_id, $date, $begin_time, $finish_time)
{
    $data = array(
        'c_member_id' => intval($member_id),
        'biz_shisetsu_id' => intval($shisetsu_id),
        'date' => $date,
        'begin_time' => $begin_time,
        'finish_time' => $finish_time,
    );
    return db_insert('biz_shisetsu_schedule', $data);
}

//施設予定削除
function biz_deleteShisetsuSchedule($shisetsu_id)
{
    $sql = 'DELETE FROM biz_shisetsu_schedule WHERE biz_shisetsu_schedule_id = ?';
    $params = array(
        intval($shisetsu_id),
    );

    db_query($sql, $params);

    return $sql;
}

//Todo登録
function biz_insertTodo($member_id, $memo, $writer_id, $sort_order, $is_all,
    $due_datetime = '', $priority = 3, $biz_group_id = '', $public_flag = 'public')
{
    if ($is_all) {
        //共有Todo
        $member_id = 0;
    } elseif ($member_id == $writer_id) {
        $writer_name = '';
    }

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        if ($due_datetime == '') {
            $due_datetime = '0000-01-01';
        }

        if ($biz_group_id == '') {
            $biz_group_id = 0;
        }
    }

    $data = array(
        'c_member_id' => $member_id,
        'memo' => db_ktai_delete_url_session_parameter($memo),
        'is_check' => 0,
        'writer_id' => $writer_id,
        'sort_order' => $sort_order,
        'r_datetime' => date("Y-m-d H:i"),
        'due_datetime' => $due_datetime,
        'priority' => $priority,
        'biz_group_id' => $biz_group_id,
        'public_flag' => $public_flag,
    );
    return db_insert('biz_todo', $data);
}

//Todo登録
function biz_editTodo($member_id, $memo, $writer_id, $sort_order, $is_all, $biz_todo_id, $is_done, $due_datetime, $priority, $biz_group_id, $public_flag)
{
    $todo = biz_getTodo($biz_todo_id);

    if ($is_all) {
        //共有Todo
        $member_id = 0;
    } elseif ($member_id == $writer_id) {
        $writer_name = '';
    }

    if ($is_done != $todo['is_check']) {
        biz_checkTodo($biz_todo_id, $todo['is_check']);
    }

    $sql = 'UPDATE biz_todo SET c_member_id = ?, memo = ?, writer_id = ?,'
        .'r_datetime = ?, due_datetime = ?, priority = ?, biz_group_id = ?,'
        .'public_flag = ? WHERE biz_todo_id = ?';

    $params = array(
        intval($member_id),
        db_ktai_delete_url_session_parameter($memo),
        intval($writer_id),
        date("Y-m-d H:i"),
        $due_datetime,
        intval($priority),
        intval($biz_group_id),
        $public_flag,
        intval($biz_todo_id),
    );

    $result = db_query($sql, $params);

    return $result;
}

//Todo削除
function biz_deleteTodo($delid)
{
    //指定されたTodoを削除
    $sql = 'DELETE FROM biz_todo WHERE biz_todo_id = ?';

    $params = array(
        intval($delid),
    );

    $result = db_query($sql, $params);

    return $result;
}

//Todoにチェック
function biz_checkTodo($chid, $is_check)
{
    if ($is_check) {
    //チェックを解除する
        $sql = 'UPDATE biz_todo SET is_check = \'0\' WHERE biz_todo_id = ?';
    } else {
    //チェックをつける
        $sql = 'UPDATE biz_todo SET is_check = \'1\' WHERE biz_todo_id = ?';
    }

    $params = array(
        intval($chid),
    );

    $result = db_query($sql, $params);
}

//画像をDBに格納する
function biz_saveImage($upfile, $filename, $c_member_id = 0, $deletefile = '')
{
    if (!$upfile) {
        $image = array(
            'filename' => false,
            'up_size_chk_result' => 0,
        );
        return $image;
    }
    if (!$filename) {
        $image = array(
            'filename' => false,
            'up_size_chk_result' => 0,
        );
        return $image;
    }

    if (!t_check_image($upfile)) {
        $image = array(
            'filename' => false,
            'up_size_chk_result' => 0,
        );
        return $image;
    }

    $image = t_check_image($upfile);
    $filepath = $upfile["tmp_name"];

    $path_parts = pathinfo($upfile["name"]);
    $ext = $path_parts["extension"];
    $ext = strtolower($ext);
    $filename = $filename."_".time().".".$ext;

    $fp = fopen($filepath, "rb");
    $image_data = fread($fp, filesize($filepath));
    fclose($fp);

    // 画像かどうかのチェック
    if (!@imagecreatefromstring($image_data)) {
        $image = array(
            'filename' => false,
            'up_size_chk_result' => 0,
        );
        return $image;
    }

    // アップロード可能サイズかチェック
    if (!$deletefile) {
        // 画像追加
        $result = util_image_check_add_image_upload(filesize($filepath), $c_member_id, 'other');
        if ($result) {
            $image = array(
                'filename' => false,
                'up_size_chk_result' => $result,
            );
            return $image;
        }
    } else {
        // 画像置換
        $del_files = array($deletefile);
        $result = util_image_check_change_image_upload(filesize($filepath), $del_files, $c_member_id, 'other');
        if ($result) {
            $image = array(
                'filename' => false,
                'up_size_chk_result' => $result,
            );
            return $image;
        }
    }

    $image_data = base64_encode($image_data);
    $sql = "INSERT INTO c_image (filename, bin, r_datetime, type)" .
        " VALUES (?, ?, NOW(), ?)";

    $params = array(
        $filename,
        $image_data,
        $image['format'],
    );
    $result = db_query($sql, $params);;

    if ($result) {
        db_image_insert_c_image_size($filename, $c_member_id, filesize($filepath));
    }

    $image = array(
        'filename' => $filename,
        'up_size_chk_result' => 0,
    );

    return $image;
}

function biz_deleteImage($filename, $c_member_id)
{
    if (!$filename) {
        return false;
    }

    $sql = 'DELETE FROM c_image WHERE filename = ?';
    $params = array(
        $filename,
    );
    db_query($sql, $params);

    $sql = 'DELETE FROM c_image_size WHERE filename = ?';
    db_query($sql, $params);

    // cacheの削除
    image_cache_delete($filename);

    //function cacheの削除
    $category = util_image_filename2category($filename);
    pne_cache_drop('db_image_get_image_filesize', $c_member_id, $category);
}

function biz_deleteGroupImage($id, $filename, $c_member_id)
{
    $data = array('image_filename' => '');
    $where = array('biz_group_id' => intval($id));
    db_update('biz_group', $data, $where);

    biz_deleteImage($filename, $c_member_id);
}

function biz_deleteShisetsuImage($id, $filename, $c_member_id)
{
    $data = array('image_filename' => '');
    $where = array('biz_shisetsu_id' => intval($id));
    db_update('biz_shisetsu', $data, $where);

    biz_deleteImage($filename, $c_member_id);
}

function biz_changeNickname($member_id, $new)
{
    $sql = 'UPDATE c_member SET nickname = ? WHERE c_member_id = ?';
    $params = array(
        $new,
        intval($member_id),
    );
    $result = db_query($sql, $params);

    return $result;
}

//施設情報削除
//一緒に施設画像も削除
function biz_deleteShisetsu($id, $c_member_id)
{

    $shisetsu = biz_getShisetsuData($id);

    //画像削除
    biz_deleteShisetsuImage($id, $shisetsu['image_filename'], $c_member_id);

    $sql = 'DELETE FROM biz_shisetsu WHERE biz_shisetsu_id = ?';
    $params = array(
        intval($id),
    );

    db_query($sql, $params);
}

//-------------------------------
//admin

function biz_getConfig()
{
    $sql = "SELECT name, value FROM biz_admin_config";
    return db_get_assoc($sql);
}


function ktai_biz_openpne_redirect($module, $action = '', $params = array())
{
    if ($module == 'ktai_biz') {
        if (session_id()) {
            $params['ksid'] = session_id();
        }
    }
    $url = openpne_gen_url($module, $action, $params);
    client_redirect_absolute($url);
}

//------------------------------
//mail

/**
 * スケジュール通知メールを送信する
 */
function biz_do_common_send_schedule_mail()
{
    $y = date("Y");
    $m = date("m");
    $d = date("d");
    $c_schedule_list = biz_getDateSchedule($y, $m, $d);

    $send_list = array();
    foreach ($c_schedule_list as $schedule_id) {
        $value = biz_getScheduleInfo($schedule_id);
        $biz_schedule_member = biz_getJoinIdSchedule($value['biz_schedule_id']);
        foreach ($biz_schedule_member as $c_member_id) {
            $send_list[$c_member_id][] = $value;
        }
    }

    foreach ($send_list as $c_member_id => $c_schedule_list) {
        $c_member_secure = db_member_c_member_secure4c_member_id($c_member_id);
        if (!empty($c_member_secure['pc_address'])) {
            // PCメールアドレスがある場合は、PCのみ送信
            $pc_address = $c_member_secure['pc_address'];

            $params = array(
                'c_member' => db_member_c_member4c_member_id_LIGHT($c_member_id),
                'c_schedule_list' => $c_schedule_list,
            );
            fetch_send_mail($pc_address, 'm_pc_schedule_mail', $params);
        } else {
            // PCメールアドレスがない場合は、携帯のみ送信
            $ktai_address = $c_member_secure['ktai_address'];

            $p = array('kad' => t_encrypt(db_member_username4c_member_id($c_member_id, true)));
            $login_url = openpne_gen_url('ktai', 'page_o_login', $p);

            $params = array(
                'c_member' => db_member_c_member4c_member_id_LIGHT($c_member_id),
                'login_url' => $login_url,
                'c_schedule_list' => $c_schedule_list,
            );
            fetch_send_mail($ktai_address, 'm_ktai_schedule_mail', $params);
        }
    }
}

?>
