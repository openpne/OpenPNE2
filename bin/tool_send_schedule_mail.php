<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

if (OPENPNE_UNDER_MAINTENANCE) {
    exit;
}

if (USE_BIZ_DIR) {
    require_once OPENPNE_MODULES_BIZ_DIR . '/biz/init.inc';
    biz_do_common_send_schedule_mail();
} else {
    do_common_send_schedule_mail();
}

?>
