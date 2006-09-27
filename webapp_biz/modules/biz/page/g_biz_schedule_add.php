<?php
/**
 * @copyright 2005-2006 OpenPNE Project
 * @license   http://www.php.net/license/3_01.txt PHP License 3.01
 */

class biz_page_g_biz_schedule_add extends OpenPNE_Action
{
    function execute($requests)
    {
        $u = $GLOBALS['AUTH']->uid();

        $form_val['subject'] = $requests['subject'];
        $form_val['body'] = $requests['body'];

        $sessid = session_id();

        $this->set('inc_navi',fetch_inc_navi("h"));

        //プロフィール
        $this->set("target_member", db_common_c_member4c_member_id($u));
        $this->set("form_val", $form_val);

        //カレンダー関係
        //カレンダー開始用変数
        $year = date("Y");
        $month= date("n");
        //カレンダー用変数
        $date_val=  array(
            'year' => $year,
            'month' => $month,
            'day' => null,
        );
        $this->set("date_val", $date_val);
            
        //日記のカレンダー
        $calendar = db_common_diary_monthly_calendar($year, $month, $u);

        $this->set("calendar", $calendar['days']);
        $this->set("ym", $calendar['ym']);      

    //日付関連
        $nowyear = date("Y");
        $nowmonth = date("m");
        $nowday = date("d");

        for($i = $nowyear; $i <= $nowyear+10; $i++)
        {
            if($i == $nowyear)  //現在年をデフォルトに
                $years = '<option value="'.$i.'" selected>';
            else
                $years .= '<option value="'.$i.'">';
            $years .= $i.'年';
        }
        
        for($i = 1; $i <= 12; $i++)
        {
            $i_f = sprintf("%02d",$i);  //月は常に二桁
            if($i == $nowmonth)  //現在月をデフォルトに
                $monthes .= '<option value="'.$i_f.'" selected>';
            else
                $monthes .= '<option value="'.$i_f.'">';
            $monthes .= $i.'月';
        }

        for($i = 1; $i <= 31; $i++)
        {
            $i_f = sprintf("%02d",$i);  //日は常に二桁
            if($i == $nowday)
                $days .= '<option value="'.$i_f.'" selected>';
            else
                $days .= '<option value="'.$i_f.'">';
            $days .= $i.'日';
        }

        $hours = biz_makeSerialArray(23);  //時
        $mins = biz_makeSerialArray(55, 0, 5);  //分
        $wk = array('日', '月', '火', '水', '木', '金', '土');  //週
        $rp_count = biz_makeSerialArray(12, 1);  //繰り返し回数
        $bn_num = biz_makeSerialArray(31, 1);  //日数

        $this->set('years', $years);
        $this->set('monthes', $monthes);
        $this->set('days', $days);
        $this->set('hours', $hours);
        $this->set('mins', $mins);
        $this->set('wk', $wk);
        $this->set('rp_count', $rp_count);
        $this->set('bn_num', $bn_num);
        $this->set('my_id', $u);


    //データベースアクセス
        $member_list = array();
        $this->set('target_id', $requests['target_id']);
        foreach(biz_getGroupMember($requests['target_id']) as $key => $value)
            $member_list[$value['c_member_id']] = 1;
        $this->set('member_list', biz_getGroupMember($requests['target_id']));

    //追加
        $members = array();
        
        $sql = 'SELECT c_member_id, nickname FROM c_member WHERE c_member_id <>  ?';
        $params = array(
            intval($u),
        );

        $members = db_get_all($sql, $params);
        
        $sql = 'SELECT c_member_id, nickname FROM c_member WHERE c_member_id = ?';
        $params = array(
            intval($u),
        );
        $my_info = db_get_row($sql, $params);

        array_unshift($members, $my_info);

        foreach($members as $key => $value)
        {
            if(isset($member_list[$value['c_member_id']]))
                $members[$key]['checkflag'] = 1;
            else
                $members[$key]['checkflag'] = 0;
        }

        $this->set('member_list', $members);
        
        $this->set('shisetsu', biz_getShisetsuList());

        return 'success';
    }
}

?>
