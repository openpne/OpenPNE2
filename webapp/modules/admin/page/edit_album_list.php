<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_edit_album_list extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_album_list', array_shift($errors));
        exit;
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $v = array();

        $page = $requests['page'];
        $keyword = $requests['keyword'];
        $target_c_album_id = $requests['target_c_album_id'];
        $page_size = 20;

        if ($target_c_album_id) {
            list($album_list, $prev, $next, $total_num, $total_page_num) = db_admin_album_list4c_album_id($target_c_album_id, $page_size, $page);
        } else {
            list($album_list, $prev, $next, $total_num, $total_page_num) = db_admin_album_list($keyword, $page_size, $page);
        }
        $this->set('album_list', $album_list);
        $this->set('page', $page);
        $this->set('prev', $prev);
        $this->set('next', $next);
        $this->set('keyword_encode', urlencode($keyword));
        $this->set('keyword', $keyword);
        $this->set('target_c_album_id', $target_c_album_id);
        $this->set('total_num', $total_num);

        for($i = $page-10<1 ? 1 : $page-10 ;($i<=$total_page_num)&&($i<$page+10);$i++)
            $page_list[]=$i;

        $this->set('page_list', $page_list);
        $this->set('start_num', ($page-1)*$page_size+1);
        $this->set('end_num', ($page-1)*$page_size+count($album_list));

        $this->set($v);
        return 'success';
    }
}

?>
