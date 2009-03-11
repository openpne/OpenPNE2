<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_manage_friend extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        $page = $requests['page'];
        $size = 20;

        list($c_friend_list, $prev, $next, $total_num) = db_friend_c_friend_list_disp4c_member_id($u, $page, $size);

        $pager = array(
            'prev' => $prev,
            'next' => $next,
            'total_num' => $total_num,
        );
        $pager['start'] = $size * ($page - 1) + 1;
        $pager['end'] = $size * $page;
        if ($pager['end'] > $total_num) {
            $pager['end'] = $total_num;
        }

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set('c_friend_list', $c_friend_list);
        $this->set('pager', $pager);
        $this->set('page', $page);

        return 'success';
    }
}

?>
