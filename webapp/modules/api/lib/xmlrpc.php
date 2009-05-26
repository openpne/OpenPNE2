<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function xmlrpc_get_response($params)
{
    return new XML_RPC_Response(XML_RPC_encode($params));
}

function xmlrpc_get_fault_response($code, $string = '')
{
    return new XML_RPC_Response(0, $code, $string);
}

/// utility functions

/**
 * 日時を YYYYMMDDHHMMSS形式 に変換する
 *
 * @param string $date_string
 * @return string YYYYMMDDHHSS
 */
function xmlrpc_get_date($date_string)
{
    return date('YmdHis', strtotime($date_string));
}

/**
 * 画像のURLを取得する
 *
 * @param string $image_filename
 * @param string $no_image image_filenameが空の場合にno_image.gifに置換するかどうか
 * @return string 画像のURL
 */
function xmlrpc_get_image_url($image_filename = '', $no_image = true)
{
    if (!$image_filename) {
        if (!$no_image) {
            return '';
        }
        $image_filename = db_get_c_skin_filename4skinname('no_image');
    }

    if (OPENPNE_IMG_URL) {
        $path = OPENPNE_IMG_URL;
    } else {
        $path = OPENPNE_URL . 'img.php';
    }

    return $path . '?filename=' . $image_filename;
}

?>
