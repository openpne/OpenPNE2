<div id="LayoutC">
<div id="Center">

({* {{{ monthlyCalendarTable *})
<div class="dparts monthlyCalendarTable"><div class="parts">
<div class="partsHeading"><h3>({$ym.year_disp})年({$ym.month_disp})月のカレンダー</h3></div>
<div class="block">
<p class="moreInfo">
({if $smarty.const.USE_EXTRA_SERVICE})
<img src="({t_img_url_skin filename=icon_weather_FC})" alt="天気予報" /> <a href="({$smarty.const.OPENPNE_WEATHER_URL})" target="_blank">天気予報を見る</a>
({/if})
 <img src="({t_img_url_skin filename=icon_schedule})" alt="スケジュール" /> <a href="({t_url m=pc a=page_h_schedule_add})">スケジュールを追加</a>
</p>
<p class="pager">
<a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})">&lt;&lt; 前の月</a>
 | <a href="({t_url m=pc a=page_h_calendar})">今月</a>
 | <a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})">次の月 &gt;&gt;</a>
</p>
</div>

<table class="calendar">
<tr>
<th class="sun">日</th>
<th class="mon">月</th>
<th class="tue">火</th>
<th class="wed">水</th>
<th class="thu">木</th>
<th class="fri">金</th>
<th class="sat">土</th>
</tr>
({foreach from=$calendar item=week})
<tr>
({foreach from=$week item=item name=weekloop})
<td class="day({if $item.now}) today({/if})({if $smarty.foreach.weekloop.first}) sun({/if})({if $item.holiday}) holiday({/if})">({strip})
({if $item.day})
({$item.day})

({if $add_schedule})
<p><a href="({t_url m=pc a=page_h_schedule_add})&amp;year=({$ym.year_disp})&amp;month=({$ym.month_disp})&amp;day=({$item.day})"><img src="({t_img_url_skin filename=icon_schedule})" alt="スケジュールを追加" /></a></p>
({/if})

({* 祝日 *})
({if $item.holiday})
({foreach from=$item.holiday item=item_holiday})
<p>({$item_holiday})</p>
({/foreach})
({/if})

({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
({if $item_birth.public_flag_birth_month_day != "private" || $c_member.c_member_id == $item_birth.c_member_id})
<p><img src="({t_img_url_skin filename=icon_birthday})" alt="誕生日" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a></p>
({/if})
({/foreach})

({* イベント *})
({foreach from=$item.event item=item_event})
<p><img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" alt="イベント" /><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name})</a></p>
({/foreach})

({* スケジュール *})
({foreach from=$item.schedule item=item_schedule})
<p><img src="({t_img_url_skin filename=icon_pen})" alt="スケジュール" /><a href="({t_url m=pc a=page_h_schedule})&amp;target_c_schedule_id=({$item_schedule.c_schedule_id})">({$item_schedule.title})</a></p>
({/foreach})

({/if})
({/strip})</td>
({/foreach})
</tr>
({/foreach})
</table>

<div class="block">
<p class="pager">
<a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})">&lt;&lt; 前の月</a>
 | <a href="({t_url m=pc a=page_h_calendar})">今月</a>
 | <a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})">次の月 &gt;&gt;</a>
</p>
</div>

<div class="partsInfo">
({if $add_schedule})
<p>※<img src="({t_img_url_skin filename=icon_schedule})" alt="スケジュールを追加" />アイコンをクリックすると予定を入力することができます。予定は他の人には公開されません。</p>
({/if})
<p>※<img src="({t_img_url_skin filename=icon_birthday})" alt="誕生日" />は({$WORD_MY_FRIEND})の誕生日、<img src="({t_img_url_skin filename=icon_event_B})" alt="イベント" />はイベント、<img src="({t_img_url_skin filename=icon_event_R})" alt="イベント" />は参加イベントを意味します。</p>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
