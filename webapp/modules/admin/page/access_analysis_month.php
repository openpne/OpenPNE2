<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//アクセス解析

class admin_page_access_analysis_month extends OpenPNE_Action
{
    function execute($requests)
    {
		//----------リクエスト変数-------------//
		$ktai_flag = $requests['ktai_flag'];
		//----------リクエスト変数-------------//

        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);

		$this->set("ktai_flag" ,$ktai_flag);
		$this->set("item_str", ($ktai_flag ? "携帯":"PC"));

		$access_analysis_month = p_access_analysis_month_access_analysis_month($ktai_flag);
		$this->set("access_analysis_month", $access_analysis_month);

		//アクティブユーザー数
		$s_access_date = date("Y-m-d H:i:s" , strtotime ("-1 week") );
		$list = p_member_edit_c_member_list(100,1,$s_access_date);
		$this->set("active_num", $list[3]);
	
		$nowtime = date("Y-m") . "-01";
		$this->set("nowtime", $nowtime);

        return 'success';
    }
}

?>