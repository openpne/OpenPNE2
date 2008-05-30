<?php

class portal_do_edit_free_area extends OpenPNE_Action
{
    // とりあえず、IDの最小値、最大値をここで定義
    var $min_portal_free_area_id = 1;
    var $max_portal_free_area_id = 5;

    function execute($requests)
    {
        for ($i = $this->min_portal_free_area_id; $i <= $this->max_portal_free_area_id; $i++) {
            $html = strval($requests['free_area_'.$i]);
            $name = $requests['free_area_name_' . $i];
            $data = array(
                'portal_free_area_id' => intval($i),
                'name' => $name,
                'html' => $html,
            );

            if (db_portal_portal_free_area($i)) {
                db_portal_update_portal_free_area($data);
            } else {
                db_portal_insert_portal_free_area($data);
            }
        }

        portal_client_redirect('edit_free_area', 'フリーエリア設定を変更しました');
    }

    function handleError($errors)
    {
        portal_client_redirect('edit_free_area', '入力が正しくありません');
    }

}

?>
