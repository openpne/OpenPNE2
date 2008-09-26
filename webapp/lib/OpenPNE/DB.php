<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * PEAR::DB class
 */
require_once 'DB.php';

/**
 * OpenPNE_DB
 *
 * @package OpenPNE
 * @author OGAWA Rinpei <ogawa@tejimaya.com>
 */
class OpenPNE_DB
{
    /**
     * @var DB_mysql
     */
    var $db;

    var $dsn;
    var $readonly = false;

    /**
     * @param mixed $dsn
     * @param bool $readonly
     */
    function OpenPNE_DB($dsn, $readonly = false)
    {
        $this->dsn = $dsn;
        $this->_connect();
        $this->readonly = $readonly;
    }

    /**
     * OpenPNE_DBのインスタンスを返す（Singleton）
     *
     * @return OpenPNE_DB
     */
    function &getInstance()
    {
        static $singleton;
        if (empty($singleton)) {
            $singleton = new OpenPNE_DB();
        }
        return $singleton;
    }

    /**
     * DBに接続する
     *
     * @access private
     */
    function _connect()
    {
        $this->db =& DB::connect($this->dsn);
        if (DB::isError($this->db)) {
            openpne_display_error($this->db->getMessage());
            exit;
        }

        $this->db->setErrorHandling(PEAR_ERROR_CALLBACK, array('OpenPNE_DB', 'errorHandler'));

        $this->db->setFetchMode(DB_FETCHMODE_ASSOC);
        $this->db->query('SET NAMES \'utf8\'');
    }

    /**
     * 先頭行、先頭列の1データを取得する
     *
     * @param string $sql
     * @param array $params for placeholder
     * @return mixed
     */
    function get_one($sql, $params = array())
    {
        $sql = $this->db->modifyLimitQuery($sql, 0, 1, $params);
        $res =& $this->db->getOne($sql, $params);
        if (DB::isError($res)) {
            return null;
        }
        return $res;
    }

    /**
     * 先頭行のデータを取得する
     *
     * @param string $sql
     * @param array $params for placeholder
     * @return array
     */
    function get_row($sql, $params = array())
    {
        $sql = $this->db->modifyLimitQuery($sql, 0, 1, $params);
        $res =& $this->db->getRow($sql, $params);
        if (DB::isError($res)) {
            return array();
        }
        return $res;
    }

    /**
     * 先頭列のデータを取得する
     *
     * @param string $sql
     * @param array $params for placeholder
     * @return array
     */
    function get_col($sql, $params = array())
    {
        $res =& $this->db->getCol($sql, 0, $params);
        if (DB::isError($res)) {
            return array();
        }
        return $res;
    }

    /**
     * 先頭列のデータをlimit付きで取得する
     *
     * @param string $sql
     * @param int $from 開始行
     * @param int $count 最大行数
     * @param array $params for placeholder
     * @return array
     */
    function get_col_limit($sql, $from, $count, $params = array())
    {
        $sql = $this->db->modifyLimitQuery($sql, intval($from), intval($count), $params);
        return $this->get_col($sql, $params);
    }

    /**
     * 先頭列のデータをpaging処理用limit付きで取得する
     *
     * @param string $sql
     * @param int $page 取得するページ番号
     * @param int $count 1ページあたりの最大行数
     * @param array $params for placeholder
     * @return array
     */
    function get_col_page($sql, $page, $count, $params = array())
    {
        $from = (intval($page) - 1) * intval($count);
        return $this->get_col_limit($sql, $from, $count, $params);
    }

    /**
     * 1列目をキー、2列目を値とした連想配列を取得する
     *
     * @param string $sql
     * @param array $params for placeholder
     * @return array
     */
    function get_assoc($sql, $params = array())
    {
        $res =& $this->db->getAssoc($sql, false, $params);
        if (DB::isError($res)) {
            return array();
        }
        return $res;
    }

    /**
     * 1列目をキー、2列目を値とした連想配列をlimit付きで取得する
     *
     * @param string $sql
     * @param int $from 開始行
     * @param int $count 最大行数
     * @param array $params for placeholder
     * @return array
     */
    function get_assoc_limit($sql, $from, $count, $params = array())
    {
        $sql = $this->db->modifyLimitQuery($sql, intval($from), intval($count), $params);
        return $this->get_assoc($sql, $params);
    }

    /**
     * 全列のデータを全行取得する
     *
     * @param string $sql
     * @param array $params for placeholder
     * @return array
     */
    function get_all($sql, $params = array())
    {
        $res =& $this->db->getAll($sql, $params);
        if (DB::isError($res)) {
            return array();
        }
        return $res;
    }

    /**
     * 全列のデータをlimit付きで取得する
     *
     * @param string $sql
     * @param int $from 開始行
     * @param int $count 最大行数
     * @param array $params for placeholder
     * @return array
     */
    function get_all_limit($sql, $from, $count, $params = array())
    {
        $sql = $this->db->modifyLimitQuery($sql, intval($from), intval($count), $params);
        return $this->get_all($sql, $params);
    }

