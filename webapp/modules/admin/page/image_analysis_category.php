<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_image_analysis_category extends OpenPNE_Action
{
    function execute($requests)
    {
        //----------リクエスト変数-------------//
        $v['SNS_NAME'] = SNS_NAME;
        $v['OPENPNE_VERSION'] = OPENPNE_VERSION;
        $this->set($v);

        $analysis_image_category = get_analysis_image_category();
        $analysis_image_category_sum = get_analysis_image_category_sum();
        $this->set("analysis_image_category", $analysis_image_category);
        $this->set("analysis_image_category_sum", $analysis_image_category_sum);

        return 'success';
    }
}

?>
