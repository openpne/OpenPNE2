<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// PEAR::Auth
require_once 'Auth.php';


class OpenPNE_Auth
{
    /**
     * @var Auth
     */
    var $auth;

    var $storage;
    var $options;
    var $expire = 0;
    var $idle   = 0;
    var $uid;
    var $sess_id;
    var $cookie_path;
    var $is_ktai;

    function OpenPNE_Auth($storageDriver = 'DB', $options = '', $is_ktai = false)
    {
        ini_set('session.use_cookies', 0);
        $this->is_ktai = $is_ktai;
        if ($this->is_ktai) {
            if (!empty($_REQUEST['ksid'])) {
                $this->sess_id = $_REQUEST['ksid'];
                session_id($this->sess_id);
            }
        } else {
            if (!empty($_COOKIE[session_name()])) {
                $this->sess_id = $_COOKIE[session_name()];
                session_id($this->sess_id);
            }
        }
        $this->storage = $storageDriver;
        $this->options = $options;
        $this->set_cookie_params();
    }

    function set_cookie_params()
    {
        $url = parse_url(OPENPNE_URL);
        if (substr($url['path'], -1) != '/') {
            $url['path'] .= '/';
        }
        $this->cookie_path = $url['path'];
    }

    function &factory($login = false)
    {
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

    function login($is_save_cookie = false, $is_encrypt_username = false, $is_ktai = false)
    {
        $this->auth =& $this->factory(true);
        if ($is_encrypt_username) {
            switch (LOGIN_NAME_TYPE) {
                case 0:
                $this->auth->post[$this->auth->_postUsername] =
                    db_member_c_member_id4username($this->auth->post[$this->auth->_postUsername], $is_ktai);
                break;
                default:
                break;
            }
        }

        $this->auth->start();
        if ($this->auth->getAuth()) {
            if (OPENPNE_SESSION_CHECK_URL) {
                $this->auth->setAuthData('OPENPNE_URL', OPENPNE_URL);
            }

            $this->sess_id = session_id();
            if ($is_save_cookie) {
                $expire = time() + 2592000; // 30 days
            } else {
                $expire = 0;
            }
            if (!$this->is_ktai) {
                setcookie(session_name(), session_id(), $expire, $this->cookie_path);
            }
            return true;
        } else {
            return false;
        }
    }

    function auth()
    {
        if (!$this->sess_id) {
            return false;
        }
        $this->auth =& $this->factory();
        return $this->checkAuth();
    }

    function logout()
    {
        if (!$this->auth) {
            if (!$this->sess_id) {
                return true;
            }
            $this->auth =& $this->factory();
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
    }

    function setExpire($expiretime)
    {
        $this->expire = $expiretime;
    }

    function setIdle($idletime)
    {
        $this->idle = $idletime;
    }

    function uid($uid = '')
    {
        if ($uid) {
            $this->uid = $uid;
        }
        return $this->uid;
    }

    function getUsername($LOGIN_NAME_TYPE = 0)
    {
        $username = $this->auth->getUsername();
        switch ($LOGIN_NAME_TYPE) {
            case 1:
            $username = db_member_c_member_id4username($username);
            break;
            default :
            break;
        }
        return $username;
    }

    /**
     * static set_session_save_handler()
     */
    function set_session_save_handler()
    {
        if (SESSION_SAVE_DB) {
            static $dbsess;
            if (is_null($dbsess)) {
                include_once 'OpenPNE/DBSession.php';
                $dbsess = new OpenPNE_DBSession(db_get_dsn('session'));
            }
            session_set_save_handler(array(&$dbsess, 'open'),
                                     array(&$dbsess, 'close'),
                                     array(&$dbsess, 'read'),
                                     array(&$dbsess, 'write'),
                                     array(&$dbsess, 'destroy'),
                                     array(&$dbsess, 'gc'));
        }
    }

    function checkAuth()
    {
        if ($this->auth->checkAuth()) {
            if (OPENPNE_SESSION_CHECK_URL) {
                $openpne_url = $this->auth->getAuthData('OPENPNE_URL');
                if ($openpne_url == OPENPNE_URL) {
                    return true;
                }
            } else {
                return true;
            }
        }
        return false;
    }
}

?>
