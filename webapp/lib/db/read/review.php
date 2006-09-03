<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_review_c_review_list4member($c_member_id, $count = 10)
{
    $sql = 'SELECT rev.c_review_id, rev.title, com.r_datetime' .
        ' FROM c_review_comment AS com LEFT JOIN c_review AS rev USING(c_review_id)' .
        ' WHERE com.c_member_id = ? ORDER BY com.r_datetime DESC';
    $params = array(intval($c_member_id));
    return db_get_all_limit($sql, 0, $count, $params);
}

function p_h_home_c_friend_review_list4c_member_id($c_member_id, $limit)
{
    $friends = db_friend_c_member_id_list($c_member_id);
    $ids = implode(',', array_map('intval', $friends));

    $sql = 'SELECT * FROM c_review INNER JOIN c_review_comment USING (c_review_id)' .
            ' WHERE c_review_comment.c_member_id IN ('.$ids.')' .
            ' ORDER BY c_review_comment.r_datetime DESC';
    $list = db_get_all_limit($sql, 0, $limit);
    foreach ($list as $key => $value) {
        $list[$key] += db_common_c_member4c_member_id_LIGHT($value['c_member_id']);
    }
    return $list;
}

function p_h_home_c_friend_review_list_more4c_member_id($c_member_id, $page, $page_size)
{
    $sql =  "select cm.nickname, cr.c_review_id, cr.title, crc.r_datetime " .
            " from  c_member as cm, c_friend as cf, c_review as cr, c_review_comment as crc " .
            " where cr.c_review_id = crc.c_review_id " .
            " and cf.c_member_id_to = crc.c_member_id " .
            " and cf.c_member_id_to = cm.c_member_id " .
            " and cf.c_member_id_from = ?".
            " order by crc.r_datetime desc";
    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    $sql =  "select count(*) " .
            " from  c_friend as cf, c_review_comment as crc " .
            " where cf.c_member_id_to = crc.c_member_id " .
            " and cf.c_member_id_from = ?";
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

    return array($list, $prev, $next, $total_num, $start_num, $end_num);
}

function p_c_home_new_commu_review4c_commu_id($c_commu_id , $limit)
{
    $sql = "select ccr.c_review_id, cr.title, ccr.r_datetime " .
            " from c_commu_review as ccr , c_review as cr " .
            " where ccr.c_review_id = cr.c_review_id " .
            " and ccr.c_commu_id = ?".
            " order by ccr.r_datetime desc";
    $params = array(intval($c_commu_id));
    return db_get_all_limit($sql, 0, $limit, $params);
}

function p_h_review_add_category_disp()
{
    $sql = 'SELECT c_review_category_id, category_disp FROM c_review_category';
    return db_get_assoc($sql);
}

function p_h_review_add_search_result($keyword, $category_id, $page)
{
    $sql = 'SELECT category FROM c_review_category WHERE c_review_category_id = ?';
    $params = array(intval($category_id));
    if (!$category = db_get_one($sql, $params)) {
        return null;
    }

    include_once 'Services/Amazon.php';
    $amazon =& new Services_Amazon(AMAZON_TOKEN, AMAZON_AFFID, AMAZON_LOCALE, AMAZON_BASEURL);
    $products = $amazon->searchKeyword($keyword, $category, $page);
    if (PEAR::isError($products)) {
        return null;
    }
    if (empty($products['totalresults'])) {
        return null;
    }

    foreach ($products as $key => $value) {
        if (is_array($value['authors'])) {
            $authors = array_unique($value['authors']);
            $products[$key]['author'] = implode(', ', $authors);
        }
        if (is_array($value['artists'])) {
            $artists = array_unique($value['artists']);
            $products[$key]['artist'] = implode(', ', $artists);
        }
    }

    $product_page = $products['page'];
    $product_pages = $products['pages'];
    $total_num = $products['totalresults'];
    unset($products[0]);
    unset($products['page']);
    unset($products['pages']);
    unset($products['totalresults']);

    return array($products, $product_page, $product_pages, $total_num);
}

function p_h_review_write_product4asin($asin)
{
    include_once 'Services/Amazon.php';
    $amazon =& new Services_Amazon(AMAZON_TOKEN, AMAZON_AFFID, AMAZON_LOCALE, AMAZON_BASEURL);
    $keyword = mb_convert_encoding($keyword, "UTF-8", "auto");

    $result = $amazon->searchAsin($asin);
    $product  =$result[1];
    if ($result[1]['authors']) {
        $product['author'] = implode(',', $result[1]['authors']);
    }

    foreach ($product as $key => $value) {
        $product[$key] = mb_convert_encoding($value, 'UTF-8', 'auto');
    }

    return $product;
}

