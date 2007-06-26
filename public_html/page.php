<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 * @deprecated File deprecated in Release 1.9.0
 */
// Left for compatibility

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

$q = $_GET;

if (!empty($q['p'])) {
    $action = 'page_' . $q['p'];
    unset($q['p']);
}
unset($q['m']);

$_REQUEST['url'] = openpne_gen_url('pc', $action, $q);
openpne_forward('pc', 'page', 'o_url_changed');

?>
