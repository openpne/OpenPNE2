<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_o_regist_prof extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>

        $sid = $requests['sid'];
        if (!db_member_is_active_sid($sid)) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        $pre = db_member_c_member_pre4sid($sid);

        $mode = $requests['mode'];
        $errors = array();

        $validator = new OpenPNE_Validator();
        if ($mode == 'register') {
            session_name('OpenPNEpcregist');
            @session_start();
            $validator->addRequests($_SESSION['prof']);
            $requests['password2'] = $_SESSION['prof']['password'];
        } else {
            $validator->addRequests($_REQUEST);
        }
        $validator->addRules($this->_getValidateRules());
        if (!$validator->validate()) {
            $errors = $validator->getErrors();
        }

        $prof = $validator->getParams();

        if ($prof['password'] !== $requests['password2']) {
            $errors['password2'] = 'パスワードが一致していません';
        }

        //--- c_profile の項目をチェック
        $validator = new OpenPNE_Validator();
        if ($mode == 'register') {
            $validator->addRequests($_SESSION['prof']['profile']);
            $public_flag_list = $_SESSION['prof']['public_flag'];
        } else {
            $validator->addRequests($_REQUEST['profile']);
            $public_flag_list = $_REQUEST['public_flag'];
        }
        $validator->addRules(util_get_validate_rules_profile('regist'));
        if (!$validator->validate()) {
            $errors = array_merge($errors, $validator->getErrors());
        }

        // 値の整合性をチェック(DB)
        $c_member_profile_list = db_member_check_profile($validator->getParams(), $public_flag_list);

        // 必須項目チェック
        $profile_list = db_member_c_profile_list4null();
        foreach ($profile_list as $profile) {
            $value = $c_member_profile_list[$profile['name']]['value'];
            if ($profile['disp_regist'] && $profile['is_required']) {
                if (is_null($value) || $value === '' || $value === array()) {
                    $errors[$profile['name']] = $profile['caption'] . 'を入力してください';
                }
            }
        }

        // 生年月日のチェック
        if (!t_checkdate($prof['birth_month'], $prof['birth_day'], $prof['birth_year'])) {
            $errors[] = '生年月日を正しく入力してください';
        }
        if (t_isFutureDate($prof['birth_day'], $prof['birth_month'], $prof['birth_year'])) {
            $errors[] = '生年月日を未来に設定することはできません';
        }

        if (OPENPNE_AUTH_MODE == 'pneid') {
            // ログインIDの重複チェック
            if (db_member_c_member_id4username($prof['login_id'])) {
                $errors[] = 'このログインIDはすでに登録されています';
            }
        }

        if ($mode != 'input' && $errors) {
            $_REQUEST['err_msg'] = $errors;
            $mode = 'input';
            @session_start();
            $_SESSION['prof'] = $_REQUEST;
            unset($_SESSION['password']);
        }

        switch ($mode) {
        case 'input':
            $prof['profile'] = $c_member_profile_list;
            unset($prof['password']);

            openpne_forward('pc', 'page', 'o_regist_prof');
            exit;
        case 'confirm':
        default:
            $prof['profile'] = $c_member_profile_list;

            session_name('OpenPNEpcregist');
            @session_start();
            $_SESSION['prof'] = $_REQUEST;

            $_REQUEST['prof'] = $prof;
            openpne_forward('pc', 'page', 'o_regist_prof_confirm');
            exit;
        case 'register':
            $pre = db_member_c_member_pre4sid($sid);
             // delete cookie
            setcookie(session_name(), '', time() - 3600, ini_get('session.cookie_path'));

            if ((IS_GET_EASY_ACCESS_ID != 3) || $pre['is_disabled_regist_easy_access_id']) {
                // 管理者へ承認申請
                if (IS_SNS_ENTRY_CONFIRM) {
                    // c_member_pre にデータ挿入
                    $c_member_pre_secure = array(
                        'session' => $pre['session'],
                        'nickname' => $prof['nickname'],
                        'birth_year' => $prof['birth_year'],
                        'birth_month' => $prof['birth_month'],
                        'birth_day' => $prof['birth_day'],
                        'public_flag_birth_year' => $prof['public_flag_birth_year'],
                        'public_flag_birth_month_day' => $prof['public_flag_birth_month_day'],
                        'password' => $prof['password'],
                        'c_password_query_id' => $prof['c_password_query_id'],
                        'c_password_query_answer' => $prof['c_password_query_answer'],
                        'pc_address' => $pre['pc_address'],
                        'regist_address' => $pre['pc_address'],
                        'is_sns_entry_confirm' => 1,
                    );
                    // c_member_pre_profile にデータ挿入
                    db_member_update_c_member_pre_profile($pre['c_member_pre_id'], $c_member_profile_list);

                    if (OPENPNE_AUTH_MODE == 'pneid') {
                        $c_member_pre_secure['login_id'] = $prof['login_id'];
                    }

                    db_member_update_c_member_pre4c_member_pre_id($pre['c_member_pre_id'], $c_member_pre_secure);

                    openpne_redirect('pc', 'page_o_regist_wait', array('c_member_id' => $u));
                }

                // メンバー登録時の携帯個体識別番号取得設定が「PC・携帯登録時に個体識別番号を必須にする」でない場合、メンバー登録処理をおこなう
                $c_member = $prof;
                $c_member['c_member_id_invite'] = $pre['c_member_id_invite'];
                $c_member_secure = array(
                    'password' => $prof['password'],
                    'password_query_answer' => $prof['c_password_query_answer'],
                    'pc_address' => $pre['pc_address'],
                    'ktai_address' => '',
                    'regist_address' => $pre['pc_address'],
                );

                // メンバー登録
                $u = util_regist_c_member($c_member, $c_member_secure, $c_member_profile_list);

                // pre の内容を削除
                db_member_delete_c_member_pre4sid($sid);

                // 登録完了メール送信
                do_regist_prof_do_regist2_mail_send($u);

                // 登録完了メール(管理者宛)
                if (SEND_USER_DATA) {
                    do_common_send_mail_regist4admin($u);
                }

                openpne_redirect('pc', 'page_o_regist_end', array('c_member_id' => $u));
            } else {
                // メンバー登録時の携帯個体識別番号取得設定が「PC・携帯登録時に個体識別番号を必須にする」である場合、
                // ここでのメンバー登録はすべてスキップする。入力した項目は c_member_pre とc_member_pre_profile に
                // 保持しておき、携帯の登録が完了した場合に、メンバー登録も完了する

                // c_member_pre_profile にデータ挿入
                db_member_update_c_member_pre_profile($pre['c_member_pre_id'], $c_member_profile_list);

                // c_member_pre にデータ挿入
                $c_member_pre_secure = array(
                    'session' => $pre['session'],
                    'nickname' => $prof['nickname'],
                    'birth_year' => $prof['birth_year'],
                    'birth_month' => $prof['birth_month'],
                    'birth_day' => $prof['birth_day'],
                    'public_flag_birth_year' => $prof['public_flag_birth_year'],
                    'public_flag_birth_month_day' => $prof['public_flag_birth_month_day'],
                    'password' => $prof['password'],
                    'c_password_query_id' => $prof['c_password_query_id'],
                    'password_query_answer' => $prof['c_password_query_answer'],
                    'pc_address' => $pre['pc_address'],
                    'regist_address' => $pre['pc_address'],
                );

                if (OPENPNE_AUTH_MODE == 'pneid') {
                    $c_member_pre_secure['login_id'] = $prof['login_id'];
                }

                db_member_update_c_member_pre_secure($pre['c_member_pre_id'], $c_member_pre_secure);

                openpne_redirect('pc', 'page_o_regist_ktai_address', array('sid' => $pre['session']));
            }
        }
    }

    function _getValidateRules()
    {
        $rules = array(
            'nickname' => array(
                'type' => 'string',
                'required' => '1',
                'caption' => WORD_NICKNAME,
                'max' => '40',
            ),
            'birth_year' => array(
                'type' => 'int',
                'required' => '1',
                'caption' => '生まれた年',
                'min' => '1901',
            ),
            'birth_month' => array(
                'type' => 'int',
                'required' => '1',
                'caption' => '誕生月',
                'min' => '1',
                'max' => '12',
            ),
            'birth_day' => array(
                'type' => 'int',
                'required' => '1',
                'caption' => '誕生日',
                'min' => '1',
                'max' => '31',
            ),
            'public_flag_birth_year' => array(
                'type' => 'regexp',
                'regexp' => '/^(public|friend|private)$/',
                'required' => '1',
                'caption' => '公開範囲',
            ),
            'public_flag_birth_month_day' => array(
                'type' => 'regexp',
                'regexp' => '/^(public|friend|private)$/',
                'required' => '1',
                'caption' => '公開範囲',
            ),
            'password' => array(
                'type' => 'regexp',
                'regexp' => '/^[a-z0-9]+$/i',
                'required' => '1',
                'caption' => 'パスワード',
                'min' => '6',
                'max' => '12',
            ),
            'c_password_query_id' => array(
                'type' => 'int',
                'required' => '1',
                'caption' => '秘密の質問',
                'required_error' => '秘密の質問を選択してください',
                'min' => '1',
            ),
            'c_password_query_answer' => array(
                'type' => 'string',
                'required' => '1',
                'caption' => '秘密の質問の答え',
            ),
        );

        //秘密の質問省略モードの場合、秘密の質問に関するルールを削除する
        if (!IS_PASSWORD_QUERY_ANSWER) {
            unset($rules['c_password_query_id']);
            unset($rules['c_password_query_answer']);
        }

        if (OPENPNE_AUTH_MODE == 'pneid') {
            $rules['login_id'] = array(
                'type' => 'regexp',
                'regexp' => '/^[a-zA-Z0-9][a-zA-Z0-9\-_]+[a-zA-Z0-9]$/i',
                'required' => '1',
                'caption' => 'ログインID',
                'type_error' => 'ログインIDは4～30文字の半角英数字、記号（アンダーバー「_」、ハイフン「-」）で入力してください',
                'min' => '4',
                'max' => '30',
            );
        }

        return $rules;
    }
}

?>
