<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_home_search extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        if (!is_null($requests['community_x'])) {
            $p = array('keyword' => $requests['q']);
            openpne_redirect('pc', 'page_h_com_find_all', $p);
        } elseif (!is_null($requests['web_x'])) {
            $q = urlencode($requests['q']);
            client_redirect_absolute('http://www.google.com/search?hl=ja&q='.$q);
        } elseif (!is_null($requests['message_x'])) {
            $p = array('keyword' => $requests['q'],'box' => 'inbox');
            openpne_redirect('pc', 'page_h_message_box', $p);
        } else { // default
            $p = array('keyword'=> $requests['q']);
            openpne_redirect('pc', 'page_h_diary_list_all', $p);
        }
    }
}

?>
