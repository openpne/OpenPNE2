<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function image_cache_delete($image_filename)
{
    $cache_dir = OPENPNE_IMG_CACHE_DIR;
    $cache_filename = OPENPNE_IMG_CACHE_PREFIX . str_replace('.', '_', $image_filename);

    foreach ((array)glob($cache_dir.'/jpg/w*_h*', GLOB_ONLYDIR) as $dir) {
        $path = $dir . '/' . $cache_filename . '.jpg';
        if (file_exists($path)) unlink($path);
    }
    foreach ((array)glob($cache_dir.'/gif/w*_h*', GLOB_ONLYDIR) as $dir) {
        $path = $dir . '/' . $cache_filename . '.gif';
        if (file_exists($path)) unlink($path);
    }
    foreach ((array)glob($cache_dir.'/png/w*_h*', GLOB_ONLYDIR) as $dir) {
        $path = $dir . '/' . $cache_filename . '.png';
        if (file_exists($path)) unlink($path);
    }
}

/**
 * 画像フォーマット判定
 */
function t_check_image_format($file, $type = 0)
{
    if (!$type) {
        list($width, $height, $type, $attr) = @getimagesize($file['tmp_name']);
    }

    $format = false;
    switch ($type) {
    case IMAGETYPE_GIF:
        if (@imagecreatefromgif($file['tmp_name'])) $format = 'gif';
        break;
    case IMAGETYPE_JPEG:
        if (@imagecreatefromjpeg($file['tmp_name'])) $format = 'jpg';
        break;
    case IMAGETYPE_PNG:
        if (@imagecreatefrompng($file['tmp_name'])) $format = 'png';
        break;
    default:
        break;
    }

    return $format;
}

/**
 * アップロード画像の正当性チェック
 *
 * @param array $file ファイル情報($_FILE['xxx'])
 * @return array ファイル情報 | 失敗時false
 */
function t_check_image($file)
{
    if (!$file || $file['error']) {
        return false;
    }
    list($width, $height, $type, $attr) = @getimagesize($file['tmp_name']);

    if (!($format = t_check_image_format($file, $type))) {
        return false;
    }

    if ($file['size'] > IMAGE_MAX_FILESIZE * 1024) {
        return false;
    }

    $need_resize = false;
    $original_width = $width;
    $original_height = $height;
    //横のサイズが、指定されたサイズより大きい場合
    if (IMAGE_MAX_WIDTH && ($width > IMAGE_MAX_WIDTH)) {
        $need_resize = true;
        $height = $height * (IMAGE_MAX_WIDTH / $width);
        $width = IMAGE_MAX_WIDTH;
    }
    //縦サイズが、指定されたサイズより大きい場合
    if (IMAGE_MAX_HEIGHT && ($height > IMAGE_MAX_HEIGHT)) {
        $need_resize = true;
        $width = $width * (IMAGE_MAX_HEIGHT / $height);
        $height = IMAGE_MAX_HEIGHT;
    }
    if ($height < 1.) {
        $height = 1;
    }
    if ($width < 1.) {
        $width = 1;
    }

    if ($need_resize) {
        resize_image($type, $file['tmp_name'], $file['tmp_name'], $original_width, $original_height,$width, $height );
    }

    $image = array(
        'format' => $format,
        'size'   => $file['size'],
        'width'  => $width,
        'height' => $height,
    );
    return $image;
}
/**
 * 画像をリサイズし、出力する
 *
 * @param $type 画像タイプ
 * @param $src_filename 変換元画像ファイル名
 * @param $dst_filename 変換先画像ファイル名
 * @param $original_width 変換元画像の画像幅
 * @param $original_height 変換元画像の画像高さ
 * @param $new_width 変換先画像の画像幅
 * @param $new_height 変換先画像の画像高さ
 */
function resize_image($type, $src_filename, $dst_filename, $original_width, $original_height, $new_width, $new_height)
{
    $src_img = NULL;
    $dst_img = NULL;

    switch ($type) {
    case IMAGETYPE_GIF:
        $src_img = imagecreatefromgif($src_filename);
        $dst_img = imagecreate($new_width, $new_height);
        set_transparent_to_output_image($src_img, $dst_img, $type);
        imagecopyresampled($dst_img, $src_img, 0, 0, 0, 0, $new_width, $new_height, $original_width, $original_height);
        imagegif($dst_img, $dst_filename);
        break;
    case IMAGETYPE_JPEG:
        $src_img = imagecreatefromjpeg($src_filename);
        $dst_img = imagecreatetruecolor($new_width, $new_height);
        imagecopyresampled($dst_img, $src_img, 0, 0, 0, 0, $new_width, $new_height, $original_width, $original_height);
        imagejpeg($dst_img, $dst_filename);
        break;
    case IMAGETYPE_PNG:
        $src_img = imagecreatefrompng($src_filename);
        $dst_img = imagecreate($new_width, $new_height);
        set_transparent_to_output_image($src_img, $dst_img, $type);
        imagecopyresampled($dst_img, $src_img, 0, 0, 0, 0, $new_width, $new_height, $original_width, $original_height);
        imagepng($dst_img, $dst_filename);
        break;
    default:
        break;
    }

    //リリースを解放
    imagedestroy($dst_img);
    imagedestroy($src_img);
}

