({if $head})
<div class="dparts bizWeeklyCalendarTable"><div class="parts">

({if $cmd == "g"})

<div class="block moreInfo">
({t_form_block m=biz a=do_g_home_add_biz_schedule})
<input type="hidden" name="target_id" value="({$target_id})" />
<a href="({t_url m=biz a=page_fh_biz_schedule_add})&amp;target_biz_group_id=({$target_id})">新規予定登録</a>
<label for="title">予定</label>
<input type="text" class="input_text" name="title" id="title" value="" size="30" />
<select name="start_date">
({foreach from=$daylist item=item})
<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({/foreach})
</select>
<input type="submit" class="input_submit" value="　追　加　" />
<a href="({t_url m=biz a=page_g_home})&amp;w=({$w-1})&amp;target_c_commu_id=({$target_id})" title="前の週">＜</a>
<a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$target_id})" title="今週">■</a>
<a href="({t_url m=biz a=page_g_home})&amp;w=({$w+1})&amp;target_c_commu_id=({$target_id})" title="次の週">＞</a>
({/t_form_block})
</div>

({elseif $cmd == "s_list"})

<div class="partsHeading"><h3>({$list.name})</h3></div>

({if $list.info})
<div class="block">
<p>({$list.info})</p>
</div>
({/if})

<div class="block moreInfo">
({t_form_block m=biz a=do_s_add_schedule})
<input type="hidden" name="shisetsu_id" value="({$target_id})" />
施設予約を入れる:
<select name="start_date">
({foreach from=$calendar item=item})
<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({/foreach})
</select>
<select name="start_time">
<option value="">現在時</option>
({section name=i loop=$hours})
<option value="({if $hours[i] < 10 })0({/if})({$hours[i]})">({$hours[i]})時</option>
({/section})
</select>
から
<select name="finish_time">
({section name=i loop=$mins})
<option value="({$mins[i]})">({$mins[i]})分後</option>
({/section})
</select>
まで
<input type="submit" class="input_submit" value="　追　加　" />
<a href="({t_url m=biz a=page_s_list})&amp;w=({$w-1})" title="前の週">＜</a>
<a href="({t_url m=biz a=page_s_list})" title="今週">■</a>
<a href="({t_url m=biz a=page_s_list})&amp;w=({$w+1})" title="次の週">＞</a>
({/t_form_block})
</div>

({/if})

({/if})({* /head *})
({if $value})

<table class="calendar">
<tr>

<th rowspan="2">
({if $cmd == "s_list"})
<img src="({t_img_url filename=$list.image_filename w=120 h=120 noimg=no_image})" alt="" /><br />
({else})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member_info.c_member_id})"><img src="({t_img_url filename=$member_info.image_filename w=120 h=120 noimg=no_image})" alt="" class="member_image" /></a><br />
({/if})

({if $cmd == "s_list"})

({if !$is_closed_shisetsu})
<input type="button" class="input_submit" onclick="location.href='({t_url m=biz a=page_s_edit_shisetsu})&amp;id=({$target_id})'" value="編　集" />
<input type="button" class="input_submit" onclick="location.href='({t_url m=biz a=page_s_delete_shisetsu})&amp;target_id=({$target_id})&amp;sessid=({$PHPSESSID})'" value="削　除" />
({/if})

({else})

({if $cmd != "h"})
({if $member_info.image_filename})
<ul class="moreInfo button">

({if $cmd=='p' || $cmd=='h'})
<li><input type="button" class="input_submit" onclick="location.href='({t_url m=pc a=page_h_config_image})'" value="写真を編集" /></li>
({else})
<li><input type="button" class="input_submit" onclick="location.href='({t_url m=pc a=page_f_show_image})&amp;target_c_member_id=({$member_info.c_member_id})'" value="もっと写真を見る" /></li>
({/if})

</ul>
({/if})
<p class="text"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member_info.c_member_id})">({$member_info.nickname})</a></p>
<p class="login_time">最終ログインは<br />({$member_info.last_login})</p>
({else})

({if $smarty.const.OPENPNE_IS_POINT_ADMIN || $member_info.c_member_id != 1})
({if ($smarty.const.OPENPNE_DISP_RANK && $rank) || ($smarty.const.OPENPNE_DISP_POINT && $point)})
({if $smarty.const.OPENPNE_DISP_RANK && $rank})
<p class="rank"><img src="({t_img_url filename=$rank.image_filename})" alt="({$rank.name})" /></p>
({/if})
({if $smarty.const.OPENPNE_DISP_POINT && $point})
<p class="point">({$point}) Point</p>
({/if})
({/if})
({/if})

