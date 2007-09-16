<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_diary_edit_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $target_c_diary_id = $requests['target_c_diary_id'];
        // ----------

        $c_member = db_member_c_member4c_member_id($u);
        if ($target_c_diary_id) {
            $c_diary = db_diary_get_c_diary4id($target_c_diary_id);
            $this->set('target_c_diary', $c_diary);

            if ($c_diary['c_member_id'] != $u) {
                handle_kengen_error();
            }
        } else {
            handle_kengen_error();
        }

        //メンバー情報
        $this->set('member', $c_member);


        return 'success';
    }
}

?>
