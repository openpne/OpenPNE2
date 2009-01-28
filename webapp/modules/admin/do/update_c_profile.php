<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// プロフィール項目編集
class admin_do_update_c_profile extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('update_c_profile', array_shift($errors),
            'c_profile_id='.$this->requests['c_profile_id']);
    }

    function execute($requests)
    {
        $id = db_admin_c_profile_name_exists($requests['name']);
        if ($id && ($id != $requests['c_profile_id'])) {
            admin_client_redirect('update_c_profile', 'その識別名は既に登録されています',
                'c_profile_id='.$requests['c_profile_id']);
        }
        if (is_numeric($requests['name'])) {
            admin_client_redirect('update_c_profile', '識別名は数値のみには設定できません',
                'c_profile_id='.$requests['c_profile_id']);
        }

        db_admin_update_c_profile($requests['c_profile_id'],
            $requests['name'],
            $requests['caption'],
            $requests['info'],
            $requests['is_required'],
            $requests['public_flag_edit'],
            $requests['public_flag_default'],
            $requests['form_type'],
            $requests['sort_order'],
            $requests['disp_regist'],
            $requests['disp_config'],
            $requests['disp_search'],
            $requests['val_type'],
            $requests['val_regexp'],
            $requests['val_min'],
            $requests['val_max']);

        admin_client_redirect('edit_c_profile', 'プロフィール項目を編集しました');
    }
}

?>
