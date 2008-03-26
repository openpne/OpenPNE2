<?php

class portal_do_edit_free_area_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $max_portal_free_area_id = 4;

        for ($i = 1; $i <= $max_portal_free_area_id; $i++) {
            $html = strval($requests['free_area_ktai_'.$i]);
            $name = $requests['free_area_ktai_name_' . $i];
            $data = array(
                'name' => $name,
                'html' => $html,
            );

            $portal_free_area_ktai = null;
            if (db_portal_portal_free_area_ktai($i)) {
                $portal_free_area_ktai = $i;
            }

            $r = db_portal_update_portal_free_area_ktai($portal_free_area_ktai, $data);
        }

        portal_client_redirect('edit_free_area_ktai', 'フリーエリア設定を変更しました');
    }

    function handleError($errors)
    {
        portal_client_redirect('edit_free_area_ktai', '入力が正しくありません');
    }

}

?>
