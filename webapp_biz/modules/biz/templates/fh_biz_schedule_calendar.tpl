({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:684px;margin:0px auto;" class="border_07">
({* unknown *})<tr>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:670px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_01" align="center">
({* unknown *})<!-- *ここから：カレンダー＞内容* -->
({* unknown *})({*ここから：header*})
({* unknown *})<!-- ここから：小タイトル -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* unknown *})<td style="width:622px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* unknown *})({$ym.year_disp})年({$ym.month_disp})月のカレンダー
({* unknown *})</span></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：小タイトル -->
({* unknown *})({*ここまで：header*})
({* unknown *})({*ここから：body*})
({* unknown *})<!-- ここから：主内容 -->
({* unknown *})<!-- ここから：主内容＞＞天気予報を見る -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:468px;padding:2px 0px;" class="bg_05">
({* unknown *})({if $smarty.const.USE_EXTRA_SERVICE})
({* unknown *})&nbsp;<img src="({t_img_url_skin filename=icon_weather_FC})" class="icon" />
({* unknown *})<a href="({$smarty.const.OPENPNE_WEATHER_URL})" target="_blank">天気予報を見る</a>
({* unknown *})({/if})
({* unknown *})&nbsp;<img src="({t_img_url_skin filename=icon_schedule})" class="icon" />
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_add})&target_id=({$c_member.c_member_id})">予定を追加</a>&nbsp;
({* unknown *})
({* unknown *})</td>
({* unknown *})<td style="width:200px;padding:2px 0px;" class="bg_05" align="right">
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;&nbsp;前の月</a>
({* unknown *})|
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">今月</a>
({* unknown *})|
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">次の月&nbsp;&gt;&gt;</a>&nbsp;
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容＞＞天気予報を見る -->
({* unknown *})<!-- ここから：主内容＞＞カレンダー -->
({* unknown *})<table border="0" cellspacing="1" cellpadding="0" style="width:670px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:14%;padding:2px;" class="bg_02 c_02">日</td>
({* unknown *})<td style="width:14%;padding:2px;" class="bg_02">月</td>
({* unknown *})<td style="width:14%;padding:2px;" class="bg_02">火</td>
({* unknown *})<td style="width:14%;padding:2px;" class="bg_02">水</td>
({* unknown *})<td style="width:14%;padding:2px;" class="bg_02">木</td>
({* unknown *})<td style="width:14%;padding:2px;" class="bg_02">金</td>
({* unknown *})<td style="width:14%;padding:2px;" class="bg_02 c_03">土</td>
({* unknown *})</tr>
({* unknown *})({foreach from=$calendar item=week})
({* unknown *})<tr>
({* unknown *})({foreach from=$week item=item name=weekloop})
({* unknown *})({if $item.now})
({* unknown *})<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_09">
({* unknown *})({elseif $item.holiday || $smarty.foreach.weekloop.first})
({* unknown *})<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_14">
({* unknown *})({else})
({* unknown *})<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_02">
({* unknown *})({/if})
({* unknown *})({if $item.day})
({* unknown *})({if $item.now})
({* unknown *})<span class="b_b">({$item.day})</span>
({* unknown *})({else})
({* unknown *})({$item.day})
({* unknown *})({/if})<br>
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_add})&amp;begin_date=({$year})({$month|string_format:'%02d'})({$item.day|string_format:'%02d'})&target_id=({$c_member.c_member_id})"><img src="({t_img_url_skin filename=icon_schedule})" class="icon" /></a><br>
({* unknown *})
({* unknown *})({* 祝日 *})
({* unknown *})({foreach from=$item.holiday item=item_holiday})
({* unknown *})<span class=" c_02">({$item_holiday})</span><br>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({* スケジュール *})
({* unknown *})({foreach from=$item.schedule item=item_schedule name=schedule})
({* unknown *})({* 時間指定変数の初期化 *})
({* unknown *})({assign var="begin_time_H" value=null})
({* unknown *})({assign var="begin_time_M" value=null})
({* unknown *})({assign var="finish_time_H" value=null})
({* unknown *})({assign var="finish_time_M" value=null})
({* unknown *})	({if !$item_schedule.begin_time})
({* unknown *})&nbsp;
({* unknown *})<!-- 時間指定なしの予定 -->
({* unknown *})	({elseif $cmd == 's_list'})
({* unknown *})({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({* unknown *})({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({* unknown *})({if $item_schedule.finish_time})
({* unknown *})	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({* unknown *})	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({* unknown *})({/if})
({* unknown *})<a href="({t_url m=biz a=page_s_view_schedule})&amp;id=({$item_schedule.biz_shisetsu_schedule_id})">
({* unknown *})({ext_include file="inc_biz_schedule_week_time.tpl"})
({* unknown *})<div class="padding_s" style="padding-top:0;">
({* unknown *})({$item_schedule.c_member_name})
({* unknown *})</div></a>
({* unknown *})	({elseif $item_schedule.begin_date != $item_schedule.finish_date})  <!--バナー予定 -->
({* unknown *})({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({* unknown *})({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({* unknown *})({if $item_schedule.finish_time})
({* unknown *})	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({* unknown *})	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({* unknown *})({/if})
({* unknown *})({ext_include file="inc_biz_schedule_week_time.tpl"})
({* unknown *})<div class="padding_s" style="padding-top:0;">
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a>
({* unknown *})</div>
({* unknown *})	({else})
({* unknown *})({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({* unknown *})({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({* unknown *})({if $item_schedule.finish_time})
({* unknown *})	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
({* unknown *})	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({* unknown *})({/if})
({* unknown *})({ext_include file="inc_biz_schedule_week_time.tpl"})
({* unknown *})<div class="padding_s" style="padding-top:0;">
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a>
({* unknown *})</div>
({* unknown *})<img src="./skin/dummy.gif" alt="dummy" style="width:80px;height:10px;" class="dummy" />
({* unknown *})	({/if})
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({* 誕生日 *})
({* unknown *})({foreach from=$item.birth item=item_birth})
({* unknown *})<img src="({t_img_url_skin filename=icon_birthday})" class="icon" /><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a><br>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({* イベント *})
({* unknown *})({foreach from=$item.event item=item_event})
({* unknown *})<img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" class="icon" /><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name})</a><br>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({* Todo *})
({* unknown *})({foreach from=$item.todo item=item_todo})
({* unknown *})<img src="./skin/default/img/biz/todo_icon.gif"  class="icon" />
({* unknown *})<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item_todo.biz_todo_id})&target_id=({$c_member.c_member_id})">({$item_todo.memo|t_truncate:20:".."})</a>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})({if $item.schedule})
({* unknown *})({foreach from=$item.schedule item=item_schedule name=schedule})
({* unknown *})	({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
({* unknown *})<div class="padding_s">
({* unknown *})({*<img src="({t_img_url_skin filename=icon_pen})" class="icon" />*})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">({$item_schedule.title})</a>
({* unknown *})</div>
({* unknown *})	({else})
({* unknown *})&nbsp;
({* unknown *})	({/if})
({* unknown *})({/foreach})
({* unknown *})({else})
({* unknown *})&nbsp;
({* unknown *})({/if})
({* unknown *})
({* unknown *})
({* unknown *})({else})
({* unknown *})&nbsp;
({* unknown *})({/if})
({* unknown *})</td>
({* unknown *})({/foreach})
({* unknown *})</tr>
({* unknown *})({/foreach})
({* unknown *})
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容＞＞カレンダー -->
({* unknown *})<!-- ここから：主内容＞＞天気予報を見る -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:668px;padding:2px 0px;" class="bg_09">
({* unknown *})※<img src="({t_img_url_skin filename=icon_schedule})" class="icon" />アイコンをクリックすると予定を入力することができます。予定は他の人にも公開されます。<br>
({* unknown *})※<img src="({t_img_url_skin filename=icon_birthday})" class="icon" />は({$WORD_MY_FRIEND})の誕生日、<img src="({t_img_url_skin filename=icon_event_B})" class="icon" />はイベント、<img src="({t_img_url_skin filename=icon_event_R})" class="icon" />は参加イベントを意味します。
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容＞＞天気予報を見る -->
({* unknown *})<!-- ここから：主内容＞＞天気予報を見る -->
({* unknown *})<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
({* unknown *})<tr>
({* unknown *})<td style="width:668px;padding:2px 0px;" align="right" class="bg_05">
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;&nbsp;前の月</a>
({* unknown *})|
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">今月</a>
({* unknown *})|
({* unknown *})<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">次の月&nbsp;&gt;&gt;</a>&nbsp;
({* unknown *})</td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})<!-- ここまで：主内容＞＞天気予報を見る -->
({* unknown *})<!-- ここまで：主内容 -->
({* unknown *})({*ここまで：body*})
({* unknown *})({*ここから：footer*})
({* unknown *})<!-- 無し -->
({* unknown *})({*ここまで：footer*})
({* unknown *})<!-- *ここまで：カレンダー＞＞内容* -->
({* unknown *})</td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})<tr>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* unknown *})</tr>
({* unknown *})</table>
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
