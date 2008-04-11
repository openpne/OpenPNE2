<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'Cache/Container.php';

class Cache_Container_memcache extends Cache_Container
{
    var $dsn;
    var $memcache;

    function Cache_Container_memcache($options = '')
    {
        $this->dsn = $options['dsn'];
        $this->memcache = new Memcache();
        $this->memcache->addServer($this->dsn['hostspec']);
        $this->memcache->pconnect($this->dsn['hostspec']);
    }

    function fetch($id, $group)
    {
        $cache_name = $group . '_' . $id;
        if ($res = $this->memcache->get($cache_name)) {
            $res['cachedata'] = $this->decode($res['cachedata']);
            return $res;
        }
        return '';
    }

    function save($id, $cachedata, $expires, $group, $userdata)
    {
        $cache_name = $group . '_' . $id;

        $res['expires'] = $expires;
        $res['cachedata'] = $this->encode($cachedata);
        $res['userdata'] = $userdata;
        $this->memcache->set($cache_name, $res, 0, $expires);

        return true;
    }

    function remove($id, $group)
    {
        $cache_name = $group . '_' . $id;
        $this->memcache->delete($cache_name);
    }

    function flush($group)
    {
        //注意：グループの区別ができないため全てflushされる
        $this->memcache->flush();
    }

    function idExists($id, $group)
    {
        $cache_name = $group . '_' . $id;
        return ($this->memcache->get($cache_name) != '');
    }

    function garbageCollection($maxlifetime)
    {
    }
}
?>
