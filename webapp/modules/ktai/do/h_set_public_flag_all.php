<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

/**
 * 日記公開範囲の一括設定する
 */
class ktai_do_h_set_public_flag_all extends OpenPNE_Action
{
    function execute($requests)
    {
        $tail = $GLOBALS['KTAI_URL_TAIL'];
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        $public_flag = util_cast_public_flag_diary($requests['public_flag_diary_all']);

        db_diary_update_public_flag_diary_all($u, $public_flag);

        $p = array('msg' => 40);
        openpne_redirect('ktai', 'page_h_config', $p);
    }
}

?>
