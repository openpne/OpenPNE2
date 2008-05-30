<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_user_analysis_date_day extends OpenPNE_Action
{
    function execute($requests)
    {
        //----------リクエスト変数-------------//
        $date = $requests['date'];
        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);

        $analysis_date_day = get_analysis_date_day($date);
        $this->set("date", get_analysis_date_day_d($date));
        $this->set("analysis_date_day", $analysis_date_day);
        $this->set("analysis_date_day_sum", array_sum($analysis_date_day));

        return 'success';
    }
}

?>
