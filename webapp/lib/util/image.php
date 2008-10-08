<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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
 *画像をリサイズし、出力する。
 *@param $type 画像タイプ
 *@param $src_filename 変換元画像ファイル名
 *@param $dst_filename 変換先画像ファイル名
 *@param $original_width 変換元画像の画像幅
 *@param $original_height 変換元画像の画像高さ
 *@param $new_width 変換先画像の画像幅
 *@param $new_height 変換先画像の画像高さ
 */
function resize_image( $type, $src_filename, $dst_filename, $original_width, $original_height, $new_width, $new_height)
{
    $src_img = NULL;
    $dst_img = NULL;
    
    switch ($type) {
        case IMAGETYPE_GIF:
            $src_img = imagecreatefromgif ( $src_filename );
            $transparentIndex = imagecolortransparent($src_img);
            //透過GIFの場合
            if($transparentIndex >= 0){
                $dst_img = imagecreate ( $new_width, $new_height );
                $transparentColor=imagecolorsforindex($src_img, $transparentIndex);
                $transparent=imagecolorallocate($dst_img, $transparentColor['red'], $transparentColor['green'], $transparentColor['blue']);
                imagecolortransparent($dst_img, $transparent);
                imagecopyresized ($dst_img,$src_img,0,0,0,0,$new_width,$new_height,$original_width,$original_height);
            }
            //透過GIFで無い場合
            else{
                $dst_img = imagecreatetruecolor( $new_width, $new_height );
                imagecopyresampled ($dst_img,$src_img,0,0,0,0,$new_width,$new_height,$original_width,$original_height);
                imagetruecolortopalette($dst_img, true, 256);
            }
            imagegif ( $dst_img, $dst_filename );
            break;
        case IMAGETYPE_JPEG:
               $src_img = imagecreatefromjpeg ( $src_filename );
            $dst_img = imagecreatetruecolor ( $new_width, $new_height );
            imagecopyresampled ($dst_img,$src_img,0,0,0,0,$new_width,$new_height,$original_width,$original_height);
            imagejpeg ( $dst_img, $dst_filename );
            break;
        case IMAGETYPE_PNG:
            $src_img = imagecreatefrompng ( $src_filename );
            //TrueColor PNGの場合
            if(imageistruecolor($src_img)) { 
                $dst_img = imagecreatetruecolor ( $new_width, $new_height );
                imagealphablending($dst_img, false);
                imagecopyresampled ($dst_img,$src_img,0,0,0,0,$new_width,$new_height,$original_width,$original_height);
                imagesavealpha($dst_img, true);
            }
            //TrueColor PNGで無い場合
            else{
                //透過PNGの場合
                if($transparentIndex >= 0){
                    $dst_img = imagecreate ( $new_width, $new_height);
                    $transparentColor=imagecolorsforindex($src_img, $transparentIndex);
                    $transparent=imagecolorallocate($dst_img, $transparentColor['red'], $transparentColor['green'], $transparentColor['blue']);
                    imagecolortransparent($dst_img, $transparent);
                    imagecopyresized ($dst_img,$src_img,0,0,0,0,$new_width,$new_height,$original_width,$original_height);
                }
                //透過PNGで無い場合
                    else{
                        $dst_img = imagecreatetruecolor( $new_width, $new_height );
                    imagecopyresampled ($dst_img,$src_img,0,0,0,0,$new_width,$new_height,$original_width,$original_height);
                    imagetruecolortopalette($dst_img, true, 256);
                }
            }
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
        t_image_clear_tmp_db($uid);
    }
}

function image_insert_c_image4tmp($prefix, $tmpfile)
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

        if (_do_insert_c_image($filename, $filepath)) {
            return $filename;
        }
    } else {
        $c_tmp_image = c_tmp_image4filename($tmpfile);

        $params = array(
            'filename' => $filename,
            'bin' => $c_tmp_image['bin'],
            'r_datetime' => db_now(),
            'type' => '',
        );
        if (db_insert("c_image", $params)) {
            return $filename;
        }
    }
    return false;
}

function image_insert_c_image($upfile_obj, $filename)
{
    if (!$upfile_obj) return false;

    $filepath = $upfile_obj['tmp_name'];

    $path_parts = pathinfo($upfile_obj['name']);
    $ext = $path_parts['extension'];
    $ext = strtolower($ext);
    $filename = $filename . '_' . time() . '.' . $ext;

    if (!_do_insert_c_image($filename, $filepath)) {
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

    $result = _do_insert_c_tmp_image($filename, $filepath);
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
function image_insert_c_image_direct($upfile_obj, $prefix)
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
    $image_filename = image_insert_c_image4tmp($prefix, $tmpfile);
    t_image_clear_tmp($sessid);

    return $image_filename;
}

?>
