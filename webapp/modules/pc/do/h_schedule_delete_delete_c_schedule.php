<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_schedule_delete_delete_c_schedule extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_schedule_id = $requests['target_c_schedule_id'];
        // ----------

        //--- 権限チェック
        //スケジュール作成者

        $c_schedule = db_schedule_c_schedule4c_schedule_id($target_c_schedule_id);
        if ($c_schedule['c_member_id'] != $u) {
            handle_kengen_error();
        }
        //---

        db_schedule_delete_c_schedule4c_schedule_id($target_c_schedule_id);

        openpne_redirect('pc', 'page_h_schedule_delete_end');
    }
}

?>
