<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

require_once 'OpenPNE/KtaiID.php';

class ktai_do_o_insert_c_member extends OpenPNE_Action
{
    function isSecure()
    {
        return false;
    }

    function execute($requests)
    {
        //<PCKTAI
        if (OPENPNE_AUTH_MODE == 'slavepne' || !((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }
        //>

        // --- リクエスト変数
        $ses = $requests['ses'];
        $aff_id = $requests['aff_id'];
        // ----------

        //--- 権限チェック
        //セッションが有効

        // セッションが有効かどうか
        if (!$pre = db_member_c_member_ktai_pre4session($ses)) {
            // 無効の場合、login へリダイレクト
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }

        // メールアドレスが登録できるかどうか
        if (!util_is_regist_mail_address($pre['ktai_address'])) {
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }
        //---

        $errors = array();

        $validator = new OpenPNE_Validator();
        $validator->addRequests($_REQUEST);
        $validator->addRules($this->_getValidateRules());
        if (!$validator->validate()) {
            $errors = $validator->getErrors();
        }

        $prof = $validator->getParams();

        //--- c_profile の項目をチェック
        $validator = new OpenPNE_Validator();
        $validator->addRequests($_REQUEST['profile']);
        $validator->addRules(util_get_validate_rules_profile('regist'));
        if (!$validator->validate()) {
            $errors = array_merge($errors, $validator->getErrors());
        }

        // 値の整合性をチェック(DB)
        $c_member_profile_list = db_member_check_profile($validator->getParams(), $_REQUEST['public_flag']);

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

        if (IS_GET_EASY_ACCESS_ID != 0) {
            $easy_access_id = OpenPNE_KtaiID::getID();
            if (!$easy_access_id && (IS_GET_EASY_ACCESS_ID == 2 || IS_GET_EASY_ACCESS_ID == 3) && (!$pre['is_disabled_regist_easy_access_id'])) {
                openpne_redirect('ktai', 'page_o_regist_ktai_uid_err');
            }
            if (db_member_c_member_id4easy_access_id($easy_access_id)) {
                $errors[] = 'この携帯個体識別番号はすでに登録されています';
            }
            if (db_member_easy_access_id_is_blacklist(md5($easy_access_id))) {
                ktai_display_error('新規登録を完了できませんでした。');
            }
        }

        if (OPENPNE_AUTH_MODE == 'pneid') {
            // ログインIDの重複チェック
            if (db_member_c_member_id4username($prof['login_id'])) {
                $errors[] = 'このﾛｸﾞｲﾝIDはすでに登録されています';
            }
        }

        // 入力エラー
        if ($errors) {
            ktai_display_error($errors);
        }

        // insert c_member
        $prof['c_member_id_invite'] = $pre['c_member_id_invite'];

        // 参加承認制
        if (IS_SNS_ENTRY_CONFIRM) {
            $c_member_secure = array(
                    'password' => $prof['password'],
                    'c_password_query_answer' => $prof['password_query_answer'],
                    'ktai_address' => $pre['ktai_address'],
                    'regist_address' => $pre['ktai_address'],
                    'nickname' => $prof['nickname'],
                    'birth_year' => $prof['birth_year'],
                    'birth_month' => $prof['birth_month'],
                    'birth_day' => $prof['birth_day'],
                    'public_flag_birth_year' => $prof['public_flag_birth_year'],
                    'public_flag_birth_month_day' => $prof['public_flag_birth_month_day'],
                    'c_password_query_id' => $prof['c_password_query_id'],
                    'is_sns_entry_confirm' => 1);

            if ($easy_access_id) {
                $c_member_secure['easy_access_id'] = $easy_access_id;
            }

            if (OPENPNE_AUTH_MODE == 'pneid') {
                $c_member_secure['login_id'] = $prof['login_id'];
            }

            // いったん追加
            $c_member_pre_id = db_member_insert_c_member_pre_from_ktai(
                                                    $prof['c_member_id_invite']
                                                   ,$pre['ktai_address']
                                                   ,$pre['ktai_address']
                                                   ,$pre['session']);

            // 登録
            db_member_update_c_member_pre4c_member_pre_id($c_member_pre_id, $c_member_secure);
            // delete c_member_ktai_pre
            db_member_delete_c_member_ktai_pre4id($pre['c_member_ktai_pre_id']);

            openpne_redirect('ktai', 'page_o_regist_wait');
        }

        $c_member_secure = array(
            'password' => $prof['password'],
            'password_query_answer' => $prof['password_query_answer'],
            'pc_address' => '',
            'ktai_address' => $pre['ktai_address'],
            'regist_address' => $pre['ktai_address'],
        );

        if (!$c_member_id = util_regist_c_member($prof, $c_member_secure, $c_member_profile_list)) {
            openpne_redirect('ktai', 'page_o_login', array('msg' => 42));
        }

        // 個体識別番号の登録
        if ($easy_access_id) {
            db_member_update_easy_access_id($c_member_id, $easy_access_id);
        }

        // delete c_member_ktai_pre
        db_member_delete_c_member_ktai_pre4id($pre['c_member_ktai_pre_id']);

        do_insert_c_member_mail_send($c_member_id, $prof['password'], $pre['ktai_address']);

        // 登録完了メール(管理者宛)
        if (SEND_USER_DATA) {
            do_common_send_mail_regist4admin($c_member_id);
        }

        if ($aff_id) {
            $p = array('aff_id' => $aff_id);
        } else {
            $p = array();
        }
        $p['c_member_id'] = $c_member_id;

        openpne_redirect('ktai', 'page_o_regist_end',$p);
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
                'max' => date('Y'),
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
                'min' => '1',
                'caption' => '秘密の質問',
                'required_error' => '秘密の質問を選択してください',
            ),
            'password_query_answer' => array(
                'type' => 'string',
                'required' => '1',
                'caption' => '秘密の質問の答え',
            ),
        );


        //秘密の質問省略モードの場合、秘密の質問に関するルールを削除する
        if (!IS_PASSWORD_QUERY_ANSWER) {
            unset($rules['c_password_query_id']);
            unset($rules['password_query_answer']);
        }

        if (OPENPNE_AUTH_MODE == 'pneid') {
            $rules['login_id'] = array(
                'type' => 'regexp',
                'regexp' => '/^[a-zA-Z0-9][a-zA-Z0-9\-_]+[a-zA-Z0-9]$/i',
                'required' => '1',
                'caption' => 'ﾛｸﾞｲﾝID',
                'type_error' => 'ﾛｸﾞｲﾝIDは4-30文字の半角英数字、記号(ｱﾝﾀﾞｰﾊﾞｰ「_」、ﾊｲﾌﾝ「-」)で入力してください',
                'min' => '4',
                'max' => '30',
            );
        }

        return $rules;
    }
}

?>
