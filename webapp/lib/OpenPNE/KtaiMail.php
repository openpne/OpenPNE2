<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 * @author Ogawa ogawa@tejimaya.com
 * @author Masaki Miyashita miyasita@zenzy.net
 */

// PEAR::Mail_mimeDecode
require_once 'Mail/mimeDecode.php';
require_once 'util.inc.php';

/**
 * OpenPNE_KtaiMail
 * 携帯メール用のメールデコーダ
 */
class OpenPNE_KtaiMail
{
    /**
     * デコード結果
     * @var stdClass
     */
    var $mail;

    /** @var string 変換元文字エンコーディング(デフォルト値) */
    var $from_encoding = 'auto';

    /** @var string 変換先文字エンコーディング */
    var $to_encoding = 'UTF-8';

    /** @var string 画像検証用のテンポラリディレクトリ */
    var $img_tmp_dir;

    /** @var string 画像検証用のテンポラリファイルの接頭辞 */
    var $img_tmp_prefix = 'OpenPNE_KtaiMail_';

    /** @var string 画像の最大ファイルサイズ(byte) */
    var $img_max_filesize;

    /** @var bool 全角スペースを削除するかどうか */
    var $trim_doublebyte_space = true;

    /**
     * constructor
     *
     * @access public
     * @param string $options
     *      - from_encoding    : 変換元文字エンコーディング
     *      - to_encoding      : 変換先文字エンコーディング
     *      - img_tmp_dir      : 画像検証用のテンポラリディレクトリ
     *      - img_tmp_prefix   : 画像検証用のテンポラリファイルの接頭辞
     *      - img_max_filesize : 画像の最大ファイルサイズ
     *      - trim_doublebyte_space : 全角スペースを削除するかどうか
     */
    function OpenPNE_KtaiMail($options = array())
    {
        foreach ($options as $key => $value) {
            switch ($key) {
            case 'from_encoding':
                $this->from_encoding = $value;
                break;
            case 'to_encoding':
                $this->to_encoding = $value;
                break;
            case 'img_tmp_dir':
                $this->img_tmp_dir = $value;
                break;
            case 'img_tmp_prefix':
                $this->img_tmp_prefix = $value;
                break;
            case 'img_max_filesize':
                $this->img_max_filesize = $value;
                break;
            case 'trim_doublebyte_space':
                $this->trim_doublebyte_space = (bool)$value;
                break;
            }
        }
    }

    /**
     * メールをデコード
     *
     * @access public
     * @param string メールの生データ
     */
    function decode($raw_mail)
    {
        $params['include_bodies'] = true;
        $params['decode_bodies']  = true;
        $params['decode_headers'] = true;
        $params['input'] = $raw_mail;

        $this->mail =& Mail_mimeDecode::decode($params);
    }

    /**
     * ヘッダー(From:)から送信元メールアドレスを取得
     *
     * @access public
     * @return string Fromメールアドレス
     */
    function get_from()
    {
        return $this->_get_mail_address($this->mail->headers['from']);
    }

    /**
     * ヘッダー(To:)から宛先メールアドレスを取得
     *
     * @access public
     * @return string Toメールアドレス
     */
    function get_to()
    {
        return $this->_get_mail_address($this->mail->headers['to']);
    }

    /**
     * Subject の内容を抽出(＋文字コード変換)
     *
     * @access public
     * @return string Subject
     */
    function get_subject()
    {
        return isset($this->mail->headers['subject']) ?
                    $this->convert_text($this->mail->headers['subject']) : '';
    }

    /**
     * メール本文からテキストを抽出(＋文字コード変換)
     *
     * @access public
     * @return string メール本文のテキスト
     */
    function get_text_body()
    {
        return $this->_get_text_body($this->mail);
    }

    /** @access private */
    function _get_text_body(&$mail)
    {
        $body = '';

        if (isset($mail->parts) && is_array($mail->parts)) {
            // multipart
            foreach ($mail->parts as $part) {
                if ($body = $this->_get_text_body($part)) break;
            }
        } elseif (strtolower($mail->ctype_primary) === 'text' &&
                  strtolower($mail->ctype_secondary) === 'plain') {
            $body = $mail->body;
            $charset = $mail->ctype_parameters['charset'];

            $body = $this->convert_text($body, $charset);
        }

        return $body;
    }

    /**
     * メールから画像データを抽出
     *
     * @access public
     * @return array 画像データ配列
     */
    function get_images()
    {
        return $this->_get_images($this->mail);
    }

