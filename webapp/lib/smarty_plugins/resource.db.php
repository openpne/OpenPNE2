<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_resource_db_source($tpl_name, &$tpl_source, &$smarty)
{
    $sql = 'SELECT source FROM c_template WHERE name = ?';
    $params = array(strval($tpl_name));
    if ($res = db_get_one($sql, $params)) {
        $tpl_source = $res;
        return true;
    } else {
        return false;
    }
}

function smarty_resource_db_timestamp($tpl_name, &$tpl_timestamp, &$smarty)
{
    $sql = 'SELECT r_datetime FROM c_template WHERE name = ?';
    $params = array(strval($tpl_name));
    if ($res = db_get_one($sql, $params)) {
        $tpl_timestamp = strtotime($res);
        return true;
    } else {
        return false;
    }
}

function smarty_resource_db_secure($tpl_name, &$smarty)
{
    return true;
}

function smarty_resource_db_trusted($tpl_name, &$smarty)
{
}

?>
