<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiMail.php';

/**
 * OpenPNE_KtaiMail_RPC
 * 携帯メール用のメールデコーダ
 */
class OpenPNE_KtaiMail_RPC extends OpenPNE_KtaiMail
{
    /**
     * @var array XML_RPCが取得したパラメータ配列
     */
    var $rpc_value;

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
    function OpenPNE_KtaiMail_RPC($options = array())
    {
        parent::OpenPNE_KtaiMail($options);
    }

    /**
     * メールをデコード
     *
     * @access public
     * @param array $rpc_value XML_RPCが取得したパラメータ配列
     */
    function assign($rpc_value)
    {
        $this->rpc_value = $rpc_value;
    }

    /**
     * ヘッダー(From:)から送信元メールアドレスを取得
     *
     * @access public
     * @return string Fromメールアドレス
     */
    function get_from()
    {
        return $this->rpc_value['from'];
    }

    /**
     * ヘッダー(To:)から宛先メールアドレスを取得
     *
     * @access public
     * @return string Toメールアドレス
     */
    function get_to()
    {
        return $this->rpc_value['to'];
    }

    /**
     * Subject の内容を抽出(＋文字コード変換)
     *
     * @access public
     * @return string Subject
     */
    function get_subject()
    {
        return $this->rpc_value['subject'];
    }

    /**
     * メール本文からテキストを抽出(＋文字コード変換)
     *
     * @access public
     * @return string メール本文のテキスト
     */
    function get_text_body()
    {
        return $this->rpc_value['text_body'];
    }

    /**
     * メールから画像データを抽出
     *
     * @access public
     * @return array 画像データ配列
     */
    function get_images()
    {
        $image_data = base64_decode($this->rpc_value['imagedata']);
        if ($this->_check_image($image_data)) {
            return array($image_data);
        }
        return false;
    }

    /** @access private */
    function _check_image(&$image_data)
    {
        // 画像かどうかチェック
        if (!@imagecreatefromstring($image_data)) {
            return array();
        }

        // 一時ファイルを作成
        $tmpfname = tempnam($this->img_tmp_dir, $this->img_tmp_prefix);

        $fp = fopen($tmpfname, 'wb');
        fwrite($fp, $image_data);
        fclose($fp);

        // 画像サイズのチェック
        if ($this->img_max_filesize && filesize($tmpfname) > $this->img_max_filesize) {
            unlink($tmpfname);
            return array();
        }

        // 画像が正しいかどうかチェック
        switch (strtolower($mail->ctype_secondary)) {
        case 'jpeg':
            if (!@imagecreatefromjpeg($tmpfname)) $image_data = '';
            break;
        case 'gif':
            if (!@imagecreatefromgif($tmpfname)) $image_data = '';
            break;
        case 'png':
            if (!@imagecreatefrompng($tmpfname)) $image_data = '';
            break;
        }
        unlink($tmpfname);

        if ($image_data) {
            return true;
        }

        return false;
    }
}

?>