    /** @access private */
    function _get_images(&$mail)
    {
        $allowed_type = array('jpeg', 'gif', 'png');
        $images = array();

        if (isset($mail->parts) && is_array($mail->parts)) {
            // multipart
            foreach ($mail->parts as $part) {
                $item = $this->_get_images($part);
                if ($item === false) {
                    return false;
                }

                $images = array_merge($images, $item);
            }
        } elseif (strtolower($mail->ctype_primary) === 'image' &&
                  in_array(strtolower($mail->ctype_secondary), $allowed_type)) {
            $image_data = $mail->body;
            $image_ext = '';

             // 画像かどうかチェック
            if (!@imagecreatefromstring($image_data)) {
                // base64_decodeしてリトライ
                $image_data = base64_decode($image_data);
                if (!@imagecreatefromstring($image_data)) {
                    return false;
                }
            }

            // 一時ファイルを作成
            $tmpfname = tempnam($this->img_tmp_dir, $this->img_tmp_prefix);

            $fp = fopen($tmpfname, 'wb');
            fwrite($fp, $image_data);
            fclose($fp);

            // 画像サイズのチェック
            $image_size = filesize($tmpfname);
            if ($this->img_max_filesize && $image_size > $this->img_max_filesize) {
                unlink($tmpfname);
                return false;
            }

            // 画像のリサイズ
            list($width, $height, $type, $attr) = @getimagesize($tmpfname);
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
                resize_image($type, $tmpfname, $tmpfname, $original_width, $original_height, $width, $height);
                $fp = fopen($tmpfname, 'rb');
                $image_size = filesize($tmpfname);
                $image_data = fread($fp, $image_size);  // 一時ファイルを再度読み込み
                fclose($fp);
            }

            // 画像が正しいかどうかチェック
            switch (strtolower($mail->ctype_secondary)) {
            case 'jpeg':
                if (!@imagecreatefromjpeg($tmpfname)) {
                    $image_data = '';
                } else {
                    $image_ext = 'jpg';
                }
                break;
            case 'gif':
                if (!@imagecreatefromgif($tmpfname)) {
                    $image_data = '';
                } else {
                    $image_ext = 'gif';
                }
                break;
            case 'png':
                if (!@imagecreatefrompng($tmpfname)) {
                    $image_data = '';
                } else {
                    $image_ext = 'png';
                }
                break;
            }
            $filesize = filesize($tmpfname);
            unlink($tmpfname);

            if ($image_data && $image_ext) {
                $images = array(array('data' => $image_data, 'ext' => $image_ext, 'filesize' => $image_size));
            } else {
                return false;
            }
        }

        return $images;
    }

    /**
     * 文字列からメールアドレスを抽出
     *
     * @access private
     * @param string $str 入力文字列
     * @return string メールアドレス
     */
    function _get_mail_address($str)
    {
        if (!$str) {
            return false;
        }

        // "(ダブルクォーテーション)を取り除く
        // "example"@docomo.ne.jp
        $str = str_replace('"', '', $str);

        // <example@docomo.ne.jp> というメールアドレスになることがある。
        //   日本語 <example@docomo.ne.jp>
        // のような場合に複数マッチする可能性があるので、
        // マッチした最後のものを取ってくるように変更
        $matches = array();
        $regx = '/([\.\w!#$%&\'*+\-\/=?^`{|}~]+@[\w!#$%&\'*+\-\/=?^`{|}~]+(\.[\w!#$%&\'*+\-\/=?^`{|}~]+)*)/';
        if (preg_match_all($regx, $str, $matches)) {
            return array_pop($matches[1]);
        }

        return false;
    }

    function convert_text_core($str)
    {
        $result = "";

        for ($i = 0; $i < strlen($str); $i++) {
            $c = 0;
            $c1 = ord($str[$i]);
            $c2 = ord($str[$i]);

            // E-mail用絵文字から携帯用絵文字に変換
            if ($c1 == 0xED || $c1 ==0xEE) {  // [e:358] ～ [e:499]、[e:700]～
                $c = hexdec(bin2hex(substr($str, $i, 2))) + 1536;
            } elseif ($c1 == 0xEB || $c1 == 0xEC) {  // [e:1]～[e:357]、[e:500]～[e:518]
                $c = hexdec(bin2hex(substr($str, $i, 2))) + 2816;
            }

            if ($c) {
                $bin = array();
                $bin[0] = chr($c >> 8);
                $bin[1] = chr($c - ($bin[0] << 8));
                $emoji = emoji_escape_e($bin);
                $result .= $emoji;
                $i++;
            } else {
                $result .= $str[$i];
                if ((0x81 <= $c1 && $c1 <= 0x9F) || 0xE0 <= $c1) {
                    $result .= $str[$i+1];
                    $i++;
                }
            }
        }

        return $result;
    }

    /**
     * 文字エンコーディングの変換、空白文字の削除
     *
     * @access public
     * @param string $str 変換前の文字列
     * @param string $from_encoding
     * @param string $to_encoding
     * @return string 変換後の文字列
     */
    function convert_text($str, $from_encoding = '', $to_encoding = '')
    {
        if (!$from_encoding) {
            $from_encoding = $this->from_encoding;
        }

        if (!$to_encoding) {
            $to_encoding = $this->to_encoding;
        }

        $from_addr = explode('@', $this->get_from());
        $domain = array_pop($from_addr);

        if ($domain == 'ezweb.ne.jp') {  // auは絵文字変換もおこなう
            // 絵文字変換をするため、いったんShift_JISに変換
            $str = mb_convert_encoding($str, 'SJIS-win', $from_encoding);

            // 絵文字変換
            $str = $this->convert_text_core($str);

            // 文字エンコーディング変換
            $str = mb_convert_encoding($str, $to_encoding, 'SJIS-win');
        } else {
            $str = mb_convert_encoding($str, $to_encoding, $from_encoding);
        }

        // 空白文字の削除
        $str = str_replace("\0", '', $str);
        if ($this->trim_doublebyte_space) {
            $str = mb_ereg_replace('([\s　])+$', '', $str);
        } else {
            $str = rtrim($str);
        }

        return $str;
    }
}

?>
