<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// 設定変更
class admin_page_edit_c_admin_config extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();
        $v['DAILY_NEWS_DAY'] = explode(',', DAILY_NEWS_DAY);
        $this->set($v);

        //外部ログインフォーム用HTML内のアドレス生成
        //PC版ログインフォーム
        $login_url = openpne_gen_url_head('pc', 'do_o_login');
        $this->set('login_url', $login_url);

        //携帯版ログインフォーム
        $ktai_login_url = openpne_gen_url_head('ktai', 'do_o_login');
        $ktai_easy_login_url = openpne_gen_url_head('ktai', 'do_o_easy_login');
        $this->set('ktai_login_url', $ktai_login_url);
        $this->set('ktai_easy_login_url', $ktai_easy_login_url);
        return 'success';
    }
}

?>
