<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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

    if (IMAGE_MAX_WIDTH && ($width > IMAGE_MAX_WIDTH)) {
        return false;
    }
    if (IMAGE_MAX_HEIGHT && ($height > IMAGE_MAX_HEIGHT)) {
        return false;
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

?>
