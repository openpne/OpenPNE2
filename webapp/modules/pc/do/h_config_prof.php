<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class pc_do_h_config_prof extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $mode = $requests['mode'];
        $errors = array();

        $validator = new OpenPNE_Validator();
        $validator->addRequests($_REQUEST);
        $validator->addRules($this->_getValidateRules());
        if (!$validator->validate()) {
            $errors = array_merge($errors, $validator->getErrors());
        }
        $prof = $validator->getParams();

        //--- c_profile の項目をチェック
        $validator = new OpenPNE_Validator();
        $validator->addRequests($_REQUEST['profile']);
        $validator->addRules(util_get_validate_rules_profile('config'));
        if (!$validator->validate()) {
            $errors = array_merge($errors, $validator->getErrors());
        }

        // 値の整合性をチェック(DB)
        $c_member_profile_list = db_member_check_profile($validator->getParams(), $_REQUEST['public_flag']);

        // 必須項目チェック
        $profile_list = db_member_c_profile_list4null();
        foreach ($profile_list as $profile) {
            $value = $c_member_profile_list[$profile['name']]['value'];
            if ($profile['disp_config'] && $profile['is_required']) {
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

        if ($errors) {
            $_REQUEST['msg'] = array_shift($errors);
            $mode = "input";
        }

        switch ($mode) {
        case "input":
            $prof['profile'] = $c_member_profile_list;

            $_REQUEST['prof'] = $prof;
            openpne_forward('pc', 'page', "h_config_prof");
            exit;
            break;
        default:
        case "confirm":
            $prof['profile'] = $c_member_profile_list;

            $_REQUEST['prof'] = $prof; // page:h_config_prof_confirm への値の引渡し
            openpne_forward('pc', 'page', "h_config_prof_confirm");
            exit;
            break;
        case "register":
            db_member_config_prof_new($u, $prof);
            db_member_update_c_member_profile($u, $c_member_profile_list);
            db_member_update_c_member_config($u, 'IS_SEARCH_RESULT', $prof['is_search_result']);

            openpne_redirect('pc', 'page_h_prof');
            break;
        }
    }

    function _getValidateRules()
    {
        return array(
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
            'is_search_result' => array(
                'type' => 'int',
                'regexp' => '/^(0|1)$/',
                'required' => '1',
                'caption' => '検索設定',
            ),
        );
    }
}

?>
