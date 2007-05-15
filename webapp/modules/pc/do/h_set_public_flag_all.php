<?php
/**
 * @copyright 2005-2007 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 日記公開範囲の一括設定する
 */
class pc_do_h_set_public_flag_all extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        switch ($requests['public_flag_diary_all']) {
        case 'public':
        default:
            $public_flag = 'public';
            break;
        case 'friend':
            $public_flag = 'friend';
            break;
        case 'private':
            $public_flag = 'private';
            break;
        }
        
        if ($requests['ok']) {
            db_diary_update_public_flag_diary_all($u, $public_flag);
            openpne_redirect('pc', 'page_h_home');
        } else {
            openpne_redirect('pc', 'page_h_config');
        }
    }
}

?>
