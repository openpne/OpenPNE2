<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_blacklist extends OpenPNE_Action
{
    function execute($requests)
    {
        $page = $requests['page'];
        $page_size = 20;
        list($c_blacklist_list, $prev, $next, $total_num, $total_page_num)
         = db_admin_c_blacklist_list($page, $page_size);
        for($i = $page-10<1 ? 1 : $page-10 ;($i<=$total_page_num)&&($i<$page+10);$i++)
            $page_list[]=$i;
        $this->set('page_list', $page_list);

        $this->set('page', $page);
        $this->set('prev', $prev);
        $this->set('next', $next);
        $this->set('total_num', $total_num);
        $this->set('start_num', ($page-1)*$page_size+1);
        $this->set('end_num', ($page-1)*$page_size+count($c_blacklist_list));

        $this->set("c_blacklist_list", $c_blacklist_list);
        return 'success';
    }
}

?>