/**
 * 入力画像から取得した透過情報を出力画像に適用する
 *
 * @params resource $source_gdimg
 * @params resource $output_gdimg
 * @params int $type
 */
function set_transparent_to_output_image(&$source_gdimg, &$output_gdimg, $type)
{
    $trnprt_idx_s = imagecolortransparent($source_gdimg);
    if ($trnprt_idx_s >= 0) { // 透過色が設定されている
        // 入力画像から透明色に指定してある色（RGBの配列）を取得する
        $trnprt_color = imagecolorsforindex($source_gdimg, $trnprt_idx_s);

        // 色の設定
        $trnprt_idx_s = imagecolorallocate($output_gdimg, $trnprt_color['red'], $trnprt_color['green'], $trnprt_color['blue']);

        // 透明色（にする色）で塗りつぶす
        imagefill($output_gdimg, 0, 0, $trnprt_idx_s);

        // 透明色設定
        imagecolortransparent($output_gdimg, $trnprt_idx_s);
    } elseif ($type == IMAGETYPE_PNG) {  // PNG-24
        // アルファチャンネル情報を保存するには、アルファブレンディングを解除する必要がある
        imagealphablending($output_gdimg, false);
        imagesavealpha($output_gdimg, true);

        // 透過色設定
        $color = imagecolorallocatealpha($output_gdimg, 0, 0, 0, 127);
        imagefill($output_gdimg, 0, 0, $color);
    }
}

/**
 * 確認画面用に一時ファイルを保存して、そのファイル名を返す
 *
 * 保存先:     var/tmp/
 * ファイル名: ($prefix)_($uid).[(jpe?g)|(gif)|(png)]
 */
function t_image_save2tmp($upfile, $uid, $prefix='', $ext='')
{
    if (!$ext) $ext = t_check_image_format($upfile);

    // 一時ファイル保存ディレクトリ
    $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';

    $filename = sprintf('%s_%s.%s', $prefix, $uid, $ext);
    $filepath = $img_tmp_dir_path . $filename;

    if (!file_exists($upfile['tmp_name'])) {
        return false;
    }

    if (OPENPNE_TMP_IMAGE_DB) {
        if (!image_insert_c_tmp_image($upfile, $filename)) {
            return false;
        }
    } else {
        move_uploaded_file($upfile['tmp_name'], $filepath);
        chmod($filepath, 0644);
        if (!is_file($filepath)) {
            return false;
        }
    }

    return $filename;
}

/**
 * 確認画面用の一時ファイルをすべて削除
 */
function t_image_clear_tmp($uid)
{
    if (!OPENPNE_TMP_IMAGE_DB) {
        $img_tmp_dir_path = OPENPNE_VAR_DIR . "/tmp/";
        $files = glob($img_tmp_dir_path . '*_' . $uid . '.*');
        if (is_array($files)) {
            foreach ($files as $filename) {
                unlink($filename);
            }
        }
    } else {
        db_image_clear_tmp_db($uid);
    }
}

function image_insert_c_image4tmp($prefix, $tmpfile, $c_member_id, $category = '')
{
    if (!$tmpfile || preg_match('/[^\.\w]/', $tmpfile)) return false;

    $path_parts = pathinfo($tmpfile);
    $ext = $path_parts['extension'];
    $ext = strtolower($ext);

    $allowed_ext = array('jpg', 'jpeg', 'gif', 'png');
    if (!in_array($ext, $allowed_ext)) {
        return false;
    }

    $filename = sprintf('%s_%s.%s', $prefix, time(), $ext);

    if (!OPENPNE_TMP_IMAGE_DB) {
        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
        $filepath = $img_tmp_dir_path . basename($tmpfile);

        if (db_image_insert_c_image2($filename, $filepath, $c_member_id, $category)) {
            return $filename;
        }
    } else {
        $c_tmp_image = db_image_c_tmp_image4filename($tmpfile);
        $filesize = $c_tmp_image['filesize'];

        $params = array(
            'filename' => $filename,
            'bin' => $c_tmp_image['bin'],
            'r_datetime' => db_now(),
            'type' => '',
        );
        if (db_insert("c_image", $params)) {
            db_image_insert_c_image_size($filename, $c_member_id, $filesize, $category);
            return $filename;
        }
    }
    return false;
}

