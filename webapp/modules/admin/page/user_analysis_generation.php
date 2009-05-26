<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_user_analysis_generation extends OpenPNE_Action
{
    function execute($requests)
    {
        //----------リクエスト変数-------------//

        $v = array();

        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);
        $analysis_generation = get_analysis_generation();
        $this->set("analysis_generation", $analysis_generation);
        $this->set("analysis_generation_sum", array_sum($analysis_generation));

        return 'success';
    }
}

?>
