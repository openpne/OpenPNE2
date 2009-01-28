<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_regist_pre extends OpenPNE_Action
{
    function execute($requests)
    {
        // --- リクエスト変数
        $aff_id = $requests['aff_id'];
        // ----------

        if ($aff_id) {
            $this->set('aff_id', $aff_id);
        }
        $this->set('SNS_NAME', SNS_NAME);

        return 'success';
    }
}
?>
