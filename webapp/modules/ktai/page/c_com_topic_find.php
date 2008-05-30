<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_c_com_topic_find extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $keyword = $requests['keyword'];
        $page = $requests['page'];
        $type = $requests['type'];
        $c_commu_id = $requests['c_commu_id'];
        $target_commu = $requests['target_commu'];
        // ----------
        if ($target_commu == 'all') {
            openpne_forward('ktai', 'page', 'h_com_topic_find_all');
            exit;
        }

        //--- 権限チェック
        //掲示板閲覧権限
        if (!db_commu_is_c_commu_view4c_commu_idAc_member_id($c_commu_id, $u)) {
            handle_kengen_error();
        }

        //バグ回避のため全角空白を半角空白に統一
        $keyword = str_replace("　", " ", $keyword);

        do_common_insert_search_log($u, $keyword);

        $page_size = 20;
        $this->set('page', $page);

        //検索結果
        list($result, $is_prev, $is_next, $total_num, $start_num, $end_num)
         = db_commu_search_c_commu_topic($keyword, $page_size, $page, $type, $c_commu_id);

        $this->set('c_commu_topic_search_list', $result);
        $this->set('is_prev', $is_prev);
        $this->set('is_next', $is_next);
        $this->set('total_num', $total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        $this->set('keyword', $keyword);
        $search_val_list = array(
            'type' => $type,
        );
        $this->set('search_val_list', $search_val_list);
        $this->set('c_commu_id', $c_commu_id);
        if ($c_commu_id) {
            $this->set('c_commu', db_commu_c_commu4c_commu_id($c_commu_id));
        }

        return 'success';
    }
}

?>
