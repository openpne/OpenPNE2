<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// レビュー検索画面

class admin_page_review_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();
        
        $page = $requests['page'];
        $keyword = $requests['keyword'];
        $page_size = 20;
        
        $v = array();
        
        list($review_list,$prev,$next,$total_num,$total_page_num) 
            = monitor_review_list($keyword,$page_size,$page);
        $this->set('review_list', $review_list);
        $this->set('page', $page);
        $this->set('prev', $prev);
        $this->set('next', $next);
        $this->set('keyword_encode', urlencode($keyword));
        $this->set('keyword', $keyword);
        $this->set('total_num', $total_num);
        
        for($i = $page-10<1 ? 1 : $page-10 ;($i<=$total_page_num)&&($i<$page+10);$i++)
            $page_list[]=$i;
        $this->set('page_list', $page_list);
        $this->set('start_num', ($page-1)*$page_size+1);
        $this->set('end_num', ($page-1)*$page_size+count($review_list));
        
        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
