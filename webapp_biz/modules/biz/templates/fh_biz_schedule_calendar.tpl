({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* #1970 *})<table border="0" cellspacing="0" cellpadding="0" style="width:684px;margin:0px auto;" class="border_07">
({* #1970 *})<tr>
({* #1970 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1970 *})<td style="width:670px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1970 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1970 *})</tr>
({* #1970 *})<tr>
({* #1970 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1970 *})<td class="bg_01" align="center">
({* #1970 *})<!-- *ここから：カレンダー＞内容* -->
({* #1970 *})({*ここから：header*})
({* #1970 *})<!-- ここから：小タイトル -->
({* #1970 *})<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
({* #1970 *})<tr>
({* #1970 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1970 *})<td style="width:622px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* #1970 *})({$ym.year_disp})年({$ym.month_disp})月のカレンダー
({* #1970 *})</span></td>
({* #1970 *})</tr>
({* #1970 *})</table>
({* #1970 *})<!-- ここまで：小タイトル -->
({* #1970 *})({*ここまで：header*})
({* #1970 *})({*ここから：body*})
({* #1970 *})<!-- ここから：主内容 -->
({* #1970 *})<!-- ここから：主内容＞＞天気予報を見る -->
({* #1970 *})<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
({* #1970 *})<tr>
({* #1970 *})<td style="width:468px;padding:2px 0px;" class="bg_05">
({* #1970 *})({if $smarty.const.USE_EXTRA_SERVICE})
({* #1970 *})&nbsp;<img src="({t_img_url_skin filename=icon_weather_FC})" class="icon" />
({* #1970 *})<a href="({$smarty.const.OPENPNE_WEATHER_URL})" target="_blank">天気予報を見る</a>
({* #1970 *})({/if})
({* #1970 *})&nbsp;<img src="({t_img_url_skin filename=icon_schedule})" class="icon" />
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_add})&target_id=({$c_member.c_member_id})">予定を追加</a>&nbsp;
({* #1970 *})
({* #1970 *})</td>
({* #1970 *})<td style="width:200px;padding:2px 0px;" class="bg_05" align="right">
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;&nbsp;前の月</a>
({* #1970 *})|
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">今月</a>
({* #1970 *})|
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">次の月&nbsp;&gt;&gt;</a>&nbsp;
({* #1970 *})</td>
({* #1970 *})</tr>
({* #1970 *})</table>
({* #1970 *})<!-- ここまで：主内容＞＞天気予報を見る -->
({* #1970 *})<!-- ここから：主内容＞＞カレンダー -->
({* #1970 *})<table border="0" cellspacing="1" cellpadding="0" style="width:670px;" class="border_01">
({* #1970 *})<tr>
({* #1970 *})<td style="width:14%;padding:2px;" class="bg_02 c_02">日</td>
({* #1970 *})<td style="width:14%;padding:2px;" class="bg_02">月</td>
({* #1970 *})<td style="width:14%;padding:2px;" class="bg_02">火</td>
({* #1970 *})<td style="width:14%;padding:2px;" class="bg_02">水</td>
({* #1970 *})<td style="width:14%;padding:2px;" class="bg_02">木</td>
({* #1970 *})<td style="width:14%;padding:2px;" class="bg_02">金</td>
({* #1970 *})<td style="width:14%;padding:2px;" class="bg_02 c_03">土</td>
({* #1970 *})</tr>
({* #1970 *})({foreach from=$calendar item=week})
({* #1970 *})<tr>
({* #1970 *})({foreach from=$week item=item name=weekloop})
({* #1970 *})({if $item.now})
({* #1970 *})<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_09">
({* #1970 *})({elseif $item.holiday || $smarty.foreach.weekloop.first})
({* #1970 *})<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_14">
({* #1970 *})({else})
({* #1970 *})<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_02">
({* #1970 *})({/if})
({* #1970 *})({if $item.day})
({* #1970 *})({if $item.now})
({* #1970 *})<span class="b_b">({$item.day})</span>
({* #1970 *})({else})
({* #1970 *})({$item.day})
({* #1970 *})({/if})<br>
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_add})&amp;begin_date=({$year})({$month|string_format:'%02d'})({$item.day|string_format:'%02d'})&target_id=({$c_member.c_member_id})"><img src="({t_img_url_skin filename=icon_schedule})" class="icon" /></a><br>
({* #1970 *})
({* #1970 *})({* 祝日 *})
({* #1970 *})({foreach from=$item.holiday item=item_holiday})
({* #1970 *})<span class=" c_02">({$item_holiday})</span><br>
({* #1970 *})({/foreach})
({* #1970 *})
({* #1970 *})({* スケジュール *})
({* #1970 *})({foreach from=$item.schedule item=item_schedule name=schedule})
({* #1970 *})({* 時間指定変数の初期化 *})
({* #1970 *})({assign var="begin_time_H" value=null})
({* #1970 *})({assign var="begin_time_M" value=null})
({* #1970 *})({assign var="finish_time_H" value=null})
({* #1970 *})({assign var="finish_time_M" value=null})
({* #1970 *})	({if !$item_schedule.begin_time})
({* #1970 *})&nbsp;
({* #1970 *})<!-- 時間指定なしの予定 -->
({* #1970 *})	({elseif $cmd == 's_list'})
({* #1970 *})({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({* #1970 *})({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({* #1970 *})({if $item_schedule.finish_time})
({* #1970 *})	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({* #1970 *})	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({* #1970 *})({/if})
({* #1970 *})<a href="({t_url m=biz a=page_s_view_schedule})&amp;id=({$item_schedule.biz_shisetsu_schedule_id})">
({* #1970 *})({ext_include file="inc_biz_schedule_week_time.tpl"})
({* #1970 *})<div class="padding_s" style="padding-top:0;">
({* #1970 *})({$item_schedule.c_member_name})
({* #1970 *})</div></a>
({* #1970 *})	({elseif $item_schedule.begin_date != $item_schedule.finish_date})  <!--バナー予定 -->
({* #1970 *})({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({* #1970 *})({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({* #1970 *})({if $item_schedule.finish_time})
({* #1970 *})	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({* #1970 *})	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({* #1970 *})({/if})
({* #1970 *})({ext_include file="inc_biz_schedule_week_time.tpl"})
({* #1970 *})<div class="padding_s" style="padding-top:0;">
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a>
({* #1970 *})</div>
({* #1970 *})	({else})
({* #1970 *})({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({* #1970 *})({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({* #1970 *})({if $item_schedule.finish_time})
({* #1970 *})	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({* #1970 *})	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({* #1970 *})({/if})
({* #1970 *})({ext_include file="inc_biz_schedule_week_time.tpl"})
({* #1970 *})<div class="padding_s" style="padding-top:0;">
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a>
({* #1970 *})</div>
({* #1970 *})<img src="./skin/dummy.gif" alt="dummy" style="width:80px;height:10px;" class="dummy" />
({* #1970 *})	({/if})
({* #1970 *})({/foreach})
({* #1970 *})
({* #1970 *})({* 誕生日 *})
({* #1970 *})({foreach from=$item.birth item=item_birth})
({* #1970 *})<img src="({t_img_url_skin filename=icon_birthday})" class="icon" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a><br>
({* #1970 *})({/foreach})
({* #1970 *})
({* #1970 *})({* イベント *})
({* #1970 *})({foreach from=$item.event item=item_event})
({* #1970 *})<img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" class="icon" /><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name})</a><br>
({* #1970 *})({/foreach})
({* #1970 *})
({* #1970 *})({* Todo *})
({* #1970 *})({foreach from=$item.todo item=item_todo})
({* #1970 *})<img src="./skin/default/img/biz/todo_icon.gif"  class="icon" />
({* #1970 *})<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item_todo.biz_todo_id})&target_id=({$c_member.c_member_id})">({$item_todo.memo|t_truncate:20:".."})</a>
({* #1970 *})({/foreach})
({* #1970 *})
({* #1970 *})({if $item.schedule})
({* #1970 *})({foreach from=$item.schedule item=item_schedule name=schedule})
({* #1970 *})	({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
({* #1970 *})<div class="padding_s">
({* #1970 *})({*<img src="({t_img_url_skin filename=icon_pen})" class="icon" />*})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">({$item_schedule.title})</a>
({* #1970 *})</div>
({* #1970 *})	({else})
({* #1970 *})&nbsp;
({* #1970 *})	({/if})
({* #1970 *})({/foreach})
({* #1970 *})({else})
({* #1970 *})&nbsp;
({* #1970 *})({/if})
({* #1970 *})
({* #1970 *})
({* #1970 *})({else})
({* #1970 *})&nbsp;
({* #1970 *})({/if})
({* #1970 *})</td>
({* #1970 *})({/foreach})
({* #1970 *})</tr>
({* #1970 *})({/foreach})
({* #1970 *})
({* #1970 *})</table>
({* #1970 *})<!-- ここまで：主内容＞＞カレンダー -->
({* #1970 *})<!-- ここから：主内容＞＞天気予報を見る -->
({* #1970 *})<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
({* #1970 *})<tr>
({* #1970 *})<td style="width:668px;padding:2px 0px;" class="bg_09">
({* #1970 *})※<img src="({t_img_url_skin filename=icon_schedule})" class="icon" />アイコンをクリックすると予定を入力することができます。予定は他の人にも公開されます。<br>
({* #1970 *})※<img src="({t_img_url_skin filename=icon_birthday})" class="icon" />は({$WORD_MY_FRIEND})の誕生日、<img src="({t_img_url_skin filename=icon_event_B})" class="icon" />はイベント、<img src="({t_img_url_skin filename=icon_event_R})" class="icon" />は参加イベントを意味します。
({* #1970 *})</td>
({* #1970 *})</tr>
({* #1970 *})</table>
({* #1970 *})<!-- ここまで：主内容＞＞天気予報を見る -->
({* #1970 *})<!-- ここから：主内容＞＞天気予報を見る -->
({* #1970 *})<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
({* #1970 *})<tr>
({* #1970 *})<td style="width:668px;padding:2px 0px;" align="right" class="bg_05">
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;&nbsp;前の月</a>
({* #1970 *})|
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">今月</a>
({* #1970 *})|
({* #1970 *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">次の月&nbsp;&gt;&gt;</a>&nbsp;
({* #1970 *})</td>
({* #1970 *})</tr>
({* #1970 *})</table>
({* #1970 *})<!-- ここまで：主内容＞＞天気予報を見る -->
({* #1970 *})<!-- ここまで：主内容 -->
({* #1970 *})({*ここまで：body*})
({* #1970 *})({*ここから：footer*})
({* #1970 *})<!-- 無し -->
({* #1970 *})({*ここまで：footer*})
({* #1970 *})<!-- *ここまで：カレンダー＞＞内容* -->
({* #1970 *})</td>
({* #1970 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1970 *})</tr>
({* #1970 *})<tr>
({* #1970 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1970 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1970 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1970 *})</tr>
({* #1970 *})</table>
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
