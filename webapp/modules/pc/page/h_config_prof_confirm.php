<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_h_config_prof_confirm extends OpenPNE_Action
{
    function handleError($errors)
    {
        $_REQUEST['msg'] = array_shift($errors);
        openpne_forward('pc', 'page', 'h_config_prof', $errors);
        exit;
    }

    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        // --- リクエスト変数
        $prof = $_REQUEST['prof'];// do:h_config_prof で値チェック済み
        // ----------

        $this->set('inc_navi', fetch_inc_navi('h'));

        $this->set('prof', $prof);
        $this->set('profile_list', db_member_c_profile_list4null());

        return 'success';
    }
}

?>