/**
 * orderby:
 *      r_datetime  => 作成順
 *      r_num       => 登録数順
 */
function p_h_review_search_result4keyword_category($keyword, $category_id , $orderby, $page = 1, $page_size = 30)
{
    $from = " FROM c_review INNER JOIN c_review_comment USING (c_review_id)";

    $where = ' WHERE 1';
    $params = array();
    if ($keyword) {
        $where .= ' AND c_review.title LIKE ?';
        $params[] = '%'.check_search_word($keyword).'%';
    }
    if ($category_id) {
        $where .= ' AND c_review.c_review_category_id = ?';
        $params[] = intval($category_id);
    }

    switch ($orderby) {
    case "r_datetime":
    default:
        $order = " ORDER BY r_datetime DESC";
        break;
    case "r_num":
        $order = " ORDER BY write_num DESC, r_datetime DESC";
        break;
    }

    $sql = "SELECT" .
            " c_review.*" .
            ", MAX(c_review_comment.r_datetime) as r_datetime" .
            ", COUNT(c_review_comment.c_review_comment_id) AS write_num" .
        $from .
        $where .
        " GROUP BY c_review.c_review_id" .
        $order;

    $lst = db_get_all_page($sql, $page, $page_size, $params);

    //$lstに書き込み数を追加 + レビュー書き込み内容と日付を追加
    foreach ($lst as $key => $value) {
        $sql = "SELECT body FROM c_review_comment" .
            " WHERE c_review_id = ?" .
            " ORDER BY r_datetime DESC";
        $p2 = array(intval($value['c_review_id']));
        $lst[$key]['body'] = db_get_one($sql, $p2);
    }

    $sql = "SELECT COUNT(DISTINCT c_review.c_review_id)" . $from . $where;
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

    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num   = ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($lst, $prev, $next, $total_num, $start_num, $end_num);
}

function p_h_review_list_product_c_review4c_review_id($c_review_id)
{
    $sql = "select * from c_review as cr, c_review_category as crc " .
            " where cr.c_review_category_id = crc.c_review_category_id " .
            " and c_review_id = ?";
    $params = array(intval($c_review_id));
    return db_get_row($sql, $params);
}

