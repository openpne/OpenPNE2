<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

include_once 'Cache/Function.php';

class OpenPNE_Cache_Function extends Cache_Function
{
    function OpenPNE_Cache_Function($container = 'file', $container_options = array('cache_dir' => '.', 'filename_prefix' => 'cache_'), $expires = 3600)
    {
        $this->Cache_Function($container, $container_options, $expires);
    }

    function setOption($name, $value)
    {
        if ($name == 'lifeTime') {
            $this->expires = $value;
        }
    }

    function drop()
    {
        $id = md5(serialize(func_get_args()));
        $this->remove($id, 'function_cache');
    }
}

?>
