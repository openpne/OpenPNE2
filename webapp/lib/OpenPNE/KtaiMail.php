<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// PEAR::Mail_mimeDecode
require_once 'Mail/mimeDecode.php';

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
            if ($this->img_max_filesize && filesize($tmpfname) > $this->img_max_filesize) {
                unlink($tmpfname);
                return false;
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
            unlink($tmpfname);

            if ($image_data && $image_ext) {
                $images = array(array('data' => $image_data, 'ext' => $image_ext));
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

        // <example@docomo.ne.jp> というアドレスになることがある。
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
        if (!$from_encoding) $from_encoding = $this->from_encoding;
        if (!$to_encoding)   $to_encoding = $this->to_encoding;

        $str = mb_convert_encoding($str, $to_encoding, $from_encoding);

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
