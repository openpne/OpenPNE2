<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/DB.php';
require_once 'OpenPNE/DB/Writer.php';

// OpenPNE/db 以下のすべてのPHPファイルを include
$dir = dirname(__FILE__) . '/db';
_include_dir($dir);

function _include_dir($dir)
{
    if (is_dir($dir)) {
        if ($dh = opendir($dir)) {
            while (($file = readdir($dh)) !== false) {
                $path = realpath("$dir/$file");
                if ($file != '.' && $file != '..' && is_dir($path)) {
                    _include_dir($path);
                }
                if (substr($file, -4, 4) != '.php') continue;
                include_once $path;
            }
            closedir($dh);
        }
    }
}

?>
