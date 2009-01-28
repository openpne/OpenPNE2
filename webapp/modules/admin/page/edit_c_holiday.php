<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class admin_page_edit_c_holiday extends OpenPNE_Action
{
    function execute($requests)
    {
        $v = array();

        $v['c_holiday_list'] = db_admin_c_holiday_list();

        $month_list = array();
        for ($i=1; $i <= 12; $i++) {
            $month_list[$i] = $i;
        }
        $this->set('month_list', $month_list);

        $day_list = array();
        for ($i=1; $i <= 31; $i++) {
            $day_list[$i] = $i;
        }
        $this->set('day_list', $day_list);

        $this->set($v);

        return 'success';
    }
}

?>
