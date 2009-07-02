<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_page_o_tologin extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        $url = get_login_url();
        if ($requests['login_params']) {
            if (strrpos($url, '?') !== false) {
                $url .= '&';
            } else {
                $url .= '?';
            }
            $url .= 'login_params=' . urlencode($requests['login_params']);
        }
        // リダイレクト
        header('Refresh: 3; URL=' . $url);


        //---- inc_ テンプレート用 変数 ----//
        $this->set('inc_page_header', fetch_inc_page_header('public'));

        $msg = '';
        switch ($requests['msg_code']) {
        case 'login_failed':
            $msg = 'ログインに失敗しました。再度、ログイン操作を行ってください。';
            break;
        case 'logout':
            $msg = 'ログアウトしました。';
            break;
        case 'password_reset_timeout':
            $msg = 'パスワード再設定の有効期限が過ぎています。';
            break;
        case 'change_mailaddress':
            $msg = 'メールアドレスが変更されました。';
            break;
        case 'change_password':
            $msg = 'パスワードを変更しました。新しいパスワードで再ログインしてください。';
            break;
        case 'taikai':
            $msg = '退会完了しました。ご利用ありがとうございました。';
            break;
        case 'invalid_url':
            $msg = 'このURLは既に無効になっています。';
            break;
        case 'regist_mail':
            $msg = 'メールアドレスを登録しました。';
            break;
        case 'login_rejected':
            $msg = 'ログインできませんでした。';
            break;
        }
        $this->set('msg', $msg);

        $this->set('login_url', $url);
        return 'success';
    }
}

?>
