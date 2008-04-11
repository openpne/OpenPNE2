<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_access_analysis_day extends OpenPNE_Action
{
    function execute($requests)
    {
        if (!LOG_C_ACCESS_LOG) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }
        //----------リクエスト変数-------------//
        $ktai_flag = $requests['ktai_flag'];
        $ymd = $requests['ymd'];
        //----------リクエスト変数-------------//

        $this->set("inc_header" ,admin_fetch_inc_header("TOP>>".SNS_NAME."管理画面"));
        $this->set("inc_footer" ,admin_fetch_inc_footer());
        $this->set('SNS_NAME', SNS_NAME);

        $this->set("ktai_flag" ,$ktai_flag);
        $this->set("item_str", ($ktai_flag ? "携帯版":"PC版"));

        $access_analysis_day = p_access_analysis_day_access_analysis_day($ymd, $ktai_flag);
        $this->set("access_analysis_day", $access_analysis_day);

        return 'success';
    }
}

?>
