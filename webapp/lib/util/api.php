<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function api_get_params($c_member_id)
{
    $datetime = date('YmdHis');
    $token = db_api_get_member_token($c_member_id);
    $sid = api_get_sid($c_member_id, $token, $datetime);

    return array(
        'sid' => $sid,
        'mid' => $c_member_id,
        'dt'  => $datetime,
    );
}

function api_get_sid($c_member_id, $member_token, $datetime)
{
    return md5(OPENPNE_API_TOKEN . $c_member_id . $member_token . $datetime);
}

?>
