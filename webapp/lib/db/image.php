<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_image_c_image4c_image_id($c_image_id)
{
    $db =& db_get_instance('image');

    $sql = 'SELECT * FROM c_image WHERE c_image_id = ?';
    $params = array(intval($c_image_id));
    return $db->get_row($sql, $params);
}

function db_image_is_c_image4filename($filename)
{
    if (!$filename) return false;

    $db =& db_get_instance('image');

    $sql = 'SELECT c_image_id FROM c_image WHERE filename = ?';
    $params = array($filename);
    return (bool)$db->get_one($sql, $params);
}

function db_image_c_image_list($page, $page_size, &$pager)
{
    $db =& db_get_instance('image');

    $sql = 'SELECT c_image_id FROM c_image ORDER BY c_image_id DESC';
    $id_list = $db->get_col_page($sql, $page, $page_size);

    $c_image_list = array();
    foreach ($id_list as $c_image_id) {
        $sql = 'SELECT c_image_id, filename, r_datetime FROM c_image WHERE c_image_id = ?';
        $params = array(intval($c_image_id));
        $c_image_list[] = $db->get_row($sql, $params);
    }

    $sql = 'SELECT COUNT(*) FROM c_image';
    $total_num = $db->get_one($sql);

    $pager = util_make_pager($page, $page_size, $total_num);
    return $c_image_list;
}

/**
 * ファイル名から一時保存ファイルを取得
 */
function db_image_c_tmp_image4filename($filename)
{
    $sql = 'SELECT * FROM c_tmp_image WHERE filename = ?';
    $params = array($filename);
    return db_get_row($sql, $params, 'main');
}

/*** write ***/

function db_image_insert_c_image($filename, $bin, $filesize, $c_member_id, $category ='', $type = '')
{
    $db =& db_get_instance('image');

    $data = array(
        'filename'   => $filename,
        'bin'        => base64_encode($bin),
        'type'       => $type,
        'r_datetime' => db_now(),
    );
    $result = $db->insert('c_image', $data, 'c_image_id');
    if ($result) {
        db_image_insert_c_image_size($filename, $c_member_id, $filesize, $category);
    }
    return $result;
}

function db_image_delete_c_image($filename, $c_member_id)
{
    $db =& db_get_instance('image');

    $sql = 'DELETE FROM c_image WHERE filename = ?';
    $params = array($filename);
    $db->query($sql, $params);

    $sql = 'DELETE FROM c_image_size WHERE filename = ?';
    $params = array($filename);
    $db->query($sql, $params);

    //function cacheの削除
    $category = util_image_filename2category($filename);
    pne_cache_drop('db_image_get_image_filesize', $c_member_id, $category);

    return true;
}

//---

function db_image_insert_c_image2($filename, $filepath, $c_member_id = 0, $category = '')
{
    if (!is_readable($filepath)) return false;

    $fp = fopen($filepath, 'rb');
    $image_data = fread($fp, filesize($filepath));
    fclose($fp);

    // 画像かどうかのチェック
    if (!@imagecreatefromstring($image_data)) return false;

    //TODO:typeフィールドを使う
    return db_image_insert_c_image($filename, $image_data, filesize($filepath), $c_member_id, $category);
}

function db_image_data_delete($image_filename, $c_member_id = 0)
{
    if (!$image_filename) return false;

    db_image_delete_c_image($image_filename, $c_member_id);

    // cacheの削除
    image_cache_delete($image_filename);
}

//---

function db_image_insert_c_tmp_image($filename, $filepath)
{
    if (!is_readable($filepath)) {
        return false;
    }

    $fp = fopen($filepath, 'rb');
    $image_data = fread($fp, filesize($filepath));
    fclose($fp);

    // 画像かどうかのチェック
    if (!@imagecreatefromstring($image_data)) {
        return false;
    }

    $sql = 'DELETE FROM c_tmp_image WHERE filename = ?';
    $params = array($filename);
    db_query($sql, $params);

    $image_data = base64_encode($image_data);
    $params = array(
        'filename' => $filename,
        'bin' => $image_data,
        'r_datetime' => db_now(),
        'filesize' => filesize($filepath),
    );

    return db_insert('c_tmp_image', $params);
}

