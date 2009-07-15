<?php
/**
 * @copyright 2005-2008 OpenPNE Project
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

function db_review_c_friend_review_list4c_member_id($c_member_id, $limit)
{
    $friends = db_friend_c_member_id_list($c_member_id, true);
    if (!$friends) {
        return array();
    }
    $ids = implode(',', array_map('intval', $friends));

    $sql = 'SELECT * FROM c_review INNER JOIN c_review_comment USING (c_review_id)'
         . ' WHERE c_review_comment.c_member_id IN (' . $ids . ')'
         . ' ORDER BY c_review_comment.r_datetime DESC';
    $list = db_get_all_limit($sql, 0, $limit);
    foreach ($list as $key => $value) {
        $list[$key] += db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
    }
    return $list;
}

function db_review_c_friend_review_list_more4c_member_id($c_member_id, $page, $page_size)
{
    $friends = db_friend_c_member_id_list($c_member_id, true);
    if (!$friends) {
        return array();
    }
    $ids = implode(',', array_map('intval', $friends));

    $sql = 'SELECT * FROM c_review INNER JOIN c_review_comment USING (c_review_id)'
         . ' WHERE c_review_comment.c_member_id IN (' . $ids . ')'
         . ' ORDER BY c_review_comment.r_datetime DESC';
    $list = db_get_all_page($sql, $page, $page_size, $params);
    foreach ($list as $key => $value) {
        $list[$key] += db_member_c_member4c_member_id_LIGHT($value['c_member_id']);
    }

    $sql = 'SELECT COUNT(*) FROM c_review_comment WHERE c_member_id IN (' . $ids . ')';
    $total_num = db_get_one($sql);

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

function db_review_new_commu_review4c_commu_id($c_commu_id , $limit)
{
    $sql = "SELECT ccr.c_review_id, cr.title, ccr.r_datetime" .
            " FROM c_commu_review AS ccr , c_review AS cr" .
            " WHERE ccr.c_review_id = cr.c_review_id" .
            " AND ccr.c_commu_id = ?".
            " ORDER BY ccr.r_datetime DESC";
    $params = array(intval($c_commu_id));
    return db_get_all_limit($sql, 0, $limit, $params);
}

function do_review_review_add_category_disp()
{
    $sql = 'SELECT c_review_category_id, category_disp FROM c_review_category';
    return db_get_assoc($sql);
}

function do_review_add_search_result($keyword, $category_id, $page)
{
    $sql = 'SELECT category FROM c_review_category WHERE c_review_category_id = ?';
    $params = array(intval($category_id));
    if (!$category = db_get_one($sql, $params)) {
        return null;
    }

    require_once 'OpenPNE/Amazon.php';
    $amazon =& new OpenPNE_Amazon(AMAZON_ACCESS_KEY_ID, AMAZON_SECRET_ACCESS_KEY, AMAZON_AFFID);
    $amazon->setLocale(AMAZON_LOCALE);
    $amazon->setBaseUrl(AMAZON_BASEURL);
    if (OPENPNE_USE_HTTP_PROXY) {
        $amazon->setProxy(OPENPNE_HTTP_PROXY_HOST, OPENPNE_HTTP_PROXY_PORT);
    }

    $options = array(
        'Keywords' => $keyword,
        'ItemPage' => $page,
        'ResponseGroup' => 'Large',
    );
    $products = $amazon->ItemSearch($category, $options);

    if (PEAR::isError($products)) {
        return null;
    }
    if (empty($products['Request']['IsValid']) || $products['Request']['IsValid'] !== 'True') {
        return null;
    }

    foreach ($products['Item'] as $key => $value) {
        if (is_array($value['ItemAttributes']['Author'])) {
            $authors = array_unique($value['ItemAttributes']['Author']);
            $products['Item'][$key]['author'] = implode(', ', $authors);
        }
        if (is_array($value['ItemAttributes']['Artist'])) {
            $artists = array_unique($value['ItemAttributes']['Artist']);
            $products['Item'][$key]['artist'] = implode(', ', $artists);
        }
    }

    $product_page = $products['Request']['ItemSearchRequest']['ItemPage'];
    $product_pages = $products['TotalPages'];
    $total_num = $products['TotalResults'];

    return array($products['Item'], $product_page, $product_pages, $total_num);
}

function db_review_write_product4asin($asin)
{
    require_once 'OpenPNE/Amazon.php';
    $amazon =& new OpenPNE_Amazon(AMAZON_ACCESS_KEY_ID, AMAZON_SECRET_ACCESS_KEY, AMAZON_AFFID);
    $amazon->setLocale(AMAZON_LOCALE);
    $amazon->setBaseUrl(AMAZON_BASEURL);
    if (OPENPNE_USE_HTTP_PROXY) {
        $amazon->setProxy(OPENPNE_HTTP_PROXY_HOST, OPENPNE_HTTP_PROXY_PORT);
    }
    $keyword = mb_convert_encoding($keyword, "UTF-8", "auto");

    $options = array();
    $options['ResponseGroup'] = 'Large';
    $result = $amazon->ItemLookup($asin, $options);
    if (PEAR::isError($result)) {
        return false;
    }
    if (empty($result['Request']['IsValid']) || $result['Request']['IsValid'] !== 'True') {
        return null;
    }

    $product  = $result['Item'][0];
    if (is_array($product['ItemAttributes']['Author'])) {
        $authors = array_unique($product['ItemAttributes']['Author']);
        $product['author'] = implode(', ', $authors);
    }
    if (is_array($product['ItemAttributes']['Artist'])) {
        $artists = array_unique($product['ItemAttributes']['Artist']);
        $product['artist'] = implode(', ', $artists);
    }

    return $product;
}

/**
 * orderby:
 *      r_datetime  => 作成順
 *      r_num       => 登録数順
 */
