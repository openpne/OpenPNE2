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
            session_start();
            $validator->addRequests($_SESSION['prof']);
            $requests['password2'] = $_SESSION['prof']['password'];
            unset($_SESSION['prof']);
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
            $errors['password2'] = '繝代せ繝ｯ繝ｼ繝峨′荳閾ｴ縺励※縺・∪縺帙ｓ';
        }

        //--- c_profile 縺ｮ鬆・岼繧偵メ繧ｧ繝・け
        $validator = new OpenPNE_Validator();
        $validator->addRequests($_REQUEST['profile']);
        $validator->addRules($this->_getValidateRulesProfile());
        if (!$validator->validate()) {
            $errors = array_merge($errors, $validator->getErrors());
        }

        // 蛟､縺ｮ謨ｴ蜷域ｧ繧偵メ繧ｧ繝・け(DB)
        $c_member_profile_list = do_config_prof_check_profile($validator->getParams(), $_REQUEST['public_flag']);


        // 蠢・磯・岼繝√ぉ繝・け
        $profile_list = db_common_c_profile_list4null();
        foreach ($profile_list as $profile) {
            if ( $profile['disp_regist'] &&
                $profile['is_required'] &&
                !$c_member_profile_list[$profile['name']]['value']
            ) {
                $errors[$profile['name']] = $profile['caption'] . '繧貞・蜉帙＠縺ｦ縺上□縺輔＞';
                break;
            }
        }

        // 逕溷ｹｴ譛域律縺ｮ繝√ぉ繝・け
        if (!t_checkdate($prof['birth_month'], $prof['birth_day'], $prof['birth_year'])) {
            $errors[] = '逕溷ｹｴ譛域律繧呈ｭ｣縺励￥蜈･蜉帙＠縺ｦ縺上□縺輔＞';
        }
        if (t_isFutureDate($prof['birth_day'], $prof['birth_month'], $prof['birth_year'])) {
            $errors[] = '逕溷ｹｴ譛域律繧呈悴譚･縺ｫ險ｭ螳壹☆繧九％縺ｨ縺ｯ縺ｧ縺阪∪縺帙ｓ';
        }

        if ($mode != 'input' && $errors) {
            $_REQUEST['err_msg'] = $errors;
            $mode = 'input';
        }

        switch ($mode) {
        case 'input':
            $prof['profile'] = $c_member_profile_list;

            session_start();
            if (!isset($_SESSION['prof'])) {
                $_SESSION['prof'] = $prof;
            }
            unset($prof['password']);

            openpne_forward('pc', 'page', 'o_regist_prof');
            exit;
        case 'confirm':
        default:
            $prof['profile'] = $c_member_profile_list;

            session_start();
            if (!isset($_SESSION['prof'])) {
                $_SESSION['prof'] = $prof;
            }

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

            // 諡帛ｾ・・→繝輔Ξ繝ｳ繝峨Μ繝ｳ繧ｯ
            db_friend_insert_c_friend($u, $pre['c_member_id_invite']);

            //邂｡逅・判髱｢縺ｧ謖・ｮ壹＠縺溘さ繝溘Η繝九ユ繧｣縺ｫ蠑ｷ蛻ｶ蜿ょ刈
            $c_commu_id_list = db_commu_regist_join_list();
            foreach ($c_commu_id_list as $c_commu_id) {
                do_inc_join_c_commu($c_commu_id, $u);
            }

            // pre 縺ｮ蜀・ｮｹ繧貞炎髯､
            do_common_delete_c_member_pre4sid($sid);

            // 逋ｻ骭ｲ螳御ｺ・Γ繝ｼ繝ｫ騾∽ｿ｡
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
                'caption' => '繝九ャ繧ｯ繝阪・繝',
                'max' => '40',
            ),
            'birth_year' => array(
                'type' => 'int',
                'required' => '1',
                'caption' => '逕溘∪繧後◆蟷ｴ',
                'min' => '1901',
            ),
            'birth_month' => array(
                'type' => 'int',
                'required' => '1',
                'caption' => '隱慕函譛・,
                'min' => '1',
                'max' => '12',
            ),
            'birth_day' => array(
                'type' => 'int',
                'required' => '1',
                'caption' => '隱慕函譌･',
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
                'caption' => '繝代せ繝ｯ繝ｼ繝・,
                'min' => '6',
                'max' => '12',
            ),
            'c_password_query_id' => array(
                'type' => 'int',
                'required' => '1',
                'caption' => '遘伜ｯ・・雉ｪ蝠・,
                'required_error' => '遘伜ｯ・・雉ｪ蝠上ｒ驕ｸ謚槭＠縺ｦ縺上□縺輔＞',
                'min' => '1',
            ),
            'c_password_query_answer' => array(
                'type' => 'string',
                'required' => '1',
                'caption' => '遘伜ｯ・・雉ｪ蝠上・遲斐∴',
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
