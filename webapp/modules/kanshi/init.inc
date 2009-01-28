<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

$module_lib_dir = dirname(__FILE__) . '/lib';
require_once $module_lib_dir . '/kanshi.php';
require_once 'XML/Serializer.php';

// 許可されたIPかどうか
if(kanshi_check_access_ip($_SERVER[SERVER_IP_KEY])) {
    kanshi_allow_ip_log($_SERVER[SERVER_IP_KEY]);
}
else{
    kanshi_disallow_ip_log($_SERVER[SERVER_IP_KEY]);

    $code    = 99;
    $message = "アクセスできません"; 

    $data    = array(
        'meta' => array(
            'watch_type_id'        => $requests['watch_type_id'],
            'api_version'          => $requests['api_version'],
            'import_data_type_seq' => $requests['import_data_type_seq'],
            'result'               => '0',
            'error_code'           => $code,
            'error_message'        => $message
        ),
        'entities' => '',
    );

    $options = array(
        "defaultTagName" => "entity",
        "rootName"       => "root",
    );

    $serializer = new XML_Serializer($options);
    $serializer->serialize($data);
    $result = $serializer->getSerializedData();

    header("Content-Type: text/xml; charset=utf-8");
    echo $result;
    exit;
}
?>
