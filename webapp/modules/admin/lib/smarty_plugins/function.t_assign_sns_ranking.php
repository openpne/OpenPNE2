<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

function smarty_function_t_assign_sns_ranking($params, &$smarty)
{
    if (empty($params['var'])) {
        return array();
    }

    $ranking = array(
        'rank_friend' => _getRanking('friend'),
        'rank_com_member' => _getRanking('com_member'),
        'rank_com_comment' => _getRanking('com_comment'),
        'rank_ashiato' => _getRanking('ashiato'),
    );

    $smarty->assign($params['var'], $ranking);
}

function _getRanking($kind)
{
    $limit = 10;
    switch ($kind) {
    case "friend":
        $list = pne_cache_call(3600, 'db_ranking_c_friend_ranking', $limit);
        foreach ($list as $key => $value) {
            $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
        }
        break;
    case "com_member":
        $list = pne_cache_call(3600, 'db_ranking_c_commu_member_ranking', $limit);
        foreach ($list as $key => $value) {
            $list[$key]['c_commu'] = db_commu_c_commu4c_commu_id($value['c_commu_id']);
        }
        break;
    case "com_comment":
        $list = pne_cache_call(3600, 'db_ranking_c_commu_topic_comment_ranking', $limit);
        foreach ($list as $key => $value) {
            $list[$key]['c_commu'] = db_commu_c_commu4c_commu_id($value['c_commu_id']);
        }
        break;
    case "ashiato":
    default:
        $list = pne_cache_call(3600, 'db_ranking_c_ashiato_ranking', $limit);
        foreach ($list as $key => $value) {
            $list[$key]['c_member'] = db_member_c_member_with_profile($value['c_member_id']);
            if (!$list[$key]['c_member']) {
                unset($list[$key]);
            }
        }
        break;
    }
    $rank_list = array();
    if ($list) {
        $rank = 1;
        $current_count = null;
        foreach ($list as $item) {
            if ($item['count'] != $current_count) {
                $rank = $rank + count($rank_list[$rank]);
                $current_count = $item['count'];
            }
            $rank_list[$rank][] = $item;
        }
    }
    return $rank_list;
}

?>
