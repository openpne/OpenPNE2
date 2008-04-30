<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_edit_album_image_list extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_album_image_list', array_shift($errors));
        exit;
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $v = array();
        $pager = array();

        $page = $requests['page'];
        $target_c_album_id = $requests['target_c_album_id'];
        $target_c_album_image_id = $requests['target_c_album_image_id'];
        $page_size = 20;

        if ($target_c_album_image_id) {
            $album_image_list = db_admin_c_album_image_list4c_album_image_id($page, $page_size, $pager, $target_c_album_image_id);
        } else {
            $album_image_list = db_admin_c_album_image_list($page, $page_size, $pager, $target_c_album_id);
        }
        $v['pager'] = $pager;

        $this->set('album_image_list', $album_image_list);
        $this->set('page', $page);
        $this->set('prev', $prev);
        $this->set('next', $next);
        $this->set('target_c_album_id', $target_c_album_id);
        $this->set('target_c_album_image_id', $target_c_album_image_id);
        $this->set('total_num', $total_num);

        for($i = $page-10<1 ? 1 : $page-10 ;($i<=$total_page_num)&&($i<$page+10);$i++)
            $page_list[]=$i;

        $this->set('page_list', $page_list);
        $this->set('start_num', ($page-1)*$page_size+1);
        $this->set('end_num', ($page-1)*$page_size+count($album_image_list));

        $this->set($v);
        return 'success';
    }
}

?>