<div class="nickname">
({t_form_block m=biz a=do_h_home_edit_nickname})
<input type="text" class="input_text" name="nickname" value="({$member_info.nickname})" /><br />
<input type="submit" class="input_submit" value="名前変更" /><br />
({/t_form_block})
</div>
<ul class="moreInfo button">
<li><input type="button" class="input_submit" onclick="location.href='({t_url m=pc a=page_h_config_image})'" value="写真を編集" /></li>
<li><input type="button" class="input_submit" onclick="location.href='({t_url m=pc a=page_h_config_prof})'" value="プロフィール変更" /></li>
</ul>
({/if})

({/if})
</th>

({foreach from=$calendar item=item name=calendar})
({strip})
<td({if $item.now}) class="today"({/if})>
<p class="day({if $item.dayofweek == "日"}) sun({elseif $item.dayofweek == "土"}) sat({/if})({if $item.holiday}) holiday({/if})">
({if $smarty.foreach.calendar.first || $item.day == 1})({$item.month})/({/if})({$item.day})(({$item.dayofweek}))
({foreach from=$item.holiday item=item_holiday})
<br />({$item_holiday})
({/foreach})
</p>

({* スケジュール(時間有) *})
({foreach from=$item.schedule item=item_schedule name=schedule})
({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
({elseif $cmd == 's_list'})

({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})

<p class="time">({ext_include file="inc_biz_schedule_week_time.tpl"})</p>
<p><a href="({t_url m=biz a=page_s_view_schedule})&amp;id=({$item_schedule.biz_shisetsu_schedule_id})">({$item_schedule.c_member_name})</a></p>

({elseif $item_schedule.begin_date != $item_schedule.finish_date})  <!--バナー予定 -->

({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})

<p class="time">({ext_include file="inc_biz_schedule_week_time.tpl"})</p>
<p><a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $cmd == 'p' || $cmd == 'f'})&amp;target_id=({$member_info.c_member_id})({/if})">({$item_schedule.title})</a></p>

({else})

({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({else})
({assign var="finish_time_H" value=""})
({assign var="finish_time_M" value=""})
({/if})

<p class="time">({ext_include file="inc_biz_schedule_week_time.tpl"})</p>
<p><a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $cmd == 'p' || $cmd == 'f'})&amp;target_id=({$member_info.c_member_id})({/if})">({$item_schedule.title})</a></p>

({/if})
({/foreach})

</td>
({/strip})
({/foreach})
</tr><tr>
({foreach from=$calendar item=item name=calendar})
({strip})
<td class="sub ({if $item.now}) today({/if})">

({if $cmd == 'h'})

({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
({if $item_birth.public_flag_birth_month_day != "private" || $c_member.c_member_id == $item_birth.c_member_id})
<p><img src="({t_img_url_skin filename=icon_birthday})" alt="誕生日" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a></p>
({/if})
({/foreach})

({* イベント *})
({foreach from=$item.event item=item_event})
<p><img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" alt="イベント" /><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name|t_truncate:20:".."})</a></p>
({/foreach})

({/if})

({* Todo *})
({foreach from=$item.todo item=item_todo})
<p><img src="./skin/default/img/biz/todo_icon.gif" alt="Todo" /><a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item_todo.biz_todo_id})&amp;target_id=({$member_info.c_member_id})">({$item_todo.memo|t_truncate:20:".."})</a></p>
({/foreach})

({* スケジュール(時間無) *})
({if $item.schedule})
({foreach from=$item.schedule item=item_schedule name=schedule})
({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
<p><img src="({t_img_url_skin filename=icon_pen})" alt="スケジュール" /><a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $cmd == 'p' || $cmd == 'f'})&amp;target_id=({$member_info.c_member_id})({/if})">({$item_schedule.title})</a></p>
({/if})
({/foreach})
({/if})

</td>
({/strip})
({/foreach})
</tr>
</table>

({/if})({* /value *})
({if $foot})

({if $cmd == 'h' || $cmd == 'p' || $cmd == 'f'})
<div class="block moreInfo">
({t_form_block m=biz a=do_`$cmd`_home_add_biz_schedule})

<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $cmd == 'p' || $cmd == 'f'})&amp;target_id=({$member_info.c_member_id})({/if})">月間カレンダー</a>

<input type="hidden" name="target_id" value="({$target_id})" />
<label for="title">予定</label> <input type="text" class="input_text" name="title" id="title" value="" size="30" />
<select name="start_date">
({foreach from=$daylist item=item})
<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({/foreach})
</select>
<input type="submit" class="input_submit" value="　追　加　" />

<a href="({t_url m=pc a=page_`$cmd`_home})&amp;w=({$w-1})({if $target_id})&amp;target_c_member_id=({$target_id})({/if})" title="前の週">＜</a>
<a href="({t_url m=pc a=page_`$cmd`_home})({if $target_id})&amp;target_c_member_id=({$target_id})({/if})" title="今週">■</a>
<a href="({t_url m=pc a=page_`$cmd`_home})&amp;w=({$w+1})({if $target_id})&amp;target_c_member_id=({$target_id})({/if})" title="次の週">＞</a>
({/t_form_block})
</div>
({/if})

</div></div>

({/if})({* /foot *})
