<?php
/**
 * @copyright 2005-2008 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_page_fh_biz_schedule_view_member extends OpenPNE_Action
{
    function execute($requests)
    {
        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $this->set('tail', $GLOBALS['KTAI_URL_TAIL']);

        if (empty($requests['target_id']) || ($requests['target_id'] == $u)) {
            //自分自身
            $target_id = $u;
            $this->set('is_h', true);  //判別フラグ
        } else {
            //他人
            $target_id = $requests['target_id'];
            $this->set('is_f', true);  //判別フラグ
        }

        $this->set('inc_navi',fetch_inc_navi("h"));

        $jmembers = biz_getJoinMemberSchedule($requests['id']);
        if (array_search($target_member['nickname'], $jmembers)) {
            $jmembers[$target_member['c_member_id']] = $target_member['nickname'];
            $jmembers = array_unique($jmembers);
        }

        $this->set('jmembers', $jmembers);
        $this->set('jmembers_enc', serialize($jmembers));
        $this->set('t_id', $target_id);
        return 'success';
    }
}

?>
