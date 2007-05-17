<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_com_comment_list extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- リクエスト変数
        $direc = $requests['direc'];
        $page = $requests['page'];
        // ----------

        $page = $page + $direc;
        $page_size = 10;
        $this->set("page_size", $page_size);

        $lst = db_commu_c_commu_topic_comment_list4c_member_id_2($u, $page_size, $page);
        $this->set("h_com_comment_list", $lst[0]);
        $this->set("is_prev", $lst[1]);
        $this->set("is_next", $lst[2]);
        $this->set("total_num", $lst[3]);

        $this->set("page", $page);

        return 'success';
    }
}
?>
