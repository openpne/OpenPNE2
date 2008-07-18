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

require_once 'Mail/Queue.php';

$db_opt = array(
    "type"=>"db",
    "dsn"=>$GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn'],
    "mail_table"=>"mail_queue",
);
$mail_opt = array(
    "driver"=>"mail",
);
$mail_queue  = new Mail_Queue($db_opt, $mail_opt);
$mail_queue->sendMailsInQueue(SEND_MAIL_QUEUE_NUM);

?>