function db_review_search_result4keyword_category($keyword, $category_id , $orderby, $page = 1, $page_size = 30)
{
    $from = " FROM c_review INNER JOIN c_review_comment USING (c_review_id)";

    $wheres = array();
    $params = array();
    if ($keyword) {
        $wheres[] = 'c_review.title LIKE ?';
        $params[] = '%'.check_search_word($keyword).'%';
    }
    if ($category_id) {
        $wheres[] = 'c_review.c_review_category_id = ?';
        $params[] = intval($category_id);
    }
    if ($wheres) {
        $where = ' WHERE ' . implode(' AND ', $wheres);
    } else {
        $where = '';
    }

    switch ($orderby) {
    case "r_datetime":
    default:
        $order = " ORDER BY r_datetime2 DESC";
        break;
    case "r_num":
        $order = " ORDER BY write_num DESC, r_datetime2 DESC";
        break;
    }

    if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
        $group = " GROUP BY c_review.c_review_id" .
                ", c_review.title" .
                ", c_review.release_date" .
                ", c_review.manufacturer" .
                ", c_review.author" .
                ", c_review.c_review_category_id" .
                ", c_review.image_small" .
                ", c_review.image_medium" .
                ", c_review.image_large" .
                ", c_review.url" .
                ", c_review.asin" .
                ", c_review.list_price" .
                ", c_review.retail_price" .
                ", c_review.r_datetime";
    } else {
        $group = " GROUP BY c_review.c_review_id";
    }
    $sql = "SELECT" .
            " c_review.*" .
            ", MAX(c_review_comment.r_datetime) as r_datetime2" .
            ", COUNT(c_review_comment.c_review_comment_id) AS write_num" .
        $from .
        $where .
        $group .
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

function db_review_list_product_c_review4c_review_id($c_review_id)
{
    $sql = 'SELECT * FROM c_review AS cr, c_review_category AS crc' .
           ' WHERE cr.c_review_category_id = crc.c_review_category_id' .
           ' AND c_review_id = ?';
    $params = array(intval($c_review_id));
    return db_get_row($sql, $params);
}

