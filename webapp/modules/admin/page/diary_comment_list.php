<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 管理画面トップページ 認証済み

class admin_page_diary_comment_list extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('diary_comment_list', array_shift($errors));
    }

    function execute($requests)
    {
        $v = array();

        $page = $requests['page'];
        $keyword = $requests['keyword'];
        $target_c_diary_comment_id = $requests['target_c_diary_comment_id'];
        $target_c_diary_id = $requests['target_c_diary_id'];

        $page_size = 20;

        if ($target_c_diary_comment_id) {
            list($diary_comment_list,$prev,$next,$total_num,$total_page_num)
            = monitor_diary_comment_list4c_diary_comment_id($target_c_diary_comment_id,$page_size,$page);
        } elseif ($target_c_diary_id) {
            list($diary_comment_list, $prev, $next, $total_num, $total_page_num)
            = monitor_diary_comment_list4c_diary_id($target_c_diary_id, $page_size, $page);
        } else {
            list($diary_comment_list,$prev,$next,$total_num,$total_page_num)
            = monitor_diary_comment_list($keyword,$page_size,$page);
        }
        $this->set('diary_comment_list', $diary_comment_list);
        $this->set('page', $page);
        $this->set('prev', $prev);
        $this->set('next', $next);
        $this->set('keyword_encode', urlencode($keyword));
        $this->set('keyword', $keyword);
        $this->set('target_c_diary_comment_id', $target_c_diary_comment_id);
        $this->set('target_c_diary_id', $target_c_diary_id);
        $this->set('total_num', $total_num);

        for($i = $page-10<1 ? 1 : $page-10 ;($i<=$total_page_num)&&($i<$page+10);$i++)
            $page_list[]=$i;
        $this->set('page_list', $page_list);
        $this->set('start_num', ($page-1)*$page_size+1);
        $this->set('end_num', ($page-1)*$page_size+count($diary_comment_list));

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        return 'success';
    }
}

?>
