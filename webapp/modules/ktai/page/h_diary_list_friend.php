<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_diary_list_friend extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $direc = $requests['direc'];
        $page = $requests['page'];
        // ----------

        //日記一覧
        $page = $page + $direc;
        $page_size = 10;
        $this->set("page_size", $page_size);

        //日付のリミットはとりあえず30
        $lst = p_h_diary_list_friend_h_diary_list_friend4c_member_id($u, $page_size, $page, 30);
        $this->set("h_diary_list_friend", $lst[0]);
        $this->set("is_prev", $lst[1]);
        $this->set("is_next", $lst[2]);
        $this->set("total_num", $lst[3]);

        $this->set("page", $page);

        return 'success';
    }
}
?>
