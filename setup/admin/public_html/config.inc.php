<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

define('OPENPNE_DIR', realpath('../'));
require_once OPENPNE_DIR . '/config.php';

// 管理画面のベースURL設定
define('OPENPNE_ADMIN_URL', 'http://admin.example.com/');

// 無効にするモジュール
$GLOBALS['_OPENPNE_DISABLE_MODULES'] = array('pc', 'ktai');

?>