    /**
     * 全列のデータをpaging処理用limit付きで取得する
     *
     * @param string $sql
     * @param int $page 取得するページ番号
     * @param int $count 1ページあたりの最大行数
     * @param array $params for placeholder
     * @return array
     */
    function get_all_page($sql, $page, $count, $params = array())
    {
        $from = (intval($page) - 1) * intval($count);
        return $this->get_all_limit($sql, $from, $count, $params);
    }

    /**
     * @param mixed $in
     * @param bool $is_escape_placeholder
     * @return string
     * @see PEAR::DB::quoteSmart
     */
    function quote($in, $is_escape_placeholder = false)
    {
        $result = $this->db->quoteSmart($in);
        if ($is_escape_placeholder) {
            $search  = array('?', '&', '!');
            $replace = array('\?', '\&', '\!');
            $result = str_replace($search, $replace, $result);
        }
        return $result;
    }

    /**
     * Identifierとして使える文字以外を除去する
     *
     * @static
     * @param string $str
     * @return string
     */
    function escapeIdentifier($str)
    {
        return preg_replace('/[^a-zA-Z0-9_]/', '', $str);
    }

    /**
     * 連想配列からWhere条件節に使える文字列を生成する
     *
     * @param array $where
     * @return string
     */
    function makeWhereClause($where)
    {
        if (!is_array($where)) {
            return $where;
        }

        $_where = '';
        $first = true;
        foreach ($where as $key => $value) {
            if ($first) {
                $first = false;
            } else {
                $_where .= ' AND ';
            }
            $_where .= $key . ' = ' . $this->quote($value, true);
        }
        return $_where;
    }

    /**
     * 任意のクエリを実行する
     *
     * @param string $sql
     * @param array $params
     * @return mixed
     */
    function &query($sql, $params = array())
    {
        return $this->db->query($sql, $params);
    }

    /**
     * insertクエリを生成して実行する
     *
     * @param string $table テーブル名
     * @param array $fields_values 挿入するデータの連想配列
     * @param string $pkey primary key名
     * @return int 成功した場合は挿入した行のprimary id、失敗の場合 false
     */
    function insert($table, $fields_values, $pkey = '')
    {
        if ($this->readonly) {
            return false;
        }

        $seq_name = sprintf('%s_%s', $table, $pkey);
        if ($pkey && ($id = $this->nextId($seq_name))) {
            if (DB::isError($id)) {
                return false;
            }
            $fields_values = array($pkey => $id) + $fields_values;
        }

        $res = $this->db->autoExecute($table, $fields_values, DB_AUTOQUERY_INSERT);
        if (DB::isError($res)) {
            return false;
        }
        return $this->insertId($id);
    }

    /**
     * insertに使用するprimary idを取得する
     *
     * ただし、mysqlの場合はauto_incrementの使用を想定して、nullを返す
     *
     * @param string $seq_name
     * @param bool $ondemand
     * @return int
     */
    function nextId($seq_name = '', $ondemand = true)
    {
        if ($this->db->phptype === 'mysql') {
            return null;
        } else {
            return $this->db->nextId($seq_name, $ondemand);
        }
    }

    /**
     * 直前にinsertされた行のprimary idを返す
     *
     * @param int $id 指定されている場合はそのまま返す
     * @return int
     */
    function insertId($id = null)
    {
        if ($this->db->phptype === 'mysql') {
            return $this->db->getOne('SELECT LAST_INSERT_ID()');
        } else {
            return $id;
        }
    }

    /**
     * updateクエリを生成して実行する
     *
     * @param string $table
     * @param array $fields_values
     * @param array $where
     * @return bool
     */
    function update($table, $fields_values, $where)
    {
        if ($this->readonly) {
            return false;
        }

        $where = $this->makeWhereClause($where);
        $res = $this->db->autoExecute($table, $fields_values, DB_AUTOQUERY_UPDATE, $where);
        if (DB::isError($res)) {
            return false;
        }
        return true;
    }

    /**
     * 直前のクエリが影響を与えた行数を取得
     *
     * @return int
     */
    function affectedRows()
    {
        return $this->db->affectedRows();
    }

    /**
     * エラー処理用をおこなう
     *
     * PEAR_Error のインスタンス作成時に呼ばれるコールバック関数
     *
     * @static
     * @param PEAR_Error $error
     */
    function errorHandler($error)
    {
        if (OPENPNE_DB_ERROR_LOG) {
            require_once 'Log.php';

            $msg = sprintf("msg:-> %s\t info:-> %s", $error->getMessage(), $error->getUserInfo());
            $log = OPENPNE_VAR_DIR . '/log/db_errors.log';
            $file =& Log::singleton('file', $log, 'db', null, PEAR_LOG_ERR);
            $file->log($msg, PEAR_LOG_ERR);
        }
    }
}

?>
