({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">予定の全参加者</font></center>
<hr>
({*BEGIN:container*})
({foreach item=name key=id from=$jmembers})
	<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$id})&amp;({$tail})">({$name})</a><br>
({/foreach})
<hr>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
