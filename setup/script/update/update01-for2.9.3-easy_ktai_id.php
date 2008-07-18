<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once './config.inc.php';
require_once OPENPNE_WEBAPP_DIR . '/init.inc';

$db =& DB::connect($GLOBALS['_OPENPNE_DSN_LIST']['main']['dsn']);
if (DB::isError($db)) {
    echo "Failed connecting Database\n";
    exit;
}
$db->setFetchMode(DB_FETCHMODE_ASSOC);

$sql = "SELECT c_member_secure_id,easy_access_id FROM c_member_secure";
$res =& $db->query($sql);
$row_num = $res->numRows();

$i = 0;
$start_time = time();
while ($res->fetchInto($row)) {
    if ($row['easy_access_id'] == '') {
        $row['easy_access_id'] = '';
    } else {
        $row['easy_access_id'] = md5(t_decrypt($row['easy_access_id']));
    }

    $sql = "UPDATE c_member_secure SET easy_access_id = ? WHERE c_member_secure_id = ? ";
    $param = array($row['easy_access_id'],$row['c_member_secure_id']);
    $db->query($sql, $param);

    $i++;
    if ($i % (int)($row_num/100) == 0) {
        echo $i."/".$row_num." ".(int)($i/$row_num*100)."%";
        $end_time = (int)((time() - $start_time) / $i * ($row_num-$i));
        echo " Estimated left time:".$end_time."s \r";
        usleep(10000);
    }
}
echo $row_num."/".$row_num." 100% Estimated left time:0s \n";
echo "Completed\n";

?>
