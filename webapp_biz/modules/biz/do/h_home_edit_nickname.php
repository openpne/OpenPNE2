<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_do_h_home_edit_nickname extends OpenPNE_Action
{
    function handleError($errors)
    {
        $p['msg'] = array_shift($errors);
        openpne_redirect('pc', 'page_h_home', $p);
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $nickname = $requests['nickname'];
        // ----------

        biz_changeNickname($u, $nickname);

        openpne_redirect('pc', 'page_h_home');
    }
}

?>
