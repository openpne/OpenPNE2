<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function &get_cache_lite_function()
{
    static $instance;
    if (empty($instance)) {
        include_once 'Cache/Lite/Function.php';
        $options = array(
            'cacheDir' => OPENPNE_VAR_DIR . '/function_cache/',
            'hashedDirectoryLevel' => 2,
            'hashedDirectoryUmask' => 0777,
        );
        $instance = new Cache_Lite_Function($options);
    }
    return $instance;
}

/**
 * call function cache
 */
function pne_cache_call()
{
    $arg_list = func_get_args();
    $lifetime = array_shift($arg_list);

    if (OPENPNE_USE_FUNCTION_CACHE) {
        $cache =& get_cache_lite_function();
        $cache->setOption('lifetime', intval($lifetime));
        return call_user_func_array(array(&$cache, 'call'), $arg_list);
    } else {
        $function = array_shift($arg_list);
        return call_user_func_array($function, $arg_list);
    }
}

/**
 * drop function cache
 */
function pne_cache_drop()
{
    $arg_list = func_get_args();

    if (OPENPNE_USE_FUNCITON_CACHE) {
        $cache =& get_cache_lite_function();
        return call_user_func_array(array(&$cache, 'drop'), $arg_list);
    } else {
        return true;
    }
}

//---

/**
 * メンバー情報取得関連のfunction cacheを削除する
 */
function cache_drop_c_member($c_member_id)
{
    pne_cache_drop('p_f_home_c_friend_list4c_member_id', $c_member_id, 9);
    pne_cache_drop('p_h_home_c_diary_friend_list4c_member_id', $c_member_id, 5);

    include_once 'Calendar/Week.php';

    $Week = new Calendar_Week(date('Y'), date('m'), date('d'), 0);
    $Week->build();
    while ($Day = $Week->fetch()) {
        $m = $Day->thisMonth();
        $d = $Day->thisDay();
        pne_cache_drop('p_h_home_birth4c_member_id', $m, $d, $c_member_id);
    }
}


/**
 * コミュニティ情報取得関連のfunction cacheを削除する
 */
function cache_drop_c_commu($c_commu_id)
{
    pne_cache_drop('p_c_home_c_commu_member_list4c_commu_id', $c_commu_id, 9);
    pne_cache_drop('p_c_home_c_commu4c_commu_id', $c_commu_id);

    $c_commu_topic_list = p_c_home_new_topic_comment4c_commu_id($c_commu_id, 7);
    $c_commu_event_list = p_c_home_new_topic_comment4c_commu_id($c_commu_id, 7, 1);
    $c_commu_bbs_list = array_merge($c_commu_topic_list, $c_commu_event_list);

    foreach ($c_commu_bbs_list as $c_commu_topic_id)
    {
        cache_drop_c_commu_topic($c_commu_topic_id);
    }
}

/**
 * コミュニティトピック情報取得関連のfunction cacheを削除する
 */
function cache_drop_c_commu_topic($c_commu_topic_id)
{
    pne_cache_drop('p_c_home_new_topic_comment4c_commu_id', $c_commu_topic_id, 7);
    pne_cache_drop('p_c_home_new_topic_comment4c_commu_id', $c_commu_topic_id, 7, 1);
}

/**
 * c_memberに関連したコミュニティ情報取得関連のfunction cacheを削除する
 */
function cache_drop_c_commu_list4c_member_id($c_member_id)
{
    pne_cache_drop('p_h_home_c_commu_list4c_member_id', $c_member_id, 9);
    pne_cache_drop('p_f_home_c_commu_list4c_member_id', $c_member_id, 9);
}

?>
