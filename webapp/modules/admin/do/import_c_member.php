<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// メンバー情報一括登録
class admin_do_import_c_member extends OpenPNE_Action
{
    function handleError($msg)
    {
        admin_client_redirect('import_c_member', $msg);
    }

    function execute($requests)
    {
        $member_file = $_FILES['member_file'];

        $limit = 1000;  // 件数制限

        // 項目数
        if (OPENPNE_AUTH_MODE == 'pneid') {
            $column_num = 4;
        } else {
            $column_num = 3;
        }

        if (empty($member_file) || $member_file['error'] === UPLOAD_ERR_NO_FILE) {
            $this->handleError('ファイルを指定してください');
        }

        $filename_parts = explode('.', $member_file['name']);
        if (array_pop($filename_parts) != 'csv') {
            $this->handleError('拡張子は.csvにしてください');
        }

        $member_data = file($member_file['tmp_name']);
        $member_data_count = count($member_data);
        if ($member_data_count > $limit) {
            $this->handleError("ファイルの行数は{$limit}行以内にしてください");
        }

        foreach ($member_data as $key => $value) {
            $columns = explode(',', trim($value));
            $lnum = $key + 1;  // 行番号

            if (OPENPNE_AUTH_MODE == 'pneid') {
                list($login_id, $nickname, $mail_address, $password) = $columns;
            } else {
                $login_id = null;
                list($nickname, $mail_address, $password) = $columns;
            }
            if (is_ktai_mail_address($mail_address)) {
                $mail_address = str_replace('"', '', $mail_address);
            }

            if (count($columns) != $column_num) {
                $this->handleError("{$lnum}行目：項目は{$column_num}つにしてください");
            }

            if ($nickname === '' || $mail_address === '' || $password === '' || $login_id === '') {
                $this->handleError("{$lnum}行目：空の項目が存在します");
            }

            if (strlen($nickname) > 40) {
                $this->handleError("{$lnum}行目：" . WORD_NICKNAME . "は40文字以内で入力してください");
            }

            if (!db_common_is_mailaddress($mail_address)) {
                $this->handleError("{$lnum}行目：メールアドレス [{$mail_address}] はメールアドレスとして正しくありません");
            }

            if (db_member_is_sns_join4mail_address($mail_address)) {
                $this->handleError("{$lnum}行目：メールアドレス [{$mail_address}] は既に登録済みです");
            }

            // ドメイン制限
            if (!db_member_is_limit_domain4mail_address($mail_address)) {
                $this->handleError("{$lnum}行目：メールアドレス [{$mail_address}] は登録できません");
            }

            if (!preg_match('/^[a-z0-9]{6,12}$/i', $password)) {
                $this->handleError("{$lnum}行目：パスワードは6～12文字の半角英数で入力してください");
            }

            // ログインIDを使用する場合
            if (OPENPNE_AUTH_MODE == 'pneid') {
                if (!preg_match('/^[a-z0-9][a-z0-9\-_]+[a-z0-9]$/i', $login_id)) {
                    $this->handleError("{$lnum}行目：ログインIDは4～30文字の半角英数で入力してください");
                }

                if (db_member_c_member_id4username($login_id)) {
                    $this->handleError("{$lnum}行目：ログインID［{$login_id}］は既に登録済みです");
                }

            }

            // メールアドレスが携帯メールアドレスのドメインの場合は、
            // 携帯メールアドレスとして登録する
            if (is_ktai_mail_address($mail_address)) {
                $ktai_address = $mail_address;
                $pc_address   = '';
            } else {
                $ktai_address = '';
                $pc_address   = $mail_address;
            }

            $c_member = array(
                'nickname' => $nickname,
                'birth_year' => 0,
                'birth_month' => 0,
                'birth_day' => 0,
                'c_password_query_id' => 0,
                'c_member_id_invite' => 1,
                'is_receive_mail' => 1,
                'is_receive_ktai_mail' => 1,
                'is_receive_daily_news' => 1,
                'public_flag_birth_year' => 'public',
            );

            if (OPENPNE_AUTH_MODE == 'pneid') {
                $c_member['login_id'] = $login_id;
            }

            $c_member_secure = array(
                'password' => $password,
                'pc_address' => $pc_address,
                'ktai_address' => $ktai_address,
                'regist_address' => $mail_address,
            );

            $u = util_regist_c_member($c_member, $c_member_secure);
        }

        admin_client_redirect('import_c_member', "{$member_data_count}件のインポートが完了しました");
    }
}

?>
