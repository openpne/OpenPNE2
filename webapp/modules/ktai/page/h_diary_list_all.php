<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_diary_list_all extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $page = $requests['page'];
        $keyword = $requests['keyword'];
        // ----------

        //日記一覧
        $page_size = 10;

        //検索結果
        $result = p_h_diary_list_all_search_c_diary4c_diary($keyword, $page_size, $page);

        $this->set('new_diary_list', $result[0]);
        $this->set('is_prev', $result[1]);
        $this->set('is_next', $result[2]);
        $this->set('total_num', $result[3]);

        $this->set('c_diary_search_list_count', $result[3]);

        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $result[3]) {
            $pager['end'] = $result[3];
        }
        $this->set('page', $page);
        $this->set('pager', $pager);

        // 半角空白を全角に統一
        $keyword = str_replace(' ', '　', $keyword);

        $this->set('keyword', $keyword);

        return 'success';
    }
}

?>
