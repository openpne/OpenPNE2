<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_config_password_query extends OpenPNE_Action
{
    function execute($requests)
    {
        // 外部認証の場合はリダイレクト
        check_action4pne_slave(true);

        // 秘密の質問が無効の場合の動作
        if (!IS_PASSWORD_QUERY_ANSWER) {
            $p = array('msg' => 'アクションが無効になっています');
            openpne_redirect('ktai', 'page_h_home', $p);
        }

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];

        $this->set('password_query_list', p_common_c_password_query4null());
        return 'success';
    }
}

?>
