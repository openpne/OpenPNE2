<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_home_edit_biz_todo extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $id = $requests['id'];
        $is_check = $requests['is_check'];
        $writer_name = $requests['writer_name'];
        $sort_order = $requests['sort_order'];
        $writer_id = $requests['writer_id'];
        $memo = $requests['memo'];
        // ----------

        $member_info = db_common_c_member4c_member_id_LIGHT($writer_id);

        $todo_info = biz_getTodo($id);

        biz_editTodo($todo_info['c_member_id'], $memo, $writer_id, $sort_order, $is_check, $id);

        $p = array('msg' => '');
        openpne_redirect('pc', 'page_h_home', $p);
    }
}

?>
