<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 * @deprecated File deprecated in Release 1.9.0
 */
// Left for compatibility

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

if ($_REQUEST['cmd'] == 'login') {
    $_REQUEST['m'] = 'pc';
    $_REQUEST['a'] = 'do_o_login';
    openpne_execute();
} else {
    openpne_redirect('pc');
}

?>
