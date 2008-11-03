<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_regist_ktai_address_for_slavepne extends OpenPNE_Action
{
    function isSecure()
    {
        return true;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();
        if (!db_member_is_necessary_to_register_easy_access_id($u)) {
            openpne_redirect('pc', 'page_h_home');
        }

        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('regist'));
        $this->set('ktai_address', $requests['ktai_address']);

        return 'success';
    }
}

?>