function image_insert_c_image($upfile_obj, $filename, $c_member_id = 0)
{
    if (!$upfile_obj) return false;

    $filepath = $upfile_obj['tmp_name'];

    $path_parts = pathinfo($upfile_obj['name']);
    $ext = $path_parts['extension'];
    $ext = strtolower($ext);
    $filename = $filename . '_' . time() . '.' . $ext;

    if (!db_image_insert_c_image2($filename, $filepath, $c_member_id)) {
        return false;
    }
    return $filename;
}

function image_insert_c_tmp_image($upfile_obj, $filename)
{
    if (!$upfile_obj) {
        return false;
    }

    $filepath = $upfile_obj['tmp_name'];

    $result = db_image_insert_c_tmp_image($filename, $filepath);
    if (!$result) {
        return false;
    }
    return $filename;
}

/**
 * アップロードされた画像をワンアクションでc_imageに登録する時に使用
 *
 * @params array $upfile_obj
 * @params string $prefix
 * @return string 画像ファイル名 | 失敗時false
 */
function image_insert_c_image_direct($upfile_obj, $prefix, $c_member_id = 0)
{
    if (!file_exists($upfile_obj['tmp_name'])) {
        return false;
    }

    $sessid = session_id();
    t_image_clear_tmp($sessid);
    $tmpfile = t_image_save2tmp($upfile_obj, $sessid, $prefix);
    if (!$tmpfile) {
        t_image_clear_tmp($sessid);
        return false;
    }
    $image_filename = image_insert_c_image4tmp($prefix, $tmpfile, $c_member_id);
    t_image_clear_tmp($sessid);

    return $image_filename;
}

/**
 * ファイル名を元にカテゴリを取得する
 *
 * @params string $filename
 * @return string カテゴリ | 失敗時false
 */
function util_image_filename2category($filename)
{
    $category = split("_", $filename);
    $rtn_category = "";
    switch ($category[0]) {
        case "a" :
            $rtn_category = "album";
            break;
        case "d" :
        case "dc" :
            $rtn_category = "diary";
            break;
        case "t" :
        case "tc" :
            $rtn_category = "commu";
            break;
        case "c" :
        case "m" :
        case "ms":
        case "s" :
        case "g" :
            $rtn_category = "other";
            break;
        default :
            break;
    }
    return $rtn_category;
}

/**
 * 指定ユーザが指定のカテゴリの画像がアップロード可能か判断する
 * パラメータ省略された場合、全体の合計サイズを取得する
 * 
 * @param int $fileseize
 * @param int $u
 * @param string $category
 * @return int $result | 正常値:0 既存サイズ不足:1 追加サイズ不足:2
 */
function util_image_check_add_image_upload($filesize, $u = 0, $category = '')
{
    $result = 0;
    $mb = 1048576;
    switch ($category) {
        case 'album' :
            if (!OPENPNE_USE_ALBUM) {
                $category_size = 0;
            } else {
                $category_size = OPENPNE_ALBUM_LIMIT;
            }
            break;
        case 'diary' :
            $category_size = OPENPNE_IMAGE_DIARY_LIMIT;
            break;
        case 'commu' :
            $category_size = OPENPNE_IMAGE_COMMU_LIMIT;
            break;
        case 'other' :
            if (!OPENPNE_USE_ALBUM && OPENPNE_IMAGE_USER_LIMIT) {
                $category_size = OPENPNE_IMAGE_OTHER_LIMIT + OPENPNE_ALBUM_LIMIT;
            } else {
                $category_size = OPENPNE_IMAGE_OTHER_LIMIT;
            }
            break;
        default :
            $category_size = 0;
            break;
    }

    // --現状のサイズチェック
    if ($category_size) {
        // カテゴリ単位のチェック
        $category_size = $category_size * $mb;

        $total_filesize = db_image_get_image_filesize($u, $category);

        if ($total_filesize > $category_size) {
            $result = 1;
            return $result;
        }
    } else if (OPENPNE_IMAGE_USER_LIMIT) {
        // 全体のチェック
        $chksize = OPENPNE_IMAGE_OTHER_LIMIT * $mb;

        $total_filesize = db_image_get_image_filesize($u, 'other');

        if ($total_filesize > $chksize) {
            $result = 1;
            return $result;
        }
    }

    // --追加画像のサイズチェック
    if ($category_size) {
        // カテゴリ単位のチェック
        $total_filesize = db_image_get_image_filesize($u, $category);
        $total_filesize = $total_filesize + $filesize;

        if ($total_filesize > $category_size) {
            $result = 2;
            return $result;
        }
    } else if (OPENPNE_IMAGE_USER_LIMIT) {
        // 全体のチェック
        $total_filesize = db_image_get_image_filesize($u, 'other');
        $total_filesize = $total_filesize + $filesize;
            
        if ($total_filesize > $chksize) {
            $result = 2;
            return $result;
        }
    }
    return $result;
}

