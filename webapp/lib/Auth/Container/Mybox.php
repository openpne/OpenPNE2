<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * Include PEAR::Auth_Container base class
 */
require_once 'Auth/Container.php';


/**
 * OpenPNE でマイボックス認証をおこなうための storage driver
 *
 * このコンテナでは xpid と pswd のふたつのオプションを指定する。
 *    + xpid : マイボックスサービス番号
 *    + pswd : 認証コード
 *
 * IP側ユーザ番号については、事前に発行しておく必要がある。
 *
 * マイボックス認証をおこなうためのログインフォームは以下のようなHTMLになる。
 * <form action="http://sns.example.com/" method="get">
 *     <input type="hidden" name="m" value="ktai">
 *     <input type="hidden" name="a" value="do_o_login">
 *     <input type="hidden" name="key" value="mybox">
 *     <input type="submit" value="Login">
 * </form>
 *
 * ただし PEAR::Auth が POST リクエスト前提で設計されているため、PEAR::Auth の
 * コンストラクタが呼ばれるより前（たとえば config.php）に以下のようなコードを
 * 記述しておくこと。
 * if (is_null($_POST['username']) && $_GET['key'] == 'mybox' && !is_null($_SERVER['HTTP_X_CUID'])) {
 *     $_POST['username'] = $_SERVER['HTTP_X_CUID'];
 * }
 *
 * @package Auth
 * @author Kousuke Ebihara <ebihara@tejimaya.com>
 */
class Auth_Container_Mybox extends Auth_Container
{
    /**
     * アプリケーション側から指定されるオプション
     *
     * @var array
     */
    var $options = array();

    /**
     * XPID（マイボックスサービス番号）
     *
     * @var string
     */
    var $xpid = '';

    /**
     * PSWD（認証コード）
     *
     * @var string
     */
    var $pswd = '';

    /**
     * CUID（IP側ユーザ番号）
     *
     * @var string
     */
    var $cuid = '';

    /**
     * Constructor for Mybox Container
     *
     * @param array $params
     */
    function Auth_Container_Mybox($params)
    {
        $this->options = $params;
    }

    /**
     * マイボックス認証をおこなう
     *
     * $username には $_SERVER['HTTP_X_CUID'] の値が渡るようにする必要がある。
     *
     * @param string $username
     * @param string $password
     * @return bool
     */
    function fetchData($username = '', $password = '')
    {
        // HTTP拡張ヘッダからマイボックス認証に必要なパラメータを取得する
        if (isset($_SERVER['HTTP_X_XPID'])) {
            $this->xpid = $_SERVER['HTTP_X_XPID'];
        }

        if (isset($_SERVER['HTTP_X_PSWD'])) {
            $this->pswd = $_SERVER['HTTP_X_PSWD'];
        }

        if (isset($_SERVER['HTTP_X_CUID'])) {
            $this->cuid = $_SERVER['HTTP_X_CUID'];
        }

        // XPID, CUID, PSWD が取得できない
        if (!$this->xpid && !$this->pswd && !$this->cuid) {
            return false;
        }

        // 取得した XPID, PSWD がオプションの設定値と一致しない
        if ($this->xpid != $this->options['xpid'] && $this->pswd != $this->options['pswd']) {
            return false;
        }

        // 取得した CUID と フォームからの入力値が一致しない
        if ($this->cuid != $username) {
            return false;
        }

        return true;
    }
}
?>
