<div id="LayoutC">
<div id="Center">

<table border="0" cellspacing="0" cellpadding="0" style="width:684px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:670px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：カレンダー＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:622px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({$ym.year_disp})年({$ym.month_disp})月のカレンダー
</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞天気予報を見る -->
<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:468px;padding:2px 0px;" class="bg_05">
({if $smarty.const.USE_EXTRA_SERVICE})
&nbsp;<img src="({t_img_url_skin filename=icon_weather_FC})" class="icon">
<a href="({$smarty.const.OPENPNE_WEATHER_URL})" target="_blank">天気予報を見る</a>
({/if})
&nbsp;<img src="({t_img_url_skin filename=icon_schedule})" class="icon">
<a href="({t_url m=biz a=page_fh_biz_schedule_add})&target_id=({$c_member.c_member_id})">予定を追加</a>&nbsp;

</td>
<td style="width:200px;padding:2px 0px;" class="bg_05" align="right">
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;&nbsp;前の月</a>
|
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">今月</a>
|
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">次の月&nbsp;&gt;&gt;</a>&nbsp;
</td>
</tr>
</table>
<!-- ここまで：主内容＞＞天気予報を見る -->
<!-- ここから：主内容＞＞カレンダー -->
<table border="0" cellspacing="1" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:14%;padding:2px;" class="bg_02 c_02">日</td>
<td style="width:14%;padding:2px;" class="bg_02">月</td>
<td style="width:14%;padding:2px;" class="bg_02">火</td>
<td style="width:14%;padding:2px;" class="bg_02">水</td>
<td style="width:14%;padding:2px;" class="bg_02">木</td>
<td style="width:14%;padding:2px;" class="bg_02">金</td>
<td style="width:14%;padding:2px;" class="bg_02 c_03">土</td>
</tr>
({foreach from=$calendar item=week})
<tr>
({foreach from=$week item=item name=weekloop})
({if $item.now})
<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_09">
({elseif $item.holiday || $smarty.foreach.weekloop.first})
<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_14">
({else})
<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_02">
({/if})
({if $item.day})
({if $item.now})
<span class="b_b">({$item.day})</span>
({else})
({$item.day})
({/if})<br>
<a href="({t_url m=biz a=page_fh_biz_schedule_add})&amp;begin_date=({$year})({$month|string_format:'%02d'})({$item.day|string_format:'%02d'})&target_id=({$c_member.c_member_id})"><img src="({t_img_url_skin filename=icon_schedule})" class="icon"></a><br>

({* 祝日 *})
({foreach from=$item.holiday item=item_holiday})
<span class=" c_02">({$item_holiday})</span><br>
({/foreach})

({* スケジュール *})
({foreach from=$item.schedule item=item_schedule name=schedule})
({* 時間指定変数の初期化 *})
({assign var="begin_time_H" value=null})
({assign var="begin_time_M" value=null})
({assign var="finish_time_H" value=null})
({assign var="finish_time_M" value=null})
	({if !$item_schedule.begin_time})
&nbsp;
<!-- 時間指定なしの予定 -->
	({elseif $cmd == 's_list'})
({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})
<a href="({t_url m=biz a=page_s_view_schedule})&amp;id=({$item_schedule.biz_shisetsu_schedule_id})">
({ext_include file="inc_biz_schedule_week_time.tpl"})
<div class="padding_s" style="padding-top:0;">
({$item_schedule.c_member_name})
</div></a>
	({elseif $item_schedule.begin_date != $item_schedule.finish_date})  <!--バナー予定 -->
({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})
({ext_include file="inc_biz_schedule_week_time.tpl"})
<div class="padding_s" style="padding-top:0;">
<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a>
</div>
	({else})
({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})
({ext_include file="inc_biz_schedule_week_time.tpl"})
<div class="padding_s" style="padding-top:0;">
<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a>
</div>
<img src="./skin/dummy.gif" alt="dummy" style="width:80px;height:10px;" class="dummy">
	({/if})
({/foreach})

({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
<img src="({t_img_url_skin filename=icon_birthday})" class="icon"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a><br>
({/foreach})

({* イベント *})
({foreach from=$item.event item=item_event})
<img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" class="icon"><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name})</a><br>
({/foreach})

({* Todo *})
({foreach from=$item.todo item=item_todo})
<img src="./skin/default/img/biz/todo_icon.gif"  class="icon">
<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item_todo.biz_todo_id})&target_id=({$c_member.c_member_id})">({$item_todo.memo|t_truncate:20:".."})</a>
({/foreach})

({if $item.schedule})
({foreach from=$item.schedule item=item_schedule name=schedule})
	({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
<div class="padding_s">
({*<img src="({t_img_url_skin filename=icon_pen})" class="icon">*})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">({$item_schedule.title})</a>
</div>
	({else})
&nbsp;
	({/if})
({/foreach})
({else})
&nbsp;
({/if})


({else})
&nbsp;
({/if})
</td>
({/foreach})
</tr>
({/foreach})

</table>
<!-- ここまで：主内容＞＞カレンダー -->
<!-- ここから：主内容＞＞天気予報を見る -->
<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:668px;padding:2px 0px;" class="bg_09">
※<img src="({t_img_url_skin filename=icon_schedule})" class="icon">アイコンをクリックすると予定を入力することができます。予定は他の人にも公開されます。<br>
※<img src="({t_img_url_skin filename=icon_birthday})" class="icon">は({$WORD_MY_FRIEND})の誕生日、<img src="({t_img_url_skin filename=icon_event_B})" class="icon">はイベント、<img src="({t_img_url_skin filename=icon_event_R})" class="icon">は参加イベントを意味します。
</td>
</tr>
</table>
<!-- ここまで：主内容＞＞天気予報を見る -->
<!-- ここから：主内容＞＞天気予報を見る -->
<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:668px;padding:2px 0px;" align="right" class="bg_05">
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;&nbsp;前の月</a>
|
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">今月</a>
|
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">次の月&nbsp;&gt;&gt;</a>&nbsp;
</td>
</tr>
</table>
<!-- ここまで：主内容＞＞天気予報を見る -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：カレンダー＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
</form>

</div><!-- Center -->
</div><!-- LayoutC -->
