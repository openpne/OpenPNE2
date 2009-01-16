<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_toimg extends OpenPNE_Action
{
    function execute($requests)
    {
        $q = http_build_query($_REQUEST);
        client_redirect_absolute(OPENPNE_URL . 'img.php?' . $q);

        return 'success';
    }
}

?>
