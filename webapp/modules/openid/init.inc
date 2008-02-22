<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */


//デフォルトページ
$GLOBALS['__Framework']['default_page'] = 'h_home';

//<PCKTAI
if (!OPENPNE_ENABLE_KTAI) {
    // disable pc module
    exit;
}
//>

//<OpenID
if (!(defined('IS_OPENID_PROVIDER') && IS_OPENID_PROVIDER)) {
    // disable pc module
//    exit;
}
//>

function init_openid_page(&$smarty)
{
    
}

function init_openid_do()
{
}

?>
