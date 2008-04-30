<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

// CMD削除確認画面
class admin_page_delete_c_cmd_confirm extends OpenPNE_Action
{
    function execute($requests)
    {
        $c_cmd = db_admin_get_c_cmd_one($requests['c_cmd_id']);

        if (!$c_cmd) {
            admin_client_redirect('list_c_cmd', '指定されたIDは無効です');
        }

        $permit_list = db_get_permit_list();
        $this->set("permit_list", $permit_list);

        $permit = $c_cmd['permit'];
        foreach ($permit_list as $key => $name) {
            $is_permit[$name] = ($permit & $key) ? 1:0 ;
        }
        $c_cmd['permit'] = $is_permit;

        $this->set("c_cmd", $c_cmd);

        return 'success';
    }
}

?>
