<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

if (!OPENPNE_IS_OPENID_SERVER) {
    exit;
}

$GLOBALS['__Framework']['default_page'] = 'home';

// 定数定義
if (!defined('Auth_OpenID_RAND_SOURCE')) {
    define('Auth_OpenID_RAND_SOURCE', null);
}
if (!defined('OPENPNE_OPENID_URL_HEAD')) {
    define('OPENPNE_OPENID_URL_HEAD', openpne_gen_url_head('openid', 'page_home') . 'openid/');
}

// ライブラリ読み込み
require_once openpne_ext_search('openid/lib/util.php');

?>
