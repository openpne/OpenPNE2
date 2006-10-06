<?php
/**
 * @copyright 2005-2006 OpenPNE Project
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
        if (defined('OPENPNE_REGIST_FROM') &&
                !(OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_PC)) {
            client_redirect_login();
        }
        //>

        $sid = $requests['sid'];
        if (!n_regist_intro_is_active_sid($sid)) {
            $p = array('msg_code' => 'invalid_url');
            openpne_redirect('pc', 'page_o_tologin', $p);
        }

        $mode = $requests['mode'];
        $errors = array();

        $validator = new OpenPNE_Validator();
        if ($mode == 'register') {
            @session_start();
            $validator->addRequests($_SESSION['prof']);
            $requests['password2'] = $_SESSION['prof']['password'];
        } else {
            $validator->addRequests($_REQUEST);
        }
        $validator->addRules($this->_getValidateRules());
        if ($validator->validate()) {
            $errors = $validator->getErrors();
        }

        $prof = $validator->getParams();

        switch ($prof['public_flag_birth_year']) {
        case 'public':
        case 'friend':
        case 'private':
            break;
        default:
            $prof['public_flag_birth_year'] = 'public';
            break;
        }

        if ($prof['password'] != $requests['password2']) {
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
        $validator->addRules($this->_getValidateRulesProfile());
        if (!$validator->validate()) {
            $errors = array_merge($errors, $validator->getErrors());
        }

        // 値の整合性をチェック(DB)
        $c_member_profile_list = do_config_prof_check_profile($validator->getParams(), $public_flag_list);


        // 必須項目チェック
        $profile_list = db_common_c_profile_list4null();
        foreach ($profile_list as $profile) {
            if ( $profile['disp_regist'] &&
                $profile['is_required'] &&
                !$c_member_profile_list[$profile['name']]['value']
            ) {
                $errors[$profile['name']] = $profile['caption'] . 'を入力してください';
                break;
            }
        }

        // 生年月日のチェック
        if (!t_checkdate($prof['birth_month'], $prof['birth_day'], $prof['birth_year'])) {
            $errors[] = '生年月日を正しく入力してください';
        }
        if (t_isFutureDate($prof['birth_day'], $prof['birth_month'], $prof['birth_year'])) {
            $errors[] = '生年月日を未来に設定することはできません';
        }

        if ($mode != 'input' && $errors) {
            $_REQUEST['err_msg'] = $errors;
            $mode = 'input';
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

            @session_start();
            $_SESSION['prof'] = $_REQUEST;

            $_REQUEST['prof'] = $prof;
            openpne_forward('pc', 'page', 'o_regist_prof_confirm');
            exit;
        case 'register':
            $pre = do_common_c_member_pre4sid($sid);

            // c_member, c_member_secure
            $c_member = $prof;
            $c_member['c_member_id_invite'] = $pre['c_member_id_invite'];
            $c_member['is_receive_mail'] = 1;
            $c_member['is_receive_ktai_mail'] = 1;
            $c_member['is_receive_daily_news'] = 1;
            $c_member_secure = array(
                'password' => $prof['password'],
                'password_query_answer' => $prof['c_password_query_answer'],
                'pc_address' => $pre['pc_address'],
                'ktai_address' => '',
                'regist_address' => $pre['pc_address'],
            );
            $u = db_member_insert_c_member($c_member, $c_member_secure);

            // c_member_profile
            do_config_prof_update_c_member_profile($u, $c_member_profile_list);

            // 招待者とフレンドリンク
            db_friend_insert_c_friend($u, $pre['c_member_id_invite']);

            //管理画面で指定したコミュニティに強制参加
            $c_commu_id_list = db_commu_regist_join_list();
            foreach ($c_commu_id_list as $c_commu_id) {
                do_inc_join_c_commu($c_commu_id, $u);
            }

            // pre の内容を削除
            do_common_delete_c_member_pre4sid($sid);

            // 登録完了メール送信
            do_regist_prof_do_regist2_mail_send($u);

            openpne_redirect('pc', 'page_o_regist_end', array('c_member_id' => $u));
        }
    }

    function _getValidateRules()
    {
        return array(
            'nickname' => array(
                'type' => 'string',
                'required' => '1',
                'caption' => 'ニックネーム',
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
                'type' => 'string',
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
    }

    function _getValidateRulesProfile()
    {
        $rules = array();
        $profile_list = db_common_c_profile_list4null();
        foreach ($profile_list as $profile) {
            if ($profile['disp_regist']) {
                $rule = array(
                    'type' => 'int',
                    'required' => $profile['is_required'],
                    'caption' => $profile['caption'],
                );
                switch ($profile['form_type']) {
                case 'text':
                case 'textarea':
                    $rule['type'] = $profile['val_type'];
                    $rule['regexp'] = $profile['val_regexp'];
                    $rule['min'] = $profile['val_min'];
                    ($profile['val_max']) and $rule['max'] = $profile['val_max'];
                    break;
                case 'checkbox':
                    $rule['is_array'] = '1';
                    break;
                }
                $rules[$profile['name']] = $rule;
            }
        }
        return $rules;
    }
}

?>
