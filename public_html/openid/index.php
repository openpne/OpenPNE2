<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

chdir('../');
require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

openpne_forward('openid', 'page', 'home');

?>
