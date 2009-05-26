<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_delete_diary extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        // ----------

        $this->set('inc_navi', fetch_inc_navi('h'));
        $this->set("target_c_diary", db_diary_get_c_diary4id($target_c_diary_id));

        return 'success';
    }
}

?>