/**
 * 指定ユーザが指定のカテゴリの画像の置き換えが可能サイズか判断する
 * パラメータ省略された場合、全体の合計サイズを取得する
 * 
 * @param int $fileseize
 * @param array $del_files
 * @param int $u
 * @param string $category
 * @return int $result | 正常値:0 既存サイズ不足:1 追加サイズ不足:2
 */
function util_image_check_change_image_upload($filesize, $del_files, $u = 0, $category = '')
{
    $result = 0;
    $mb = 1048576;
    switch ($category) {
        case 'album' :
            if (!OPENPNE_USE_ALBUM) {
                $category_size = 0;
            } else {
                $category_size = OPENPNE_ALBUM_LIMIT;
            }
            break;
        case 'diary' :
            $category_size = OPENPNE_IMAGE_DIARY_LIMIT;
            break;
        case 'commu' :
            $category_size = OPENPNE_IMAGE_COMMU_LIMIT;
            break;
        case 'other' :
            if (!OPENPNE_USE_ALBUM && OPENPNE_IMAGE_USER_LIMIT) {
                $category_size = OPENPNE_IMAGE_OTHER_LIMIT + OPENPNE_ALBUM_LIMIT;
            } else {
                $category_size = OPENPNE_IMAGE_OTHER_LIMIT;
            }
            break;
        default :
            $category_size = 0;
            break;
    }

    // 削除ファイルサイズ取得
    $del_filesize = 0;
    if ($del_files) {
        $sql = 'SELECT SUM(filesize) FROM c_image_size';
        $where = '';
        $filenames = array();
        $params = array();
        if ($u) {
            $where = "(c_member_id = ?)";
            $params[] = $u;
        }

        foreach ($del_files as $del_filename) {
            $filenames[] = "(filename = ?)";
            $params[] = $del_filename;
        }
        if ($where) {
            $where .= " AND (";
            $where .= implode(' OR ', $filenames);
            $where .= ")";
        } else {
            $where = implode(' OR ', $filenames);
        }
        $sql .= " WHERE " . $where;
        $del_filesize = db_get_one($sql, $params);
    }

    // --編集画像のサイズチェック
    if ($category_size) {
        // カテゴリ単位のチェック
        $category_size = $category_size * $mb;

        $total_filesize = db_image_get_image_filesize($u, $category);
        $total_filesize = $total_filesize + $filesize - $del_filesize;

        if ($total_filesize > $category_size) {
            $result = 2;
        }
    } else if (OPENPNE_IMAGE_USER_LIMIT) {
        // 全体のチェック
        $chksize = OPENPNE_IMAGE_OTHER_LIMIT * $mb;

        $total_filesize = db_image_get_image_filesize($u, 'other');
        $total_filesize = $total_filesize + $filesize - $del_filesize;

        if ($total_filesize > $chksize) {
            $result = 2;
        }
    }

    // --現状のサイズチェック
    if ($result) {
        if ($category_size) {
            // カテゴリ単位のチェック
            $total_filesize = db_image_get_image_filesize($u, $category);

            if ($total_filesize > $category_size) {
                $result = 1;
                return $result;
            }
        } else if (OPENPNE_IMAGE_USER_LIMIT) {
            // 全体のチェック
            $total_filesize = db_image_get_image_filesize($u, 'other');

            if ($total_filesize > $chksize) {
                $result = 1;
                return $result;
            }
        }
    }

    return $result;
}

/**
 * 写真アップロードサイズエラー時のメッセージを取得する
 *
 * @params int $type | 既存サイズ不足:1 追加サイズ不足(単体):2 追加サイズ不足(複数):3
 * @return string $msg
 */
