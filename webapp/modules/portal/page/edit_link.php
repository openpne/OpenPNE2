<?php

class portal_page_edit_link extends OpenPNE_Action
{

    function execute($requests)
    {
        $portal_link_list = db_portal_get_portal_link();
        $this->set('portal_link_list', $portal_link_list);

        return 'success';
    }
}

?>
