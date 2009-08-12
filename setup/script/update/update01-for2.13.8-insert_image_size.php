<?php
require_once './config.inc.php';
chdir(OPENPNE_PUBLIC_HTML_DIR);
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

/**
 * 登録済み画像のファイルサイズを求める
 */
function get_image_size($category, $params, $handle)
{
    // request
    $table       = $params[0];
    $filename    = $params[1];
    $c_member_id = $params[2];

    // c_image 参照先
    $image_dsn = array('main', 'image');
    foreach ($image_dsn as $key => $dsn) {
        if (!isset($GLOBALS['_OPENPNE_DSN_LIST'][$dsn])) {
            continue;
        }
        $imagedb =& db_get_instance($dsn);

        // 取り出し
        $sql  = 'SELECT ';
        if ($table <> 'biz_shisetsu') {
            $sql .= $c_member_id . ' as c_member_id, ';
        }
        $sql .= $filename . ' as image_filename ';
        if ($table == 'c_member') {
            $sql .= ',r_date ';
        } elseif ($table <> 'biz_group' && $table <> 'biz_shisetsu') {
            $sql .= ',r_datetime ';
        }
        $sql .= 'FROM ' . $table;
        $sql .= ' WHERE ' . $filename . ' <> ""';
        $sql .= ' AND ' . $filename . ' is not NULL';
        $data_list = db_get_all($sql);

        $lines = 0;
        if ($data_list) {
            fwrite($handle, 'INSERT INTO c_image_size VALUES');
        }
        foreach($data_list as $data) {
            // get image size
            $sql  = 'SELECT bin FROM c_image WHERE filename = ?';
            $params = array($data['image_filename']);
            $c_image_list = $imagedb->get_all($sql, $params);

            foreach ($c_image_list as $c_image) {
                $filesize = strlen(base64_decode($c_image['bin']));
            }

            $ins_data = '';
            if ($lines) {
                $ins_data .= ',';
            }
            $ins_data .= '(';
            if ($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']['phptype'] == 'pgsql') {
                $ins_data .= " nextval('c_image_size_c_image_size_id_seq')";
            } else {
                $ins_data .= ' null';
            }
            $ins_data .= ",'" . $data['image_filename'] . "'";
            $ins_data .= ",'" . $data['c_member_id'] . "'";
            $ins_data .= ",'" . $filesize . "'";
            $ins_data .= ",'" . $category . "'";
            if ($table == 'biz_group' || $table == 'biz_shisetsu') {
                $ins_data .= ",'" . db_now() . "'";
            } elseif ($table == 'c_member') {
                $ins_data .= ",'" . $data['r_date'] . "'";
            } else {
                $ins_data .= ",'" . $data['r_datetime'] . "'";
            }
            $ins_data .= ')';
            fwrite($handle, $ins_data);
            $lines ++;
        }
        if ($lines) {
            fwrite($handle, ";\n");
        }
    }
    
}

/**
 * テンポラリファイルを作成
 */
function open_temp_file($mode, $filename = '')
{
    if (!$filename) {
        $w_filename = tempnam(OPENPNE_VAR_DIR . '/tmp', 'image_size');
    } else {
        $w_filename = $filename;
    }
    $handle = fopen($w_filename, $mode);

    return array($w_filename, $handle);
}

/**
 * load data infile
 */
function load_data_infile($filename)
{
    list($r_filename, $r_handle) = open_temp_file('r', $filename);
    while (!feof($r_handle)) {
        $sql = fgets($r_handle);
        if ($sql) db_query($sql);
    }
    close_temp_file($filename, $r_handle);
}

/**
 * テンポラリを閉じる
 */
function close_temp_file($filename, $handle)
{
    fclose($handle);
    chmod($filename, 0666);
}


/**
 * 処理本体
 * biz_shisetsuは、member_idを持っていないため、設定不可
 * array([category] => array([table],[filename field],[c_member_id field])
 */
$category_list = array(
    'album' => array(
        array('c_album_image', 'image_filename', 'c_member_id')
    ),
    'commu' => array(
        array('c_commu_topic_comment', 'image_filename1', 'c_member_id'),
        array('c_commu_topic_comment', 'image_filename2', 'c_member_id'),
        array('c_commu_topic_comment', 'image_filename3', 'c_member_id'),
    ),
    'diary' => array(
        array('c_diary', 'image_filename_1', 'c_member_id'),
        array('c_diary', 'image_filename_2', 'c_member_id'),
        array('c_diary', 'image_filename_3', 'c_member_id'),
        array('c_diary_comment', 'image_filename_1', 'c_member_id'),
        array('c_diary_comment', 'image_filename_2', 'c_member_id'),
        array('c_diary_comment', 'image_filename_3', 'c_member_id'),
        array('c_album', 'album_cover_image', 'c_member_id'),
    ),
     'other' => array(
        array('c_commu', 'image_filename', 'c_member_id_admin'),
        array('biz_group', 'image_filename', 'admin_id'),
        array('biz_shisetsu', 'image_filename', 'c_member_id'),
        array('c_member', 'image_filename_1', 'c_member_id'),
        array('c_member', 'image_filename_2', 'c_member_id'),
        array('c_member', 'image_filename_3', 'c_member_id'),
        array('c_message', 'image_filename_1', 'c_member_id_from'),
        array('c_message', 'image_filename_2', 'c_member_id_from'),
        array('c_message', 'image_filename_3', 'c_member_id_from'),
    ),
);

// Insert格納用テンポラリファイル作成
list($filename, $handle) = open_temp_file('w');

//テーブル分ループ
foreach ($category_list as $category => $table_list) {

    // サイズ取り出し
    // １テーブルづつInsert文を作成していく
    foreach ($table_list as $target) {
        get_image_size($category, $target, $handle);
    }

}
// テンポラリファイルクローズ
close_temp_file($filename, $handle);

// Insert実行
load_data_infile($filename);

echo 'Complete!';
?>


