({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">予定の全参加者</a></font><br>
</td></tr></table>
<br>
<table width="100%"><tr><td>
<hr color="#b3ceef"></td></tr>
({*BEGIN:container*})
({foreach item=name key=id from=$jmembers})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$id})&amp;({$tail})">({$name})</a><br>
</td></tr>
({/foreach})
<tr><td><hr color="#b3ceef"></td></tr></table>
%%i90%%<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
