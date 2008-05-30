<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_o_regist_ktai extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        // --- リクエスト変数
        $ses = $requests['ses'];
        // ----------

        if (!$pre = db_member_c_member_pre4ktai_session($ses)) {
            openpne_redirect('ktai', 'page_o_login');
        }

        $this->set('ses', $ses);
        $this->set('pre', $pre);

        return 'success';
    }
}

?>