function util_image_get_upload_err_msg($type)
{
    $msg = 'これ以上写真を投稿することができません。';
    switch ($type) {
        case 1 :
            $msg .= '登録済みの写真を削除してからやり直してください。';
            break;
        case 2 :
            $msg .= 'ファイルサイズを変更してやり直してください。';
            break;
        case 3 :
            $msg .= '投稿する写真を減らすか、ファイルサイズを変更してやり直してください。';
            break;
        default :
            $msg = '';
            break;
    }

    return $msg;
}

/**
 * ホームに表示する写真容量の情報を作成する
 *
 * @params int $u
 * @return array('category'=>xxx, 'limit_size'=>xxx, 'used_size'=>xxx)
 */
function db_image_get_image_limit_list($u)
{
    $result = array();
    $mb = 1048576;
    $etc_size = 0;

    // community
    if (OPENPNE_IMAGE_COMMU_LIMIT) {
        $commu_size = db_image_get_image_filesize($u, 'commu') / $mb;
        $commu_size = round($commu_size, 2);
        $commu = array('category'   => 'commu',
                       'title'      => WORD_COMMUNITY,
                       'ktai_title' => WORD_COMMUNITY_HALF,
                       'limit_size' => OPENPNE_IMAGE_COMMU_LIMIT,
                       'used_size'  => sprintf("%01.2f", $commu_size) 
                       );
        array_push($result, $commu);
    }

    // diary
    if (OPENPNE_IMAGE_DIARY_LIMIT) {
        $diary_size = db_image_get_image_filesize($u, 'diary') / $mb;
        $diary_size = round($diary_size, 1);
        $diary = array('category'   => 'diary',
                       'title'      => WORD_DIARY,
                       'ktai_title' => WORD_DIARY_HALF,
                       'limit_size' => OPENPNE_IMAGE_DIARY_LIMIT,
                       'used_size'  => sprintf("%01.2f", $diary_size) 
                       );
        array_push($result, $diary);
    }

    // album
    if (OPENPNE_USE_ALBUM) {
        if (OPENPNE_ALBUM_LIMIT) {
            $album_size = db_image_get_image_filesize($u, 'album') / $mb;
            $album_size = round($album_size, 2);
            $album = array('category'   => 'album',
                           'title'      => 'アルバム',
                           'ktai_title' => 'ｱﾙﾊﾞﾑ',
                           'limit_size' => OPENPNE_ALBUM_LIMIT,
                           'used_size'  => sprintf("%01.2f", $album_size)
                           );
            array_push($result, $album);
        }
    }

    // other
    if (OPENPNE_IMAGE_USER_LIMIT) {
        $other_size = (db_image_get_image_filesize($u, 'other')) / $mb;
        $other_size = round($other_size, 2);
        if ((OPENPNE_USE_ALBUM && OPENPNE_ALBUM_LIMIT) || 
            OPENPNE_IMAGE_DIARY_LIMIT || OPENPNE_IMAGE_COMMU_LIMIT) {
            $other = array('category'   => 'other',
                           'title'      => 'その他',
                           'ktai_title' => 'その他',
                           'limit_size' => OPENPNE_IMAGE_OTHER_LIMIT,
                           'used_size'  => sprintf("%01.2f", $other_size)
                           );
            array_unshift($result, $other);
        }
    }

    // total
    if (OPENPNE_IMAGE_USER_LIMIT) {
        $total_size = $album_size + $diary_size + $commu_size + $other_size;
        $total_size = round($total_size, 2);
        $total = array('category'   => 'total',
                       'title'      => '全体',
                       'ktai_title' => '全体',
                       'limit_size' => OPENPNE_IMAGE_USER_LIMIT,
                       'used_size'  => sprintf("%01.2f", $total_size)
                       );
        array_push($result, $total);
    }

    $result = array_reverse($result);

    return $result;
}

/**
 * 一時イメージファイルのファイルサイズを取得する
 * 
 * @param string $prefix
 * @param string $tmpfile
 * @return int ファイルサイズ | 失敗時false
 */
function util_image_get_c_tmp_filesize4filename($prefix, $tmpfile)
{
    if (!$tmpfile || preg_match('/[^\.\w]/', $tmpfile)) return false;

    if (!OPENPNE_TMP_IMAGE_DB) {
        $img_tmp_dir_path = OPENPNE_VAR_DIR . '/tmp/';
        $filepath = $img_tmp_dir_path . basename($tmpfile);
        return filesize($filepath);
    } else {
        $c_tmp_image = db_image_c_tmp_image4filename($tmpfile);
        return $c_tmp_image['filesize'];
    }
    return false;
}

?>
