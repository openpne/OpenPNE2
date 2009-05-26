<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/DB.php';


class OpenPNE_DBSession
{
    /**
     * @var OpenPNE_DB
     */
    var $db;

    function OpenPNE_DBSession($dsn)
    {
        $this->db =& new OpenPNE_DB($dsn);
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
        return true;
    }

    function close()
    {
        return true;
    }

    function read($sess_id)
    {
        $sql = 'SELECT sess_data FROM c_session WHERE sess_id = ? AND sess_name = ?';
        $params = array($sess_id, $this->sess_name());
        if ($res = $this->db->get_one($sql, $params)) {
            return $res;
        }
        return '';
    }

    function write($sess_id, $sess_data)
    {
        if (!$sess_id || !$sess_data) return false;

        $data = array(
            'sess_time' => time(),
            'sess_data' => $sess_data,
        );

        // update
        $where = 'sess_id = '.$this->db->quote($sess_id).
                 ' AND sess_name = '.$this->db->quote($this->sess_name());
        if ($this->db->update('c_session', $data, $where) &&
            $this->db->affectedRows()) {
            return true;
        }

        // insert
        $data['sess_id'] = $sess_id;
        $data['sess_name'] = $this->sess_name();
        return (bool)$this->db->insert('c_session', $data);
    }

    function destroy($sess_id)
    {
        $sql = 'DELETE FROM c_session WHERE sess_id = ? AND sess_name = ?';
        $params = array($sess_id, $this->sess_name());
        $res =& $this->db->query($sql, $params);

        if (DB::isError($res)) {
            return false;
        }
        return (bool)$res;
    }

    function gc($maxlifetime)
    {
        $expire = time() - intval($maxlifetime);

        $sql = 'DELETE FROM c_session WHERE sess_time < ? AND sess_name = ?';
        $params = array($expire, $this->sess_name());
        $res =& $this->db->query($sql, $params);

        if (DB::isError($res)) {
            return false;
        }
        return (bool)$res;
    }
}

?>
