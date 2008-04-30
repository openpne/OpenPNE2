<?php
class portal_page_edit_portal_use_ktai extends OpenPNE_Action
{
    function execute($requests)
    {
        $data = db_portal_config('USE_PORTAL_KTAI');

        $v = array();
        if (is_null($data)) {
            $v['portal_config']['use_portal'] = 0;
        } else {
            $v['portal_config']['use_portal'] = $data['value'];
        }

        $this->set($v);
        return 'success';
    }
}

?>
