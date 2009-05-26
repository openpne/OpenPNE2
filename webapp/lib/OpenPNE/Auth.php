<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * PEAR::Auth class
 */
require_once 'Auth.php';

/**
 * 認証処理をおこなうクラス
 *
 * requires PEAR::Auth
 *
 * @package OpenPNE
 * @author OGAWA Rinpei <ogawa@tejimaya.com>
 */
class OpenPNE_Auth
{
    /**
     * @var Auth
     */
    var $auth;

    var $storage = 'DB';
    var $options = '';
    var $is_ktai = false;
    var $is_admin = false;
    var $is_encrypt_username = false;
    var $is_lowercase_username = false;
    var $is_check_user_agent = true;

    var $expire = 0;
    var $idle = 0;
    var $uid = 0;
    var $sess_id = '';
    var $cookie_path = '/';

    /**
     * 設定値の初期化をおこなう
     *
     * $config に渡せる値
     * + storage: PEAR::Authのストレージコンテナ名
     * + options: PEAR::Auth用オプション
     * + is_ktai: 携帯用認証かどうか
     * + is_admin: 管理画面用認証かどうか
     * + is_encrypt_username: usernameをt_encryptで暗号化するかどうか
     * + is_lowercase_username: usernameを強制的に小文字にするかどうか
     *
     * @param array $config
     */
    function OpenPNE_Auth($config = array())
    {
        ini_set('session.use_cookies', 0);
        if (isset($config['is_ktai'])) {
            $this->is_ktai = (bool)$config['is_ktai'];
        }
        if (isset($config['is_admin'])) {
            $this->is_admin = (bool)$config['is_admin'];
        }
        if (isset($config['storage'])) {
            $this->storage = $config['storage'];
        }
        if (isset($config['options'])) {
            $this->options = $config['options'];
        }
        if (isset($config['is_encrypt_username'])) {
            $this->is_encrypt_username = $config['is_encrypt_username'];
        }
        if (isset($config['is_lowercase_username'])) {
            $this->is_lowercase_username = $config['is_lowercase_username'];
        }
        if (isset($config['is_check_user_agent'])) {
            $this->is_check_user_agent = (bool)$config['is_check_user_agent'];
        }

        if ($this->is_ktai) {
            if (!empty($_REQUEST['ksid'])) {
                $this->sess_id = $_REQUEST['ksid'];
                session_id($this->sess_id);
            }
            $this->options['advancedsecurity'] = false;
        } else {
            if (!empty($_COOKIE[session_name()])) {
                $this->sess_id = $_COOKIE[session_name()];
                session_id($this->sess_id);
            }
            // cookie_path を OPENPNE_URLから抜き出す
            $url = parse_url(OPENPNE_URL);
            if (substr($url['path'], -1) != '/') {
                $url['path'] .= '/';
            }
            $this->cookie_path = $url['path'];
        }
    }

    /**
     * PEAR::Authのインスタンスを生成する
     *
     * @param bool $login ログイン処理に使用するかどうか
     * @return Auth
     */
    function &factory($login = false)
    {
        @session_start();
        if ($login) {
            $auth = new Auth($this->storage, $this->options, '', false);
            $auth->setAllowLogin(true);
        } else {
            $auth = new Auth('null');
            $auth->setAllowLogin(false);
        }
        $auth->setExpire($this->expire);
        $auth->setIdle($this->idle);
        return $auth;
    }

    /**
     * リクエストからログイン処理をおこなう
     *
     * @param bool $is_save_cookie クッキーの保存期限を設定するかどうか
     * @return bool
     */
    function login($is_save_cookie = false)
    {
        $this->auth =& $this->factory(true);

        if ($this->is_lowercase_username) {
            $this->auth->post[$this->auth->_postUsername] =
                strtolower($this->auth->post[$this->auth->_postUsername]);
        }

        if ($this->is_encrypt_username) {
            $this->auth->post[$this->auth->_postUsername] =
                t_encrypt($this->auth->post[$this->auth->_postUsername]);
        }

        $this->auth->start();
        if ($this->auth->getAuth()) {
            if (OPENPNE_SESSION_CHECK_URL) {
                $this->auth->setAuthData('OPENPNE_URL', OPENPNE_URL);
            }

            if ($this->is_check_user_agent) {
                $this->auth->setAuthData('USER_AGENT', $_SERVER['HTTP_USER_AGENT']);
            }

            $this->sess_id = session_id();
            if (!$this->is_ktai) {
                if ($is_save_cookie) {
                    $expire = time() + 2592000; // 30 days
                } else {
                    $expire = 0;
                }
                setcookie(session_name(), session_id(), $expire, $this->cookie_path);
            }
            return true;
        } else {
            return false;
        }
    }

