<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_api_get_member_token($c_member_id)
{
    $sql = 'SELECT token FROM c_api_member WHERE c_member_id = ?';
    $params = array(intval($c_member_id));
    if ($token = db_get_one($sql, $params)) {
        return $token;
    } else {
        return db_api_insert_token($c_member_id);
    }
}

?>
