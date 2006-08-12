<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_config_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        //<PCKTAI
        if (!OPENPNE_ENABLE_KTAI) {
            openpne_redirect('pc', 'page_h_home');
        }
        //>

        $u = $GLOBALS['AUTH']->uid();

        $this->set('inc_navi',fetch_inc_navi("h"));

        $this->set('mail_server_domain', MAIL_SERVER_DOMAIN);
        $this->set('SNS_NAME', SNS_NAME);

        return 'success';
    }
}

?>
