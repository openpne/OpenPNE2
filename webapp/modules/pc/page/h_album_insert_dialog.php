<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_album_insert_dialog extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!OPENPNE_USE_ALBUM) {
            handle_kengen_error();
        }

        $u = $GLOBALS['AUTH']->uid();

        $page = $requests['page'];

        $page_size = 10;

        $target_member = db_member_c_member4c_member_id($u);
        $this->set('target_member', $target_member);
        $this->set('c_member_id', $u);

        $list_set = p_fh_album_list_fh_my_album_list4c_member_id($u, $page_size, $page, $u);
        $this->set('target_album_list', $list_set[0]);

        $this->set('page', $page);
        $this->set('page_size', $page_size);
        $this->set('is_prev', $list_set[1]);
        $this->set('is_next', $list_set[2]);
        $this->set("total_num", $list_set[3]);
        $this->set('album_list_count', count($list_set[0]));

        $view =& $this->getView();
        $view->ext_display('h_album_insert_dialog.tpl');
        exit;
    }
}

?>