function db_image_clear_tmp_db($uid)
{
    $sql = 'DELETE FROM c_tmp_image WHERE filename LIKE ?';
    $params = array('%_' . $uid . '.%');
    db_query($sql, $params);
}

function db_image_data_copy($filename, $new_filename, $c_member_id, $filesize)
{
    if (!$filename) return false;

    $db =& db_get_instance('image');

    $sql = 'SELECT * FROM c_image WHERE filename = ?';
    $params = array($filename);
    $c_image[] = $db->get_row($sql, $params);

    if (!$c_image[0]) return false;
    $bin = base64_decode($c_image[0]['bin']);
    $type = $c_image[0]['type'];

    return db_image_insert_c_image($new_filename, $bin, $filesize, $c_member_id, null, $type);
}

/**
 * 指定ユーザの登録画像の合計サイズを取得する
 * パラメータ省略された場合、全体の合計サイズを取得する
 * 
 * @param int $u
 * @param string $category
 * @return int 登録画像合計サイズ
 */
function db_image_get_image_filesize( $u = 0, $category = '')
{
    static $is_recurred = false;  //再帰処理中かどうかの判定フラグ
    
    if (!$is_recurred) {  //function cacheのために再帰処理を行う
        $is_recurred = true;
        $funcargs = func_get_args();
        $result = pne_cache_recursive_call(OPENPNE_FUNCTION_CACHE_LIFETIME_FAST, __FUNCTION__, $funcargs);
        
        $is_recurred = false;
        return $result;
    }
    
    $sql = "SELECT SUM(filesize) FROM c_image_size ";
    $where = array();
    $params = array();
    if ($u) {
        $where[] = "(c_member_id = ?)";
        $params[] = $u;
    }

    if ($category) {
        if ($category != 'other') {
            $where[] = "(image_category = ?)";
        } else {
            $where[] = "((image_category = ?)";
        }
        $params[] = $category;
    }

    if ($where) {
        $sql .= " WHERE " . implode(' AND ', $where);
    }

    $other = array();
    if ($category == 'other') {
        if (!OPENPNE_ALBUM_LIMIT) {
            $sql .= " OR (image_category = ?)";
            $params[] = 'album';
        }
        if (!OPENPNE_IMAGE_DIARY_LIMIT) {
            $sql .= " OR (image_category = ?)";
            $params[] = 'diary';
        }
        if (!OPENPNE_IMAGE_COMMU_LIMIT) {
            $sql .= " OR (image_category = ?)";
            $params[] = 'commu';
        }
        $sql .= ")";
    }

    return db_get_one($sql, $params);
}

/**
 * c_image_sizeテーブルにレコードを登録する
 * 
 * @param string $filename
 * @param int $c_member_id
 * @param int $filesize
 * @return bool
 */
function db_image_insert_c_image_size($filename, $c_member_id, $filesize, $category = '')
{
    $result = true;

    if ($c_member_id) {
        if (!$category) {
            $category = util_image_filename2category($filename);
        }
        $params = array(
            'filename'       => $filename,
            'c_member_id'    => $c_member_id,
            'filesize'       => $filesize,
            'image_category' => $category,
            'r_datetime'     => db_now(),
        );
        $result = db_insert('c_image_size', $params);

        //function cacheの削除
        pne_cache_drop('db_image_get_image_filesize', $c_member_id, $category);
    }
    return $result;
}

/**
 * c_image_sizeテーブルのレコードを削除する
 * 
 * @param int $c_member_id
 * @return bool
 */
function db_image_delete_c_image_size4c_member_id($c_member_id)
{
    if ($c_member_id) {
        $sql = 'DELETE FROM c_image_size WHERE c_member_id = ?';
        $params = array(
            $c_member_id,
        );
        db_query($sql, $params);
    }

    return true;
}

?>
