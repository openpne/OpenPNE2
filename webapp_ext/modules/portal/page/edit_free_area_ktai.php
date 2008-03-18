<?php

class portal_page_edit_free_area_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $max_portal_free_area_id = 4;
        $v = array();

        for ($i = 1; $i <= $max_portal_free_area_id; $i++) {
            $portal_free_area = db_portal_portal_free_area_ktai($i);
            $v['portal_free_area_ktai']['free_area_ktai_' .$i] = $portal_free_area['html'];
            $v['portal_free_area_ktai']['free_area_ktai_name_' .$i] = $portal_free_area['name'];
        }

        $this->set($v);
        return 'success';
    }
}

?>
