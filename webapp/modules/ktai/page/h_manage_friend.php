<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_manage_friend extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        // --- 繝ｪ繧ｯ繧ｨ繧ｹ繝亥､画焚
        $page = $requests['page'];
        // ----------

        // 1繝壹・繧ｸ蠖薙◆繧翫↓陦ｨ遉ｺ縺吶ｋ繝輔Ξ繝ｳ繝峨・謨ｰ
        $page_size = 5;
        //閾ｪ蛻・・蜿矩＃繝ｪ繧ｹ繝・
        $list = k_p_fh_friend_list_friend_list4c_member_id($u, $page_size, $page);

        $this->set("friend_list", $list[0]);
        $this->set("page", $page);
        $this->set("is_prev", $list[1]);
        $this->set("is_next", $list[2]);
        return 'success';
    }
}

?>
