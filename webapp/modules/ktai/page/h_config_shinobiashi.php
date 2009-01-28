<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_page_h_config_shinobiashi extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['KTAI_C_MEMBER_ID'];

        if (!USE_SHINOBIASHI) {
            handle_kengen_error();
        }

        $c_member = db_member_c_member4c_member_id($u);
        $is_shinobiashi = db_member_is_shinobiashi($u);

        $this->set('c_member', $c_member);
        $this->set('is_shinobiashi', $is_shinobiashi);

        return 'success';
    }
}

?>
