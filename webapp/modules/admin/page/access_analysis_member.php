<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_access_analysis_member extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!LOG_C_ACCESS_LOG) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }
        //----------リクエスト変数-------------//
        $ktai_flag = $requests['ktai_flag'];
        $ymd = $requests['ymd'];
        $month_flag = $requests['month_flag'];
        $page_name = $requests['page_name'];
        $page = $requests['page'];
        $orderby = $requests['orderby'];
        $orderby1 = $requests['orderby1'];
        $orderby2 = $requests['orderby2'];
        //----------リクエスト変数-------------//

        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);

        $page_size = 10;
        if ($orderby1) {
            $orderby = $orderby1;
        } elseif ($orderby2) {
            $orderby = $orderby2;
        }
        $this->set("ktai_flag" ,$ktai_flag);
        $this->set("item_str", ($ktai_flag ? "携帯版":"PC版"));
        $this->set("ymd", $ymd);
        $this->set("month_flag", $month_flag);
        $this->set("page_name", $page_name);
        if ($orderby1) {
            $orderby1 *= -1;
        } else {
            $orderby1 = -1;
        }
        if ($orderby2) {
            $orderby2 *= -1;
        } else {
            $orderby2 = 2;
        }
        $this->set("orderby", $orderby);
        $this->set("orderby1", $orderby1);
        $this->set("orderby2", $orderby2);

        list($access_member, $sum, $is_prev, $is_next, $total_num, $start_num, $end_num)
                = p_access_analysis_member_access_member4ym_page_name($ymd, $month_flag, $page_name, $ktai_flag, $page, $page_size, $orderby);
        $this->set("access_member", $access_member);
        $this->set("sum", $sum);
        $this->set("is_prev", $is_prev);
        $this->set("is_next", $is_next);
        $this->set("page", $page);
        $this->set("total_num",$total_num);
        $this->set('start_num', $start_num);
        $this->set('end_num', $end_num);

        return 'success';
    }
}


?>
