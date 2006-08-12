<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function db_admin_c_image4c_image_id($c_image_id)
{
    $db =& db_get_instance('image');

    $sql = 'SELECT * FROM c_image WHERE c_image_id = ?';
    $params = array(intval($c_image_id));
    return $db->get_row($sql, $params);
}

function db_admin_is_c_image4filename($filename)
{
    if (!$filename) return false;

    $db =& db_get_instance('image');

    $sql = 'SELECT c_image_id FROM c_image WHERE filename = ?';
    $params = array($filename);
    return (bool)$db->get_one($sql, $params);
}

function db_admin_c_image_list($page, $page_size, &$pager)
{
    $db =& db_get_instance('image');

    $sql = 'SELECT c_image_id FROM c_image ORDER BY c_image_id DESC';
    $id_list = db_get_col_page($sql, $page, $page_size);

    $c_image_list = array();
    foreach ($id_list as $c_image_id) {
        $sql = 'SELECT c_image_id, filename, r_datetime FROM c_image WHERE c_image_id = ?';
        $params = array(intval($c_image_id));
        $c_image_list[] = db_get_row($sql, $params);
    }

    $sql = 'SELECT COUNT(*) FROM c_image';
    $total_num = $db->get_one($sql);

    $pager = admin_make_pager($page, $page_size, $total_num);
    return $c_image_list;
}

?>
