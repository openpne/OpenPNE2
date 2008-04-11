({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_member.nickname})さんの週間ｶﾚﾝﾀﾞｰ</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
({$y_disp})年({$m_disp})月<br>
</td></tr></table>
[i:76]<a href="({t_url m=ktai_biz a=page_fh_biz_schedule_add})&amp;target_id=({$c_member.c_member_id})&amp;({$tail})">予定登録</a><br>
<hr color="#({$ktai_color_config.border_01})">
({if $msg})
<font color="#({$ktai_color_config.font_09})">※({$msg})</font><br>
({/if})
({*BEGIN:container*})
({if $calendar})
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({foreach from=$calendar item=item name=calendar})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({if $item.now})
<font color="#({$ktai_color_config.bg_05})">■</font>
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
<br>
({* イベント *})
({foreach from=$item.event item=item_event})
[i:155]<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})&amp;({$tail})">
({$item_event.name|truncate:28:"-":true})</a><br>
({/foreach})
({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
[i:72]<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})&amp;({$tail})">({$item_birth.nickname|truncate:28:"-":true})さん</a><br>
({/foreach})

({* スケジュール *})
({foreach from=$item.schedule item=item_schedule})
[i:176]<a href="({t_url m=ktai_biz a=page_fh_biz_schedule_view})&amp;target_id=({$c_member.c_member_id})&amp;id=({$item_schedule.biz_schedule_id})&amp;({$tail})">
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
({$item_schedule.title|truncate:14:"-":true})</a>
<br>
({/foreach})
({else})
({/if})
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
({/if})
<center>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$c_member.c_member_id})&amp;w=({$w-1})&amp;({$tail})" accesskey="4">[i:128]前の週</a>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$c_member.c_member_id})&amp;({$tail})" accesskey="5">[i:129]今週</a>
<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$c_member.c_member_id})&amp;w=({$w+1})&amp;({$tail})" accesskey="6">[i:130]次の週</a><br>
</center>
<br>
({*END:container*})

({$inc_ktai_footer|smarty:nodefaults})
