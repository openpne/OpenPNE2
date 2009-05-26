<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_access_analysis_page extends OpenPNE_Action
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
        $orderby = $requests['orderby'];
        $orderby1 = $requests['orderby1'];
        $orderby2 = $requests['orderby2'];
        //----------リクエスト変数-------------//

        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);

        if ($orderby1) {
            $orderby = $orderby1;
        } elseif($orderby2) {
            $orderby = $orderby2;
        }

        $this->set("ktai_flag" ,$ktai_flag);
        $this->set("item_str", ($ktai_flag ? "携帯版":"PC版"));
        $this->set("ymd", $ymd);
        $this->set("month_flag", $month_flag);

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

        list($access_analysis_month_page, $sum)
                = p_access_analysis_page_access_analysis_page4ym($ymd, $month_flag, $ktai_flag, $orderby);
        $this->set("access_analysis_month_page", $access_analysis_month_page);
        $this->set("sum", $sum);

        return 'success';
    }
}

?>