function db_review_list_product_c_review_list4c_review_id($c_review_id, $page, $page_size=30)
{
    $sql = "SELECT crc.*, cm.c_member_id, cm.nickname, cm.image_filename" .
           " FROM c_review_comment AS crc, c_member AS cm" .
           " WHERE crc.c_member_id = cm.c_member_id" .
           " AND c_review_id = ?" .
           " ORDER BY r_datetime desc";
    $params = array(intval($c_review_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    $total_num = db_review_count_c_review_comment4c_review_id($c_review_id);
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

function db_review_list_product_c_review_list4c_member_id($c_member_id, $page, $page_size=30)
{
    $sql = "SELECT cr.*, crc.*, crc2.category_disp" .
            " FROM c_review_comment AS crc, c_review AS cr, c_review_category AS crc2" .
            " WHERE crc.c_review_id = cr.c_review_id" .
            " AND cr.c_review_category_id = crc2.c_review_category_id" .
            " AND crc.c_member_id = ?" .
            " ORDER BY crc.r_datetime DESC";
    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    foreach ($list as $key => $value) {
        $list[$key]['write_num'] = db_review_count_c_review_comment4c_review_id($value['c_review_id']);
    }

    $sql = "SELECT COUNT(*) FROM c_review_comment WHERE c_member_id = ?";
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

function db_review_add_write_c_review_comment4asin_c_member_id($asin, $c_member_id)
{
    $sql = "SELECT * FROM c_review AS cr, c_review_comment AS crc" .
            " WHERE cr.c_review_id = crc.c_review_id" .
            " AND cr.asin = ?" .
            " AND crc.c_member_id = ?";
    $params = array($asin, intval($c_member_id));
    return db_get_row($sql, $params);
}

function db_review_clip_list_h_review_clip_list4c_member_id($c_member_id, $page, $page_size=30)
{
    $sql = "SELECT * FROM c_review AS cr, c_review_clip AS crc" .
            " WHERE crc.c_review_id = cr.c_review_id" .
            " AND c_member_id = ?" .
            " ORDER BY crc.r_datetime";
    $params = array(intval($c_member_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    //カテゴリの表示名を取得
    $category_disp = do_review_review_add_category_disp();

    //$lstに書き込み数 + カテゴリ名　を追加
    foreach ($list as $key => $value) {
        $list[$key]['write_num'] = db_review_count_c_review_comment4c_review_id($value['c_review_id']);
        $list[$key]['category_disp'] = $category_disp[$value['c_review_category_id']];
    }

    $sql = "SELECT COUNT(*) FROM c_review_clip WHERE c_member_id = ?";
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

function db_review_c_member_review_c_member_review4c_commu_id($c_commu_id, $page, $page_size=20)
{
    $sql = " SELECT cr.*, ccr.*, crc.category_disp " .
            " FROM c_commu_review as ccr, c_review as cr, c_review_category as crc" .
            " WHERE ccr.c_review_id = cr.c_review_id" .
            " AND cr.c_review_category_id = crc.c_review_category_id" .
            " AND ccr.c_commu_id =  ?" .
            " ORDER BY ccr.r_datetime";
    $params = array(intval($c_commu_id));
    $list = db_get_all_page($sql, $page, $page_size, $params);

    $sql = "SELECT COUNT(*) FROM c_commu_review WHERE c_commu_id = ?";
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

function db_review_c_member_review_add_confirm_c_member_review4c_review_id($c_review_id, $c_member_id)
{
    if (!$c_review_id) {
        return array();
    }
    $c_review_id_str = implode(',', array_map('intval', $c_review_id));
    $sql = "SELECT * FROM c_review as cr, c_review_comment as crc , c_review_category as crc2 " .
            " WHERE cr.c_review_id = crc.c_review_id " .
            " AND cr.c_review_category_id = crc2.c_review_category_id " .
            " AND crc.c_member_id = ?".
            " AND cr.c_review_id IN (".$c_review_id_str.")";
    $params = array(intval($c_member_id));
    return db_get_all($sql, $params);
}

function db_review_c_review_add_c_review_category_id4category($category)
{
    $sql = "SELECT c_review_category_id FROM c_review_category WHERE category = ?";
    $params = array($category);
    return db_get_one($sql, $params);
}

function db_review_edit_c_review_comment4c_review_comment_id_c_member_id($c_review_comment_id, $c_member_id)
{
    $sql = "SELECT * FROM c_review_comment " .
            " WHERE c_review_comment_id = ?" .
            " AND c_member_id = ?";
    $params = array(intval($c_review_comment_id), intval($c_member_id));
    return db_get_row($sql, $params);
}

function db_review_edit_c_review_comment4c_review_comment_id($c_review_comment_id)
{
    $sql = 'SELECT * FROM c_review_comment WHERE c_review_comment_id = ?';
    $params = array(intval($c_review_comment_id));
    return db_get_row($sql, $params);
}

function db_review_clip_add_c_review_id4c_review_id_c_member_id($c_review_id, $c_member_id)
{
    $sql = "SELECT c_review_clip_id FROM c_review_clip" .
            " WHERE c_review_id = ?" .
            " AND c_member_id = ?";
    $params = array(intval($c_review_id), intval($c_member_id));
    return db_get_one($sql, $params);
}

function db_review_c_member_review_c_review_id4c_review_id_c_member_id($c_review_id, $c_member_id, $c_commu_id)
{
    $sql = "SELECT c_commu_review_id FROM c_commu_review" .
            " WHERE c_commu_id = ?" .
            " AND c_review_id = ?" .
            " AND c_member_id = ?";
    $params = array(intval($c_commu_id), intval($c_review_id), intval($c_member_id));
    return db_get_one($sql, $params);
}

function db_review_edit_c_review4c_review_comment_id($c_review_comment_id)
{
    $sql = "SELECT c_review.* FROM c_review, c_review_comment" .
        " WHERE c_review_comment.c_review_comment_id=?".
        " AND c_review_comment.c_review_id=c_review.c_review_id";
    $params = array(intval($c_review_comment_id));
    return db_get_row($sql, $params);
}

function db_review_common_c_review_id4c_review_comment_id($c_review_comment_id)
{
    $sql = 'SELECT c_review_id FROM c_review_comment WHERE c_review_comment_id = ?';
    $params = array(intval($c_review_comment_id));
    return db_get_one($sql, $params);
}

function db_review_count_c_review_comment4c_review_id($c_review_id)
{
    $sql = 'SELECT COUNT(*) FROM c_review_comment WHERE c_review_id = ?';
    $params = array(intval($c_review_id));
    return db_get_one($sql, $params);
}


/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function do_c_review_add_insert_c_review($product, $c_review_category_id)
{
    $sql = 'SELECT c_review_id FROM c_review WHERE asin = ?';
    $params = array($product['ASIN']);
    if ($c_review_id = db_get_one($sql, $params)) {
        return $c_review_id;
    }

    $data = array(
        'title'        => $product['ItemAttributes']['Title'],
        'release_date' => $product['ItemAttributes']['PublicationDate'],
        'manufacturer' => $product['ItemAttributes']['Manufacturer'],
        'author'       => $product['author'],
        'c_review_category_id' => intval($c_review_category_id),
        'image_small'  => $product['SmallImage']['URL'],
        'image_medium' => $product['MediumImage']['URL'],
        'image_large'  => $product['LargeImage']['URL'],
        'url'          => $product['DetailPageURL'],
        'asin'         => $product['ASIN'],
        'list_price'   => $product['ListPrice']['FormattedPrice'],
        'retail_price' => $product['OfferSummary']['LowestUsedPrice']['FormattedPrice'],
        'r_datetime'   => db_now(),
    );

    //TODO:暫定処理
    foreach ($data as $key => $value) {
        if (is_null($value)) {
            $data[$key] = '';
        }
    }
    return db_insert('c_review', $data);
}

function do_c_review_add_insert_c_review_comment($c_review_id , $c_member_id, $body, $satisfaction_level)
{
    $data = array(
        'c_review_id' => intval($c_review_id),
        'c_member_id' => intval($c_member_id),
        'body' => $body,
        'satisfaction_level' => intval($satisfaction_level),
        'r_datetime' => db_now(),
        'u_datetime' => db_now(),
    );
    return db_insert('c_review_comment', $data);
}

function do_h_review_edit_update_c_review_comment($c_review_comment_id, $body, $satisfaction_level)
{
    $data = array(
        'body' => $body,
        'satisfaction_level' => intval($satisfaction_level),
        'u_datetime' => db_now(),
    );
    $where = array('c_review_comment_id' => intval($c_review_comment_id));
    return db_update('c_review_comment', $data, $where);
}

function do_h_review_edit_delete_c_review_comment($c_review_comment_id)
{
    $sql = 'DELETE FROM c_review_comment WHERE c_review_comment_id = ?';
    $params = array(intval($c_review_comment_id));
    db_query($sql, $params);
}

function do_h_review_clip_add_insert_c_review_clip($c_review_id, $c_member_id)
{
    $data = array(
        'c_member_id' => intval($c_member_id),
        'c_review_id' => intval($c_review_id),
        'r_datetime' => db_now(),
    );
    return db_insert('c_review_clip', $data);
}

function do_c_member_review_insert_c_commu_review($c_review_id, $c_member_id, $c_commu_id)
{
    $data = array(
        'c_commu_id' => intval($c_commu_id),
        'c_review_id' => intval($c_review_id),
        'c_member_id' => intval($c_member_id),
        'r_datetime' => db_now(),
    );
    return db_insert('c_commu_review', $data);
}

function do_h_review_clip_list_delete_c_review_clip($c_member_id , $c_review_clips)
{
    if (!is_array($c_review_clips)) {
        return false;
    }
    $ids = implode(',', array_map('intval', $c_review_clips));

    $sql = 'DELETE FROM c_review_clip WHERE c_member_id = ?' .
            ' AND c_review_id IN ('.$ids.')';
    $params = array(intval($c_member_id));
    return db_query($sql, $params);
}

function do_delete_c_review4c_review_id($c_review_id)
{
    $params = array(intval($c_review_id));

    // c_review
    $sql = 'DELETE FROM c_review WHERE c_review_id = ?';
    db_query($sql, $params);

    // c_review_clip
    $sql = 'DELETE FROM c_review_clip WHERE c_review_id = ?';
    db_query($sql, $params);

    // c_commu_review
    $sql = 'DELETE FROM c_commu_review WHERE c_review_id = ?';
    db_query($sql, $params);
}

//コミュニティのおすすめレビューを削除
function db_review_delete_c_review4c_review_id($c_review_id)
{
    $sql = 'DELETE FROM c_review WHERE c_review_id = ?';
    $params = array(intval($c_review_id));
    db_query($sql, $params);
}

//コミュニティのおすすめレビューを削除
function db_review_delete_c_commu_review4c_commu_review_id($c_commu_review_id)
{
    $sql = 'DELETE FROM c_commu_review WHERE c_commu_review_id = ?';
    $params = array(intval($c_commu_review_id));
    db_query($sql, $params);
}

//コミュニティのおすすめレビューを取得(一つ)
function db_review_get_c_commu_review_one4c_commu_review_id($c_commu_review_id)
{
    $sql = 'SELECT * FROM c_commu_review WHERE c_commu_review_id = ?';
    $params = array(intval($c_commu_review_id));
    return db_get_row($sql, $params);
}

function db_review_c_review_id4asin($asin)
{
    $sql = 'SELECT c_review_id FROM c_review'
         . ' WHERE asin = ?';
    return db_get_one($sql, array($asin));
 }

function db_review_update_old_c_review($c_review_id)
{
    $timestamp = date('Y-m-d H:i:s', strtotime('-1 month'));
    $sql = 'SELECT * FROM c_review'
         . ' WHERE c_review_id = ?'
         . ' AND r_datetime < ?';
    $params = array(intval($c_review_id), $timestamp);
    $c_review = db_get_row($sql, $params);

    if ($c_review) {
        $asin = $c_review['asin'];
        $product = db_review_write_product4asin($asin);
        if ($product) {
            $data = array(
                'title'        => $product['ItemAttributes']['Title'],
                'release_date' => $product['ItemAttributes']['PublicationDate'],
                'manufacturer' => $product['ItemAttributes']['Manufacturer'],
                'author'       => $product['author'],
                'image_small'  => $product['SmallImage']['URL'],
                'image_medium' => $product['MediumImage']['URL'],
                'image_large'  => $product['LargeImage']['URL'],
                'url'          => $product['DetailPageURL'],
                'asin'         => $product['ASIN'],
                'list_price'   => $product['ListPrice']['FormattedPrice'],
                'retail_price' => $product['OfferSummary']['LowestUsedPrice']['FormattedPrice'],
                'r_datetime'   => db_now(),
            );

            foreach ($data as $key => $value) {
                if (is_null($value)) {
                    $data[$key] = '';
                }
            }
            $where = array('c_review_id' => intval($c_review_id));
            db_update('c_review', $data, $where);
        }
    }
}
?>
