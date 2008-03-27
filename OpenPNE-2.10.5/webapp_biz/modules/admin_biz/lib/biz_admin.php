<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// admin モジュール用 DB接続ライブラリ

function biz_admin_updateConfig($name, $value)
{
    $sql = "UPDATE biz_admin_config" .
        " SET value = ?".
        " WHERE name = ?";

    $params = array(
        $value,
        $name,
    );


    db_query($sql, $params);
}

function biz_admin_c_admin_config4name($name)
{
    $sql = "SELECT value FROM biz_admin_config" .
        " WHERE name = ?";

    $params = array(
        $name,
    );


    return db_get_one($sql, $params);
}

function biz_admin_c_admin_config_all()
{
    $sql = "SELECT name, value FROM biz_admin_config";
    return db_get_assoc($sql);
}


//SHISETSU
function biz_admin_getShisetsuList()
{
    $sql = "SELECT * FROM biz_shisetsu";
    return db_get_all($sql);
}

function admin_biz_client_redirect($p, $msg = '', $tail = '')
{
    $hash_tbl =& AdminHashTable::singleton();

    $m = ADMIN_BIZ_MODULE_NAME;
    $p = $hash_tbl->hash($p);

    if (OPENPNE_ADMIN_URL) {
        $url = OPENPNE_ADMIN_URL;
    } else {
        $url = OPENPNE_URL;
    }

    $url .= "?m=$m&a=page_$p";
    if ($tail) $url .= "&$tail";
    if ($msg)  $url .= '&msg=' . urlencode($msg);

    client_redirect_absolute($url);
}

?>
