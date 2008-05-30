<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class OpenPNE_Img_ImageMagick extends OpenPNE_Img
{
    function OpenPNE_Img_ImageMagick($options = array())
    {
        parent::OpenPNE_Img($options);
    }

    function get_raw_img()
    {
        // 実画像キャッシュがあるかどうかチェック
        if ($this->check_rawcache()) {
            $filename = $this->get_rawcache_filename();

            $fd = fopen($filename, 'rb');
            $data = fread($fd, filesize($filename));
            fclose($fd);

            return $data;
        } else {
            //DBから取得
            if (!$data = $this->get_raw_img4db()) {
                return false;
            }

            // 取得した画像を一旦ファイルに書き出し
            $this->create_rawcache($data);

            return $data;
        }
    }

    function resize_img($source_gdimg, $w, $h)
    {
        $s_width  = imagesx($source_gdimg);
        $s_height = imagesy($source_gdimg);

        // リサイズも形式変換も必要ない場合
        if ((!$w || $s_width <= $w) && (!$h || $s_height <= $h) &&
            ($this->source_format == $this->output_format)) {

            return false;
        }

        $convert_command = $this->get_imgmagick_convert_command($w, $h);
        $output_img = $this->exec_imgmagick_convert($convert_command);

        return $output_img;
    }

    /**
     * 実画像キャッシュがあるか判定
     */
    function check_rawcache()
    {
        return is_readable($this->get_rawcache_filename());
    }

    /**
     * サムネイルキャッシュを作成する
     */
    function create_cache($output_img)
    {
        $this->create_cache_subdir();

        $file = fopen($this->cache_fullpath, "wb");
        fwrite($file, $output_img);
        fclose($file);
    }

    /**
     * 実画像キャッシュを作成する
     */
    function create_rawcache($rawimage)
    {
        $raw_fullpath = $this->get_rawcache_filename();
        $this->create_cache_rawdir();

        if ($this->output_format == 'png') {
            touch($raw_fullpath);
            $output_gdimg = imagecreatefromstring($rawimage);
            imagepng($output_gdimg, $raw_fullpath);
        } else {
            $handle = fopen($raw_fullpath, 'wb');
            fwrite($handle, $rawimage);
            fclose($handle);
        }
    }

    /**
     * 実画像キャッシュディレクトリを作成する
     */
    function create_cache_rawdir()
    {
        $subdir = dirname($this->get_rawcache_filename());
        if (!is_dir($subdir)) {
            mkdir($subdir);
        }
    }

    /**
     * ImageMagickのコマンドラインを作成して返す
     */
    function get_imgmagick_convert_command($w, $h)
    {
        $opt = (defined('IMGMAGICK_OPT') && IMGMAGICK_OPT) ? IMGMAGICK_OPT : "-resize";

        // 念のため escape をかける
        $w = intval($w);
        $h = intval($h);
        $f = escapeshellcmd($this->output_format);
        $path = realpath($this->get_rawcache_filename());

        return IMGMAGICK_APP." $opt {$w}x{$h} $path {$f}:-";
    }

    /**
     * ImageMagickのconvertを起動する
     */
    function exec_imgmagick_convert($command)
    {
        while (@ob_end_clean());
        ob_start();
        passthru($command);
        $output_img = ob_get_contents();
        while (@ob_end_clean());

        return $output_img;
    }

    /**
     * 実サイズ画像用の保存ファイル名を返す
     */
    function get_rawcache_filename()
    {
        // ディレクトリ名
        // キャッシュが削除されるためにはパターン「w*_h*」に適合する必要がある
        $size = 'w_h_raw';

        // ex.) img_cache_m_11_1115813647
        $cache_filename = OPENPNE_IMG_CACHE_PREFIX .
            str_replace('.', '_', $this->source_filename) .
            '.' . $this->source_format;

        // ex.) /var/img_cache/jpg/w180_h180/{filename}
        return
            $this->cache_dir . '/' .
            $this->source_format . '/' .
            $size . '/' .
            $cache_filename;
    }
}

?>
