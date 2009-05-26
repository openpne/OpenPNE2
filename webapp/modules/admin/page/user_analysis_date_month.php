<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_user_analysis_date_month extends OpenPNE_Action
{
    function execute($requests)
    {
        //----------リクエスト変数-------------//
        $month = $requests['month'];
        //----------リクエスト変数-------------//

        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        $analysis_date_month = get_analysis_date_month();
        $this->set("analysis_date_month", get_analysis_date_month("",$month));
        $this->set("analysis_date_month_sum", array_sum($analysis_date_month));

        return 'success';
    }
}

?>
