<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_edit_point extends OpenPNE_Action
{
    function handleError()
    {
        admin_client_redirect('list_c_member');
    }

    function execute($requests)
    {
        if (!OPENPNE_USE_POINT_RANK || (!OPENPNE_IS_POINT_ADMIN && $requests['target_c_member_id'] == 1)) {
            admin_client_redirect('top', '指定されたページにはアクセスできません');
        }

        $lite = db_member_c_member4c_member_id_LIGHT($requests['target_c_member_id']);
        $prof = db_member_c_member_profile_list4c_member_id($requests['target_c_member_id'],"private");
        $point = intval($prof['PNE_POINT']['value']);

        $item = array(
                "c_member_id" => $requests['target_c_member_id'],
                "nickname" => $lite['nickname'],
                "point" => $point,
            );

        $v = array();

        $v['point'] = $point;
        $v['item'] = $item;
        $this->set($v);
        return 'success';
    }
}

?>
