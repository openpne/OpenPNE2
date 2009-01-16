<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function &get_cache_lite_function()
{
    static $instance;
    if (empty($instance)) {
        if (OPENPNE_USE_FUNCTION_CACHE_MEMCACHE) {
            include_once 'OpenPNE/Cache.php';
            $instance = new OpenPNE_Cache_Function('memcache', $GLOBALS['_OPENPNE_MEMCACHE_LIST']['func_cache']);
        } else {
            include_once 'Cache/Lite/Function.php';
            $options = array(
                'cacheDir' => OPENPNE_VAR_DIR . '/function_cache/',
                'hashedDirectoryLevel' => 2,
                'hashedDirectoryUmask' => 0777,
            );
            $instance = new Cache_Lite_Function($options);
        }
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
        $cache->setOption('lifeTime', intval($lifetime));
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

    if (OPENPNE_USE_FUNCTION_CACHE) {
        $cache =& get_cache_lite_function();
        return call_user_func_array(array(&$cache, 'drop'), $arg_list);
    } else {
        return true;
    }
}

/***
 * 再帰的に関数をコールする pne_cache_call
 */
function pne_cache_recursive_call($lifetime, $function, $funcarg)
{
    if (OPENPNE_USE_FUNCTION_CACHE) {
        array_unshift($funcarg, $function);
        $cache =& get_cache_lite_function();
        $cache->setOption('lifeTime', intval($lifetime));
        return call_user_func_array(array(&$cache, 'call'), $funcarg);
    } else {
        return call_user_func_array($function, $funcarg);
    }
}

//---

/**
 * メンバー情報取得関連のfunction cacheを削除する
 */
function cache_drop_c_member($c_member_id)
{
    $c_member_id = (int)$c_member_id;
    pne_cache_drop('db_friend_c_friend_id_list4c_member_id', $c_member_id, 9);  //フレンドリスト
    pne_cache_drop('db_friend_c_friend_list_random4c_member_id', $c_member_id, 5);
    pne_cache_drop('p_h_home_c_diary_friend_list4c_member_id', $c_member_id, 5);  //最新日記フィード
    $c_member_id = (string)$c_member_id;
    pne_cache_drop('db_friend_c_friend_id_list4c_member_id', $c_member_id, 9);  //フレンドリスト
    pne_cache_drop('db_friend_c_friend_list_random4c_member_id', $c_member_id, 5);
    pne_cache_drop('p_h_home_c_diary_friend_list4c_member_id', $c_member_id, 5);  //最新日記フィード

    //誕生日フィード
    include_once 'Calendar/Week.php';

    $Week = new Calendar_Week(date('Y'), date('m'), date('d'), 0);
    $Week->build();
    while ($Day = $Week->fetch()) {
        $m = $Day->thisMonth();
        $d = $Day->thisDay();
        $c_member_id = (int)$c_member_id;
        pne_cache_drop('db_member_birth4c_member_id', $m, $d, $c_member_id);
        $c_member_id = (string)$c_member_id;
        pne_cache_drop('db_member_birth4c_member_id', $m, $d, $c_member_id);
    }

    cache_drop_c_friend_intro($c_member_id);  //紹介文
}

/**
 * コミュニティ情報取得関連のfunction cacheを削除する
 */
function cache_drop_c_commu($c_commu_id)
{
    $c_commu_id = (int)$c_commu_id;
    pne_cache_drop('db_commu_c_commu4c_commu_id_k',$c_commu_id);
    pne_cache_drop('db_commu_c_commu_member_list_random4c_commu_id', $c_commu_id, 5);
    pne_cache_drop('db_commu_c_commu_member_list4c_commu_id', $c_commu_id, 9);
    pne_cache_drop('db_commu_c_commu4c_commu_id2', $c_commu_id);
    $c_commu_id = (string)$c_commu_id;
    pne_cache_drop('db_commu_c_commu4c_commu_id_k',$c_commu_id);
    pne_cache_drop('db_commu_c_commu_member_list_random4c_commu_id', $c_commu_id, 5);
    pne_cache_drop('db_commu_c_commu_member_list4c_commu_id', $c_commu_id, 9);
    pne_cache_drop('db_commu_c_commu4c_commu_id2', $c_commu_id);

    $c_commu_topic_list = db_commu_new_topic_comment4c_commu_id($c_commu_id, 7);
    $c_commu_event_list = db_commu_new_topic_comment4c_commu_id($c_commu_id, 7, 1);
    $c_commu_bbs_list = array_merge($c_commu_topic_list, $c_commu_event_list);

    foreach ($c_commu_bbs_list as $c_commu_topic_id) {
        $c_commu_topic_id = (int)$c_commu_topic_id;
        cache_drop_c_commu_topic($c_commu_topic_id);
        $c_commu_topic_id = (string)$c_commu_topic_id;
        cache_drop_c_commu_topic($c_commu_topic_id);
    }

    $c_commu_member_total_num = db_commu_count_c_commu_member_list4c_commu_id($c_commu_id);
    $c_commu_member_list = db_commu_c_member_list4c_commu_id($c_commu_id, 1, $c_commu_member_total_num);
    foreach ($c_commu_member_list[0] as $c_member) {
        cache_drop_c_commu_list4c_member_id($c_member['c_member_id']);
    }
}

/**
 * コミュニティトピック情報取得関連のfunction cacheを削除する
 */
function cache_drop_c_commu_topic($c_commu_topic_id)
{
    $c_commu_topic_id = (int)$c_commu_topic_id;
    pne_cache_drop('db_commu_new_topic_comment4c_commu_id', $c_commu_topic_id, 7);
    pne_cache_drop('db_commu_new_topic_comment4c_commu_id', $c_commu_topic_id, 7, 0);
    pne_cache_drop('db_commu_new_topic_comment4c_commu_id', $c_commu_topic_id, 7, 1);
    $c_commu_topic_id = (string)$c_commu_topic_id;
    pne_cache_drop('db_commu_new_topic_comment4c_commu_id', $c_commu_topic_id, 7);
    pne_cache_drop('db_commu_new_topic_comment4c_commu_id', $c_commu_topic_id, 7, 0);
    pne_cache_drop('db_commu_new_topic_comment4c_commu_id', $c_commu_topic_id, 7, 1);
}

/**
 * c_memberに関連したコミュニティ情報取得関連のfunction cacheを削除する
 */
function cache_drop_c_commu_list4c_member_id($c_member_id)
{
    $c_member_id = (int)$c_member_id;
    pne_cache_drop('db_commu_c_commu_list_lastupdate4c_member_id', $c_member_id, 5);
    pne_cache_drop('db_commu_c_commu_list4c_member_id_2', $c_member_id, 9);
    pne_cache_drop('db_commu_c_commu_topic_comment_list4c_member_id', $c_member_id, 5);
    $c_member_id = (string)$c_member_id;
    pne_cache_drop('db_commu_c_commu_list_lastupdate4c_member_id', $c_member_id, 5);
    pne_cache_drop('db_commu_c_commu_list4c_member_id_2', $c_member_id, 9);
    pne_cache_drop('db_commu_c_commu_topic_comment_list4c_member_id', $c_member_id, 5);
}


/**
 * 紹介文取得のfunction cacheを削除する
 */
function cache_drop_c_friend_intro($c_member_id)
{
    $c_member_id = (int)$c_member_id;
    pne_cache_drop('db_friend_c_friend_intro_list4c_member_id', $c_member_id, 5);
    pne_cache_drop('db_friend_c_friend_comment4c_member_id', $c_member_id);
    $c_member_id = (string)$c_member_id;
    pne_cache_drop('db_friend_c_friend_intro_list4c_member_id', $c_member_id, 5);
    pne_cache_drop('db_friend_c_friend_comment4c_member_id', $c_member_id);
}

/**
 * プロフィール取得のfunction cacheを削除する
 * 旧関数名を呼んでいる限り引数の省略はないのでこれで暫定的な対応とする
 */
function cache_drop_c_member_profile($c_member_id)
{
    $c_member_id = (int)$c_member_id;
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id);
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false);
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, false, 'public');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, false, 'friend');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, false, 'private');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, true, 'public');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, true, 'friend');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, true, 'private');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true);
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, false, 'public');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, false, 'friend');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, false, 'private');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, true, 'public');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, true, 'friend');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, true, 'private');
    pne_cache_drop('db_member_c_profile_list');
    $c_member_id = (string)$c_member_id;
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id);
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false);
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, false, 'public');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, false, 'friend');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, false, 'private');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, true, 'public');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, true, 'friend');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, false, true, 'private');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true);
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, false, 'public');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, false, 'friend');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, false, 'private');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, true, 'public');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, true, 'friend');
    pne_cache_drop('db_member_c_member4c_member_id', $c_member_id, true, true, 'private');
}

