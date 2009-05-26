<?php

class portal_page_edit_free_area extends OpenPNE_Action
{
    // とりあえず、IDの最小値、最大値をここで定義
    var $min_portal_free_area_id = 1;
    var $max_portal_free_area_id = 5;

    function execute($requests)
    {
        $v = array();

        for ($i = $this->min_portal_free_area_id; $i <= $this->max_portal_free_area_id; $i++) {
            $portal_free_area = db_portal_portal_free_area($i);
            $v['portal_free_area']['free_area_' .$i] = $portal_free_area['html'];
            $v['portal_free_area']['free_area_name_' .$i] = $portal_free_area['name'];
        }

        $this->set($v);
        return 'success';
    }
}

?>
