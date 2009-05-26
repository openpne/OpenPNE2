<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class OpenPNE_MemcacheSession
{
    /**
     * @var Memcache
     */
    var $dsn;
    var $memcache;

    function OpenPNE_MemcacheSession($dsn)
    {
        $this->dsn = $dsn;
        $this->memcache = new Memcache();
    }

    /**
     * sess_nameを取得/変更する
     *
     * メンバ変数で値を保持できないようなので
     * 仕方なくstatic変数で値を保持しておく
     */
    function sess_name($name = '')
    {
        static $sess_name;
        if ($name) {
            $sess_name = $name;
        }
        return $sess_name;
    }

    function open($save_path, $sess_name)
    {
        $this->sess_name($sess_name);

        $this->memcache->addServer($this->dsn['hostspec']);
        $is_connect = @$this->memcache->pconnect($this->dsn['hostspec']);
        if ($is_connect === false) {
            openpne_display_error();
            exit;
        }
        return true;
    }

    function close()
    {
        return true;
    }

    function read($sess_id)
    {
        if ($res = $this->memcache->get($sess_id)) {
            return $res;
        }
        return '';
    }

    function write($sess_id, $sess_data)
    {
        if (!$sess_id || !$sess_data) return false;

        $session_life_time = ini_get("session.gc_maxlifetime");
        return $this->memcache->set($sess_id, $sess_data, 0, $session_life_time);
    }

    function destroy($sess_id)
    {
        return $this->memcache->delete($sess_id);
    }

    function gc($maxlifetime)
    {
        return true;
    }
}

?>
