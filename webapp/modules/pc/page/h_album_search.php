<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_search extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        // --- requests変数
        $direc = $requests['direc'];
        $page = $requests['page'];
        $keyword = $requests['keyword'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi('h'));
        $page += $direc;
        $page_size = 10;

        $result = p_h_album_list_all_search_c_album4c_album($keyword, $page_size, $page);
        
        $this->set('target_album_list', $result[0]);
        $this->set('is_prev', $result[1]);
        $this->set('is_next', $result[2]);
        $this->set('album_list_count', count($result[0]));

        $pager = array();
        $pager['start'] = $page_size * ($page - 1) + 1;
        if (($pager['end'] = $page_size * $page) > $result[3]) {
            $pager['end'] = $result[3];
        }
        $this->set('page', $page);
        $this->set('pager', $pager);

        //検索ワード
        $this->set('keyword', $keyword);

        return 'success';
    }
}

?>