    /**
     * 認証処理をおこなう
     *
     * @return bool 認証が成功したかどうか
     */
    function auth()
    {
        if (!$this->sess_id) {
            return false;
        }
        $this->auth =& $this->factory();
        return $this->checkAuth();
    }

    /**
     * ログアウト処理をおこなう
     *
     * @return bool
     */
    function logout()
    {
        if (!$this->auth) {
            if (!$this->sess_id) {
                return true;
            }
            $this->auth =& $this->factory();
        }

        if ($this->is_admin) {
            db_admin_update_c_admin_user_delete_sess_id(session_id());
        } else {
            db_member_update_c_member_secure_delete_sess_id(session_id());
        }
        if (isset($_COOKIE[session_name()])) {
            if (!$this->is_ktai) {
                setcookie(session_name(), '', time() - 3600, $this->cookie_path);
            }
        }
        $_SESSION = array();
        session_destroy();
        unset($this->auth);

        $this->set_session_save_handler();
        return true;
    }

    /**
     * セッションの生成時からの有効期限を設定する
     *
     * @param int $expiretime
     */
    function setExpire($expiretime)
    {
        $this->expire = $expiretime;
    }

    /**
     * セッションの最終アクセス時からの有効期限を設定する
     *
     * @param int $idletime
     */
    function setIdle($idletime)
    {
        $this->idle = $idletime;
    }

    /**
     * uid getter/setter
     *
     * @param string $uid
     * @return string
     */
    function uid($uid = '')
    {
        if ($uid) {
            $this->uid = $uid;
        }
        return $this->uid;
    }

    /**
     * PEAR::Auth側のusernameを返す
     *
     * @return string
     */
    function getUsername()
    {
        return $this->auth->getUsername();
    }

    /**
     * セッションハンドラを設定する
     *
     * @static
     */
    function set_session_save_handler()
    {
        static $sess_storage;
        if (is_null($sess_storage)) {
            switch (SESSION_STORAGE) {
            case 1:
                include_once 'OpenPNE/DBSession.php';
                $sess_storage = new OpenPNE_DBSession(db_get_dsn('session'));
                break;
            case 2:
                include_once 'OpenPNE/MemcacheSession.php';
                $sess_storage = new OpenPNE_MemcacheSession($GLOBALS['_OPENPNE_MEMCACHE_LIST']['session']['dsn']);
                break;
            default:
                return;
            }
        }

        if (!is_null($sess_storage)) {
            session_set_save_handler(array(&$sess_storage, 'open'),
                                 array(&$sess_storage, 'close'),
                                 array(&$sess_storage, 'read'),
                                 array(&$sess_storage, 'write'),
                                 array(&$sess_storage, 'destroy'),
                                 array(&$sess_storage, 'gc'));
        }
    }

    /**
     * checkAuth
     *
     * PEAR::Auth標準の認証処理に加えて、OPENPNE_URL及び
     * USER_AGENTのチェックもおこなう
     *
     * @return bool
     * @see PEAR::Auth::checkAuth
     */
    function checkAuth()
    {
        if (!$this->auth->checkAuth()) {
            return false;
        }
        if (OPENPNE_SESSION_CHECK_URL) {
            $openpne_url = $this->auth->getAuthData('OPENPNE_URL');
            if ($openpne_url !== OPENPNE_URL) {
                return false;
            }
        }
        if ($this->is_check_user_agent) {
            $login_user_agent = $this->auth->getAuthData('USER_AGENT');
            $now_user_agent = $_SERVER['HTTP_USER_AGENT'];

            // ドコモ端末からのアクセスの場合、ユーザエージェント情報から個体識別情報を取り除く
            if ($GLOBALS['__Framework']['carrier'] == 'i') {
                if (strncmp($now_user_agent, 'DoCoMo/1.0', 10) === 0) {
                    $login_user_agent = substr($login_user_agent, 0, strpos($login_user_agent, '/ser'));
                    $now_user_agent   = substr($now_user_agent, 0, strpos($now_user_agent, '/ser'));
                } elseif (strncmp($now_user_agent, 'DoCoMo/2.0', 10) === 0) {
                    $login_user_agent = substr($login_user_agent, 0, strpos($login_user_agent, '('));
                    $now_user_agent   = substr($now_user_agent, 0, strpos($now_user_agent, '('));
                }
            }

            if ($now_user_agent !== $login_user_agent) {
                return false;
            }
        }
        return true;
    }
}

?>
