<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// IP制限
if (!in_array('any', (array)$GLOBALS['_OPENPNE_API_IP_LIST'])) {
    $ip = $_SERVER[SERVER_IP_KEY];
    if (!in_array($ip, (array)$GLOBALS['_OPENPNE_API_IP_LIST'])) {
        exit('Access Denied');
    }
}

?>
