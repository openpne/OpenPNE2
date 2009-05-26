<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'XML/RPC/Server.php';
require_once OPENPNE_WEBAPP_DIR . '/modules/api/lib/xmlrpc.php';

class api_do_xmlrpc extends OpenPNE_Action
{
    function execute($requests)
    {
        $dispMap = $this->getDispMap();
        $server = new XML_RPC_Server($dispMap, 1, OPENPNE_DEBUGGING);
        exit;
    }

    function getDispMap()
    {
        $dispMap = array();
        $dir = OPENPNE_WEBAPP_DIR . '/modules/api/lib/xmlrpc';
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    if (substr($file, -4, 4) != '.php') continue;
                    include_once realpath("$dir/$file");
                    $name = substr($file, 0, -4);
                    if (db_api_check_ip($name,$_SERVER[SERVER_IP_KEY])) {
                        $dispMap[$name] = array('function' => 'xmlrpc_' . $name);
                    } else {
                        $dispMap[$name] = array('function' => 'xmlrpc_deny');
                    }
                }
                closedir($dh);
            }
        }
        return $dispMap;
    }
}

?>
