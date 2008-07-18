<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/DB.php';

class OpenPNE_DB_Writer extends OpenPNE_DB
{
    function OpenPNE_DB_Writer($dsn)
    {
        parent::OpenPNE_DB($dsn);
    }

    function &query($sql, $params = array())
    {
        return $this->db->query($sql, $params);
    }

    function insert($table, $fields_values, $pkey = '')
    {
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

    function nextId($seq_name = '', $ondemand = true)
    {
        if ($this->db->phptype == 'mysql') {
            return null;
        } else {
            return $this->db->nextId($seq_name, $ondemand);
        }
    }

    function insertId($id = null)
    {
        if ($this->db->phptype == 'mysql') {
            return $this->db->getOne('SELECT LAST_INSERT_ID()');
        } else {
            return $id;
        }
    }

    function update($table, $fields_values, $where)
    {
        $where = $this->makeWhereClause($where);
        $res = $this->db->autoExecute($table, $fields_values, DB_AUTOQUERY_UPDATE, $where);
        if (DB::isError($res)) {
            return false;
        }
        return true;
    }

    function affectedRows()
    {
        return $this->db->affectedRows();
    }
}

?>