function p_h_review_list_product_c_review_list4c_review_id($c_review_id, $page, $page_size=30)
{
    $sql = "select crc.*, cm.c_member_id, cm.nickname, cm.image_filename from c_review_comment as crc , c_member as cm" .
            " where crc.c_member_id = cm.c_member_id " .
            " and c_review_id = ?" .
            " order by r_datetime desc ";
    $params = array(intval($c_review_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    $sql = "select count(*) from c_review_comment where c_review_id = ?";
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

    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num   = ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($list, $prev, $next, $total_num, $start_num, $end_num);
}

function p_fh_review_list_product_c_review_list4c_member_id($c_member_id, $page, $page_size=30)
{
    $sql = "select crc.*, cr.* , crc2.category_disp " .
            " from c_review_comment as crc , c_review as cr , c_review_category as crc2 " .
            " where crc.c_review_id = cr.c_review_id " .
            " and cr.c_review_category_id = crc2.c_review_category_id " .
            " and crc.c_member_id = ?" .
            " order by crc.r_datetime desc";
    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    //それぞれのレビューの書き込み数を取得
    $sql = "select c_review_id , count(*) as num from c_review_comment " .
            " group by c_review_id ";
    $temp = db_get_all($sql);
    $write_num = array();
    foreach ($temp as $key => $value) {
        $write_num[$value['c_review_id']] = $value['num'];
    }

    //$lstに書き込み数を追加
    foreach ($list as $key => $value) {
        $list[$key]['write_num'] = $write_num[$value['c_review_id']];
    }

    $sql = "select count(*) from c_review_comment where c_member_id = ?";
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

    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num   = ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($list, $prev, $next, $total_num, $start_num, $end_num);
}

function p_h_review_add_write_c_review_comment4asin_c_member_id($asin, $c_member_id)
{
    $sql = "select * from c_review as cr, c_review_comment as crc " .
            " where cr.c_review_id = crc.c_review_id " .
            " and cr.asin = ?" .
            " and crc.c_member_id = ?";
    $params = array($asin, intval($c_member_id));
    return db_get_row($sql, $params);
}

function p_h_review_clip_list_h_review_clip_list4c_member_id($c_member_id, $page, $page_size=30)
{
    $sql = "select * from c_review_clip as crc , c_review as cr " .
            " where crc.c_review_id = cr.c_review_id" .
            " and c_member_id = ?" .
            " order by crc.r_datetime";
    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    //それぞれのレビューの書き込み数を取得
    $sql = "select c_review_id , count(*) as num from c_review_comment " .
            " group by c_review_id ";
    $temp = db_get_all($sql);
    $write_num = array();
    foreach ($temp as $key => $value) {
        $write_num[$value['c_review_id']] = $value['num'];
    }

    //カテゴリの表示名を取得
    $category_disp = p_h_review_add_category_disp();

    //$lstに書き込み数 + カテゴリ名　を追加
    foreach ($list as $key => $value) {
        $list[$key]['write_num'] = $write_num[$value['c_review_id']];
        $list[$key]['category_disp'] = $category_disp[$value['c_review_category_id']];
    }

    $sql = "select count(*) from c_review_clip where c_member_id = ?";
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

    $start_num = ($page - 1) * $page_size + 1 ;
    $end_num   = ($page - 1) * $page_size + $page_size > $total_num ? $total_num : ($page - 1) * $page_size + $page_size ;

    return array($list, $prev, $next, $total_num, $start_num, $end_num);
}

function p_c_member_review_c_member_review4c_commu_id($c_commu_id, $page, $page_size=20)
{
    $sql = " select cr.*, ccr.*, crc.category_disp " .
            " from c_commu_review as ccr, c_review as cr , c_review_category as crc" .
            " where ccr.c_review_id = cr.c_review_id " .
            " and cr.c_review_category_id = crc.c_review_category_id " .
            " and ccr.c_commu_id =  ?" .
            " order by ccr.r_datetime";
    $params = array(intval($c_commu_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    $sql = "select count(*) from c_commu_review where c_commu_id = ?";
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

    return array($list, $prev, $next, $total_num, $start_num, $end_num);
}

function c_member_review_add_confirm_c_member_review4c_review_id($c_review_id, $c_member_id)
{
    $c_review_id_str = implode(',', array_map('intval', $c_review_id));
    $sql = "select * from c_review as cr, c_review_comment as crc , c_review_category as crc2 " .
            " where cr.c_review_id = crc.c_review_id " .
            " and cr.c_review_category_id = crc2.c_review_category_id " .
            " and crc.c_member_id = ?".
            " and cr.c_review_id in (".$c_review_id_str.")";
    $params = array(intval($c_member_id));
    return db_get_all($sql, $params);
}

function do_c_review_add_c_review_category_id4category($category)
{
    $sql = "select c_review_category_id from c_review_category where category = ?";
    $params = array($category);
    return db_get_one($sql, $params);
}

function do_h_review_edit_c_review_comment4c_review_comment_id_c_member_id($c_review_comment_id, $c_member_id)
{
    $sql = "select * from c_review_comment " .
            " where c_review_comment_id = ?" .
            " and c_member_id = ?";
    $params = array(intval($c_review_comment_id), intval($c_member_id));
    return db_get_row($sql, $params);
}

function do_h_review_clip_add_c_review_id4c_review_id_c_member_id($c_review_id, $c_member_id)
{
    $sql = "select c_review_clip_id from c_review_clip " .
            " where c_review_id = ?" .
            " and c_member_id = ?";
    $params = array(intval($c_review_id), intval($c_member_id));
    return db_get_one($sql, $params);
}

function do_c_member_review_c_review_id4c_review_id_c_member_id($c_review_id, $c_member_id, $c_commu_id)
{
    $sql = "select c_commu_review_id from c_commu_review " .
            " where c_commu_id = ?" .
            " and c_review_id = ?" .
            " and c_member_id = ?";
    $params = array(intval($c_commu_id), intval($c_review_id), intval($c_member_id));
    return db_get_one($sql, $params);
}

function do_h_review_edit_c_review4c_review_comment_id($c_review_comment_id)
{
    $sql = "SELECT c_review.* FROM c_review, c_review_comment" .
        " WHERE c_review_comment.c_review_comment_id=?".
        " AND c_review_comment.c_review_id=c_review.c_review_id";
    $params = array(intval($c_review_comment_id));
    return db_get_row($sql, $params);
}

function do_common_c_review_id4c_review_comment_id($c_review_comment_id)
{
    $sql = 'SELECT c_review_id FROM c_review_comment WHERE c_review_comment_id = ?';
    $params = array(intval($c_review_comment_id));
    return db_get_one($sql, $params);
}

function do_common_count_c_review_comment4c_review_id($c_review_id)
{
    $sql = 'SELECT COUNT(*) FROM c_review_comment WHERE c_review_id = ?';
    $params = array(intval($c_review_id));
    return db_get_one($sql, $params);
}

?>
