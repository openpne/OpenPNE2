<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class OpenPNE_Img
{
    /**
     * Request Parameters
     * @var array
     *     - w : width
     *     - h : height
     *     - f : format
     *     - filename : image filename
     */
    var $requests;

    // options
    var $dsn;
    var $cache_dir;
    var $jpeg_quality = 75;

    var $raw_img;

    var $source_filename;
    var $source_format;
    var $output_format;

    var $cache_fullpath;

    /**
     * constructor
     * set options
     *
     * @access public
     * @param array $options
     */
    function OpenPNE_Img($options = array())
    {
        foreach ($options as $key => $value) {
            switch ($key) {
            case 'dsn':
                $this->dsn = $value;
                break;
            case 'jpeg_quality':
                $this->jpeg_quality = intval($value);
                break;
            case 'cache_dir':
                $this->cache_dir = realpath($value);
                break;
            }
        }
    }

    /**
     * リクエストパラメータを取得
     *
     * @access public
     * @param array $vars request vars
     */
    function set_requests($vars)
    {
        // initialize
        $this->requests = array(
            'w' => 0,
            'h' => 0,
            'f' => '',
            'filename' => '',
        );

        foreach ($vars as $key => $value) {
            switch ($key) {
            case 'w':
            case 'h':
                if (is_numeric($value)) {
                    $this->requests[$key] = intval($value);
                }
                break;
            case 'f':
                $allowed_format = array('jpg', 'jpeg', 'gif', 'png');
                if (in_array(strtolower($value), $allowed_format)) {
                    $this->requests[$key] = strtolower($value);
                }
                break;
            case 'filename':
                if (!preg_match('/[^\.\w]/', $value)) {
                    $this->requests[$key] = $value;
                }
                break;
            }
        }
    }

    /**
     * 画像を生成
     *
     * @access public
     */
    function generate_img()
    {
        if (!$this->requests['filename']) {
            return false;
        }

        // 解像度のチェック
        $w = $this->requests['w'];
        $h = $this->requests['h'];
        if ($w || $h) {
            $size = sprintf('%dx%d', $w, $h);
            $allowed_size = (array)$GLOBALS['_OPENPNE_IMG_ALLOWED_SIZE'];
            if ($allowed_size && !in_array($size, $allowed_size)) {
                return false;
            }
        }

        $this->set_source_filename();
        $this->set_output_format();
        $this->set_cache_filename();

        if ($this->check_cache()) {
            return true;
        }

        if (!$this->raw_img = $this->get_raw_img()) {
            return false;
        }

        // サイズ指定がなく、かつ、形式変換しない場合(GDに変換する必要なし)
        if (!$w && !$h && ($this->source_format == $this->output_format)) {
            $this->create_cache_from_raw_img();
            return true;
        }

        // create a GD image from raw_img
        if (!$source_gdimg  = imagecreatefromstring($this->raw_img)) {
            return false;
        }

        if ($this->requests['f'] == 'jpg') {
            // JPEGの場合、携帯対応
            imageinterlace($source_gdimg, 0);
        }

        //リサイズ
        $output_img = $this->resize_img($source_gdimg, $w, $h);

        //キャッシュを生成
        if ($output_img) {
            $this->create_cache($output_img);
        } else {
            $this->create_cache_from_raw_img();
        }

        return true;
    }

    /**
     * 画像を出力
     *
     * @access public
     */
    function output_img()
    {
        $this->send_content_type();

        if ($mtime = filemtime($this->cache_fullpath)) {
            // Etag
            include_once 'Etag.php';
            $etag = new Etag($this->cache_fullpath.$mtime, $mtime);
            if ($etag->etagCheck()) {
                exit;
            }
        }
        @readfile($this->cache_fullpath);
    }

    /**
     * キャッシュが残っているかどうかチェックする
     *
     * @access protected
     * @return boolean
     */
    function check_cache()
    {
        return is_readable($this->cache_fullpath);
    }

    /**
     * 画像データを取得
     *
     * @access protected
     * @return string raw image data
     */
    function get_raw_img()
    {
        return $this->get_raw_img4db();
    }

    /**
     * DBから画像バイナリを取得
     *
     * @access protected
     */
    function get_raw_img4db()
    {
        include_once 'OpenPNE/DB.php';
        $db =& new OpenPNE_DB($this->dsn);

        $sql = 'SELECT bin, type FROM c_image WHERE filename = ?';
        $params = array($this->requests['filename']);

        if ($c_image = $db->get_row($sql, $params)) {
            if ($c_image['type']) {
                $this->source_format = $c_image['type'];
            }
            return base64_decode($c_image['bin']);
        } else {
            return false;
        }
    }

    /**
     * GDイメージのリサイズ＋形式変換
     *
     * @access protected
     * @param resource $gdimg source GD image
     * @param int $w width
     * @param int $h height
     * @return resource output GD image
     */
    function resize_img($source_gdimg, $w, $h)
    {
        $s_width  = imagesx($source_gdimg);
        $s_height = imagesy($source_gdimg);

        if (!$w) $w = $s_width;
        if (!$h) $h = $s_height;

        // リサイズの必要がない場合
        if ($s_width <= $w && $s_height <= $h) {
            // 形式変換する場合はGDを通す
            if ($this->source_format != $this->output_format) {
                return $source_gdimg;
            }
            return false;
        }

        // 出力サイズ
        $o_width  = $s_width;
        $o_height = $s_height;

        if ($w < $s_width) {
            $o_width  = $w;
            $o_height = $s_height * $w / $s_width;
        }
        if ($h < $o_height && $h < $s_height) {
            $o_width  = $s_width * $h / $s_height;
            $o_height = $h;
        }

        if ($o_height < 1.) {
            $o_height = 1;
        }
        if ($o_width < 1.) {
            $o_width = 1;
        }

        $output_gdimg = imagecreatetruecolor($o_width, $o_height);

        if (($this->output_format == 'gif') || ($this->output_format == 'png')) {
            $trnprt_idx_s = imagecolortransparent($source_gdimg);
            if ($trnprt_idx_s >= 0) { // 透過色が設定されている
                // truecolor イメージを (256色)パレットイメージに変換
                imagetruecolortopalette($output_gdimg, true, 256);

                // 入力画像から透明色に指定してある色（RGBの配列）を取得する
                $trnprt_color = imagecolorsforindex($source_gdimg, $trnprt_idx_s);

                // 色の設定
                $trnprt_idx_s = imagecolorallocate($output_gdimg, $trnprt_color['red'], $trnprt_color['green'], $trnprt_color['blue']);

                // 透明色（にする色）で塗りつぶす
                imagefill($output_gdimg, 0, 0, $trnprt_idx_s);

                // 透明色設定
                imagecolortransparent($output_gdimg, $trnprt_idx_s);
            } elseif ($this->output_format == 'png') {  // PNG-24
                // アルファチャンネル情報を保存するには、アルファブレンディングを解除する必要がある
                imagealphablending($output_gdimg, false);
                imagesavealpha($output_gdimg, true);

                // 透過色設定
                $color = imagecolorallocatealpha($output_gdimg, 0, 0, 0, 127);
                imagefill($output_gdimg, 0, 0, $color);
            }
        }

        imagecopyresampled($output_gdimg, $source_gdimg,
                0, 0, 0, 0, $o_width, $o_height, $s_width, $s_height);
        return $output_gdimg;
    }

    /**
     * send "Content-Type" header
     *
     * @access protected
     */
    function send_content_type()
    {
        switch ($this->output_format) {
        case 'jpeg':
        case 'jpg':
        default:
            header('Content-type: image/jpeg');
            break;
        case 'gif':
            header('Content-type: image/gif');
            break;
        case 'png':
            header('Content-type: image/png');
            break;
        }
    }

    /**
     * キャッシュを作成する
     *
     * @access protected
     */
    function create_cache($output_gdimg)
    {
        $this->create_cache_subdir();

        touch($this->cache_fullpath);
        switch ($this->output_format) {
        case 'jpeg':
        case 'jpg':
        default:
            imagejpeg($output_gdimg, $this->cache_fullpath, $this->jpeg_quality);
            break;
        case 'gif':
            imagegif($output_gdimg, $this->cache_fullpath);
            break;
        case 'png':
            imagepng($output_gdimg, $this->cache_fullpath);
            break;
        }
    }

    /**
     * @access protected
     */
    function create_cache_from_raw_img()
    {
        $this->create_cache_subdir();

        if ($this->output_format == 'png') {
            touch($this->cache_fullpath);
            $output_gdimg = imagecreatefromstring($this->raw_img);
            imagepng($output_gdimg, $this->cache_fullpath);
        } else {
            $handle = fopen($this->cache_fullpath, 'wb');
            fwrite($handle, $this->raw_img);
            fclose($handle);
        }
    }

    /**
     * キャッシュ用サブディレクトリの作成
     * @access protected
     */
    function create_cache_subdir()
    {
        $subdir = dirname($this->cache_fullpath);
        if (!is_dir($subdir)) {
            // mkdir recursive
            $_dir = $this->cache_dir;
            if (!is_dir($_dir) && !mkdir($_dir)) {
                return false;
            }
            $relative_path = substr($subdir, strlen($this->cache_dir)+1);
            $parts = explode('/', $relative_path);
            foreach ($parts as $part) {
                $_dir .=  '/' . $part;
                if (!is_dir($_dir) && !mkdir($_dir)) {
                    return false;
                }
            }
        }
    }

    /**
     * ソースファイル名(拡張子からフォーマットも)設定
     * @access protected
     */
    function set_source_filename()
    {
        if ($this->requests['filename']) {
            //DBから取得する場合
            $this->source_filename = $this->requests['filename'];
        }

        $pieces = explode('.', $this->source_filename);
        $this->source_format = $this->check_format(array_pop($pieces));
    }

    /**
     * @access protected
     */
    function set_output_format()
    {
        if ($this->requests['f']) {
            // リクエストの f(ormat)に従う
            $this->output_format = $this->check_format($this->requests['f']);
        } else {
            // ソースに従う
            $this->output_format = $this->check_format($this->source_format);
        }
    }

    /**
     * @access protected
     */
    function set_cache_filename()
    {
        $filename = $this->source_filename;
        $w = $this->requests['w'];
        $h = $this->requests['h'];
        $f = $this->output_format;

        $this->cache_fullpath =
                 $this->cache_dir . '/' .
                 $this->get_cache_path($filename, $w, $h, $f);
    }

    /**
     * @access protected
     */
    function check_format($string)
    {
        switch (strtolower($string)) {
        case 'jpg' :
        case 'jpeg':
        default:
            return 'jpg';
        case 'gif':
            return 'gif';
        case 'png':
            return 'png';
        }
    }

    /**
     * static
     */
    function get_cache_path($filename, $w, $h, $f)
    {
        $prefix = OPENPNE_IMG_CACHE_PREFIX;

        if (!$w) $w = '';
        if (!$h) $h = '';
        $file = str_replace('.', '_', $filename) . '.' . $f;

        $path = "{$f}/w{$w}_h{$h}/{$prefix}{$file}";
        return $path;
    }
}

?>
