({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ****************************** -->
<!-- ******ここから：カレンダー****** -->
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
<a href="({t_url m=pc a=page_h_schedule_add})">予定を追加</a>&nbsp;

</td>
<td style="width:200px;padding:2px 0px;" class="bg_05" align="right">
<a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})">&lt;&lt;&nbsp;前の月</a>
|
<a href="({t_url m=pc a=page_h_calendar})">今月</a>
|
<a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})">次の月&nbsp;&gt;&gt;</a>&nbsp;
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

({if $add_schedule})
<a href="({t_url m=pc a=page_h_schedule_add})&amp;year=({$ym.year_disp})&amp;month=({$ym.month_disp})&amp;day=({$item.day})"><img src="({t_img_url_skin filename=icon_schedule})" class="icon"></a><br>
({/if})

({* 祝日 *})
({if $item.holiday})
({foreach from=$item.holiday item=item_holiday})
<span class=" c_02">({$item_holiday})</span><br>
({/foreach})
({/if})

({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
<img src="({t_img_url_skin filename=icon_birthday})" class="icon"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a><br>
({/foreach})

({* イベント *})
({foreach from=$item.event item=item_event})
<img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" class="icon"><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name})</a><br>
({/foreach})

({* スケジュール *})
({foreach from=$item.schedule item=item_schedule})
<img src="({t_img_url_skin filename=icon_pen})" class="icon"><a href="({t_url m=pc a=page_h_schedule})&amp;target_c_schedule_id=({$item_schedule.c_schedule_id})">({$item_schedule.title})</a><br>
({/foreach})
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
({if $add_schedule})
※<img src="({t_img_url_skin filename=icon_schedule})" class="icon">アイコンをクリックすると予定を入力することができます。予定は他の人には公開されません。<br>
({/if})
※<img src="({t_img_url_skin filename=icon_birthday})" class="icon">は({$WORD_MY_FRIEND})の誕生日、<img src="({t_img_url_skin filename=icon_event_B})" class="icon">はイベント、<img src="({t_img_url_skin filename=icon_event_R})" class="icon">は参加イベントを意味します。
</td>
</tr>
</table>
<!-- ここまで：主内容＞＞天気予報を見る -->
<!-- ここから：主内容＞＞天気予報を見る -->
<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:668px;padding:2px 0px;" align="right" class="bg_05">
<a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})">&lt;&lt;&nbsp;前の月</a>
|
<a href="({t_url m=pc a=page_h_calendar})">今月</a>
|
<a href="({t_url m=pc a=page_h_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})">次の月&nbsp;&gt;&gt;</a>&nbsp;
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
<!-- ******ここまで：カレンダー****** -->
<!-- ****************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