/**
 * お気に入り関連のfunction cacheを削除する
 */
function cache_drop_c_bookmark($c_member_id)
{
    $c_member_id = (int)$c_member_id;
    pne_cache_drop('db_bookmark_member_list', $c_member_id, 9);
    $c_member_id = (string)$c_member_id;
    pne_cache_drop('db_bookmark_member_list', $c_member_id, 9);
}

/**
 * 日記のfunction cacheを削除する
 *
 * @param int $c_member_id        ログインしているメンバーID
 * @param int $target_c_member_id 書き込み先のメンバーID
 */
function cache_drop_c_diary($c_member_id, $target_c_member_id)
{
    $target_c_member_id = (int)$target_c_member_id;
    $c_member_id = (int)$c_member_id;
    pne_cache_drop('db_diary_get_c_diary_list4c_member_id', $target_c_member_id, 5, $c_member_id);
    pne_cache_drop('p_h_home_c_diary_friend_list4c_member_id', $c_member_id, 5);  //最新日記フィード
    $target_c_member_id = (string)$target_c_member_id;
    $c_member_id = (string)$c_member_id;
    pne_cache_drop('db_diary_get_c_diary_list4c_member_id', $target_c_member_id, 5, $c_member_id);
    pne_cache_drop('p_h_home_c_diary_friend_list4c_member_id', $c_member_id, 5);  //最新日記フィード
    $target_c_member_id = (int)$target_c_member_id;
    $c_member_id = (string)$c_member_id;
    pne_cache_drop('db_diary_get_c_diary_list4c_member_id', $target_c_member_id, 5, $c_member_id);
    $target_c_member_id = (string)$target_c_member_id;
    $c_member_id = (int)$c_member_id;
    pne_cache_drop('db_diary_get_c_diary_list4c_member_id', $target_c_member_id, 5, $c_member_id);
}
?>
