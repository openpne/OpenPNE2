<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class ktai_biz_page_fh_biz_schedule_add extends OpenPNE_Action
{
    function execute($requests)
    {

        $u  = $GLOBALS['KTAI_C_MEMBER_ID'];
        $this->set('tail', $GLOBALS['KTAI_URL_TAIL']);

        if(empty($requests['target_id']) || ($requests['target_id'] == $u)) //自分
        {
            $target_id = $u;
            $this->set('is_h', true);       //判別フラグ

        }else{  //他人

            $target_id = $requests['target_id'];
            $this->set('is_f', true);       //判別フラグ
        }

        $this->set('inc_navi', fetch_inc_navi($cmd));

        //プロフィール
        $this->set("target_member", $target_member);
        $this->set("form_val", $form_val);

        //日付
        $now = array(
        'year' => date("y"),
        'month' => date("n"),
        'day' => date("d"));

        //参加しているグループ
        $jgroup = biz_getJoinGroup($target_id);

        foreach($jgroup as $value){
                $gname[$i] = $value['name'];
                $gid[$i] = $value['biz_group_id'];
                $i++;
        }

        $this->set('now', $now);    
        $this->set('jgroup', $jgroup);
        $this->set('gname', $gname);
        $this->set('gid', $gid);
        $this->set('msg', $requests['msg']);
        $this->set('t_id', $target_id);

        return 'success';
    }
}

?>
