<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_page_fh_biz_todo_add extends OpenPNE_Action
{
    function execute($requests)
    {

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $this->set('tail', $GLOBALS['KTAI_URL_TAIL']);

        if (empty($requests['target_c_member_id']) || ($requests['target_c_member_id'] == $u)) {
            //自分
            $target_c_member_id = $u;
            $this->set('is_h', true);       //判別フラグ
        } else {
            //他人
            $target_c_member_id = $requests['target_c_member_id'];
            $this->set('is_f', true);       //判別フラグ
        }

        $this->set('target_c_member_id', $target_c_member_id);

        return 'success';
    }
}

?>
