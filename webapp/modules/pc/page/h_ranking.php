<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_ranking extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if (!OPENPNE_USE_RANKING) {
            openpne_forward('pc', 'page', 'h_err_ranking');
            exit;
        }

        // --- リクエスト変数
        $kind = $requests['kind'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi('h'));

        $this->set('kind', $kind);


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
        $this->set("rank_list", $rank_list);

        return 'success';
    }
}

?>
