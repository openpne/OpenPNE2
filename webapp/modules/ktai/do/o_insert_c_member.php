<?php
/**
 * @copyright 2005-2007 OpenPNE Project
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
        if (defined('OPENPNE_REGIST_FROM') &&
                !((OPENPNE_REGIST_FROM & OPENPNE_REGIST_FROM_KTAI) >> 1)) {
            openpne_redirect('ktai', 'page_o_login');
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
            openpne_redirect('ktai', 'page_o_login');
        }
        //---

        // ブラックリストチェック
        if (db_is_c_black_list($pre['ktai_address'])) {
            // このアドレスでは登録できません
            $p = array('msg' => 37);
            openpne_redirect('ktai', 'page_o_login', $p);
        }


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
        $validator->addRules($this->_getValidateRulesProfile());
        if (!$validator->validate()) {
            $errors = array_merge($errors, $validator->getErrors());
        }

        // 値の整合性をチェック(DB)
        $c_member_profile_list = db_member_check_profile($validator->getParams(), $_REQUEST['public_flag']);

        // 必須項目チェック
        $profile_list = db_member_c_profile_list4null();
        foreach ($profile_list as $profile) {
            if ($profile['disp_regist'] &&
                $profile['is_required'] &&
                (is_null(!$c_member_profile_list[$profile['name']]['value']) || !$c_member_profile_list[$profile['name']]['value'] === '')
            ) {
                $errors[$profile['name']] = "{$profile['caption']}を入力してください";
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

        if (IS_GET_EASY_ACCESS_ID != 0) {
            $easy_access_id = OpenPNE_KtaiID::getID();
            if (!$easy_access_id && (IS_GET_EASY_ACCESS_ID == 2)) {
                $errors[] = '携帯の個体識別番号を取得できませんでした';
            }
        }

        // 入力エラー
        if ($errors) {
            ktai_display_error($errors);
        }

        // insert c_member
        $prof['ktai_address'] = $pre['ktai_address'];
        $prof['c_member_id_invite'] = $pre['c_member_id_invite'];

        switch ($prof['public_flag_birth_year']) {
        case "public":
        default:
            $prof['public_flag_birth_year'] = "public";
            break;
        case "friend":
            $prof['public_flag_birth_year'] = "friend";
            break;
        case "private":
            $prof['public_flag_birth_year'] = "private";
            break;
        }

        if (!$c_member_id = db_member_ktai_insert_c_member($prof)) {
            openpne_redirect('ktai', 'page_o_login');
        }

        // 端末IDの登録
        if ($easy_access_id) {
            db_member_update_easy_access_id($c_member_id, $easy_access_id);
        }

        //入会者にポイント加算
        $point = db_action_get_point4c_action_id(1);
        db_point_add_point($c_member_id, $point);

        //メンバー招待をした人にポイント付与
        $point = db_action_get_point4c_action_id(7);
        db_point_add_point($pre['c_member_id_invite'], $point);

        // insert c_member_profile
        db_member_update_c_member_profile($c_member_id, $c_member_profile_list);

        // insert c_friend(紹介者)
        db_friend_insert_c_friend($c_member_id, $pre['c_member_id_invite']);

        //管理画面で指定したコミュニティに強制参加
        $c_commu_id_list = db_commu_regist_join_list();
        foreach ($c_commu_id_list as $c_commu_id) {
            db_commu_join_c_commu($c_commu_id, $c_member_id);
        }

        // delete c_member_ktai_pre
        db_member_delete_c_member_ktai_pre4id($pre['c_member_ktai_pre_id']);

        do_insert_c_member_mail_send($c_member_id, $prof['password'], $pre['ktai_address']);

        if ($aff_id) {
            $p = array('aff_id' => $aff_id);
        } else {
            $p = array();
        }
        
        openpne_redirect('ktai', 'page_o_regist_end',$p);
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
            ),
            'password_query_answer' => array(
                'type' => 'string',
                'required' => '1',
                'caption' => '秘密の質問の答え',
            ),
        );
    }

    function _getValidateRulesProfile()
    {
        $rules = array();
        $profile_list = db_member_c_profile_list4null();
        foreach ($profile_list as $profile) {
            if ($profile['disp_regist']) {
                $rule = array(
                    'type' => 'int',
                    'required' => $profile['is_required'],
                    'caption' => $profile['caption'],
                );
                switch ($profile['form_type']) {
                case 'text':
                case 'textlong':
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
