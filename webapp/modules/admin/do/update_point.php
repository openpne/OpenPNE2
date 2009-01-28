<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

//ポイント情報更新
class admin_do_update_point extends OpenPNE_Action
{
    function handleError($errors)
    {
        admin_client_redirect('edit_point', array_shift($errors), 'target_c_member_id='.$this->requests['target_c_member_id']);
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_POINT_RANK || (!OPENPNE_IS_POINT_ADMIN && $requests['target_c_member_id'] == 1)) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        $target_c_member_id = $requests['target_c_member_id'];
        $update_point = $requests['point'];

        $c_profile = db_member_c_profile4name('PNE_POINT');

        $c_member_profile_list['PNE_POINT'] = array(
            'c_profile_id' => $c_profile['c_profile_id'],
            'c_profile_option_id' => 0,
            'value' => intval($update_point),
            'public_flag' => $c_profile['public_flag_default'],
        );

        db_member_update_c_member_profile($target_c_member_id, $c_member_profile_list);
        admin_client_redirect('list_c_member', "メンバーのポイントを強制変更しました");
    }
}

?>
