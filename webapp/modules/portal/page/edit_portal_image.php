<?php
class portal_page_edit_portal_image extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();
        $pager = array();
        $size = 5;
        $portal_image_list = db_portal_image_list($requests['page'], $size, $pager);

        $v['portal_image_list'] = $portal_image_list;
        $v['pager'] = $pager;
        $v['target_area'] = $requests['target_area'];

        $this->set($v);

        return 'success';
    }
}

?>
