({$inc_ktai_header|smarty:nodefaults})
({if $msg})
	<font color=red>※({$msg})</font>
({/if})
<center><font color="orange">({$c_member.nickname})さんの週間ｶﾚﾝﾀﾞｰ</font></center>
<hr>
<a href="({t_url m=ktai_biz a=page_fh_biz_schedule_add})&amp;target_id=({$c_member.c_member_id})&amp;({$tail})">予定登録</a><br>


({*BEGIN:container*})

<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$c_member.c_member_id})&amp;w=({$w-1})&amp;({$tail})">＜</a>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$c_member.c_member_id})&amp;({$tail})">■</a>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$c_member.c_member_id})&amp;w=({$w+1})&amp;({$tail})">＞</a><br>
<font color="green">({$y_disp})年({$m_disp})月</font><br>
<br>

({if $calendar})

({foreach from=$calendar item=item name=calendar})
({if $item.now})
■
({/if})
({if $item.day})
({if $item.now})
({$item.day})
(({$item.dayofweek}))
({elseif $item.dayofweek == "土"})
<font color="#0000ff">({$item.day})
(({$item.dayofweek}))</font>
({elseif $item.dayofweek == "日"})
<font color="#ff0000">({$item.day})
(({$item.dayofweek}))</font>
({else})
({$item.day})
(({$item.dayofweek}))
({/if})

({* イベント *})
({foreach from=$item.event item=item_event})
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})&amp;({$tail})">

({$item_event.name|truncate:13:"-":true})</a>&nbsp;
({/foreach})

({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})&amp;({$tail})">({$item_birth.nickname|truncate:13:"-":true})さん</a><br>
({/foreach})

({* スケジュール *})
({foreach from=$item.schedule item=item_schedule})

<a href="({t_url m=ktai_biz a=page_fh_biz_schedule_view})&amp;target_id=({$c_member.c_member_id})&amp;id=({$item_schedule.biz_schedule_id})&amp;({$tail})">
({strip})
({if $item_schedule.begin_time})
({$item_schedule.begin_time|date_format:"%H:%M"})
({/if})

({if $item_schedule.begin_time || $item_schedule.finish_time})
-
({/if})

({if $item_schedule.finish_time})
({$item_schedule.finish_time|date_format:"%H:%M"})
({/if})
({/strip})
({$item_schedule.title|truncate:13:"-":true})</a>&nbsp;

({/foreach})
({else})
&nbsp;
({/if})

<hr>

({/foreach})
({/if})
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$c_member.c_member_id})&amp;w=({$w-1})&amp;({$tail})">＜</a>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$c_member.c_member_id})&amp;({$tail})">■</a>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$c_member.c_member_id})&amp;w=({$w+1})&amp;({$tail})">＞</a><br>


({*END:container*})

({$inc_ktai_footer|smarty:nodefaults})
