<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_url_changed extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $wait = intval(WAIT_REDIRECT_TIME);
        $url  = $requests['url'];

        if ($wait == 0) {
            client_redirect_absolute($url);
        } elseif ($wait > 0) {
            header('Refresh: '.$wait.'; URL=' . $url);
        }
        $this->set('inc_page_header', fetch_inc_page_header('public'));
        $this->set('wait', $wait);
        $this->set('url', $url);
        return 'success';
    }
}

?>
