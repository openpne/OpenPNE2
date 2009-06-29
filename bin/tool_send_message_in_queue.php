<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';
require_once OPENPNE_MODULES_DIR . '/admin/lib/db_admin.php';

if (OPENPNE_UNDER_MAINTENANCE) {
    exit;
}

$sql = "SELECT * FROM c_message_queue order by c_message_queue_id";

$c_message_queue_list = db_get_all_limit($sql, 0, SEND_MESSAGE_QUEUE_NUM);

foreach ($c_message_queue_list as $c_message_queue) {
    $c_message_id = db_message_insert_c_message($c_message_queue['c_member_id_from'], $c_message_queue['c_member_id_to'], $c_message_queue['subject'], $c_message_queue['body']);
    do_admin_send_message_mail_send($c_message_queue['c_member_id_to'], $c_message_queue['c_member_id_from'], $c_message_queue['subject'], $c_message_queue['body'], $c_message_id);
    do_admin_send_message_mail_send_ktai($c_message_queue['c_member_id_to'], $c_message_queue['c_member_id_from'], $c_message_queue['subject'], $c_message_queue['body']);

    db_admin_delete_c_message_queue($c_message_queue['c_message_queue_id']);
}

?>
