({if $head})<!-- HEADER_BEGIN -->
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

<!-- ***************************** -->
<!-- ******ここから：週間予定****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:720px;">
<tr>
<td style="width:5px;"><img src="./skin/dummy.gif" alt="dummy" style="width:5px;height:7px;" class="dummy"></td>
<td style="width:713px;" class="bg_02">

<table border="0" cellspacing="0" cellpadding="0" style="width:713px;margin:0px;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:699px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:699px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_02">
<!-- ここから：主内容 -->

({if $msg})
<div class="border_01 bg_02">

<div class="padding_s" align="left">
<span class="caution">({$msg})</span>
</div>

</div>
({/if})

({if $cmd == "g"})
({t_form m=biz a=do_g_home_add_biz_schedule})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_id" value="({$target_id})">

<table border="0" cellspacing="0" cellpadding="0" style="width:699px;">
<tr>
<td class="border_01 bg_02" align="right" style="width:130px;border-right:none;"><img src="./skin/dummy.gif" alt="dummy" style="width:129px;height:10px;" class="dummy"></td>
<td class="border_01 bg_02 padding_ss" align="left" style="width:100px;border-right:none;">

<a href="({t_url m=biz a=page_fh_biz_schedule_add})&amp;target_biz_group_id=({$target_id})">新規予定登録</a>

</td>
<td class="border_01 bg_02 padding_ss" style="border-left:none;" align="right">

予定：
<input type="text" class="text" name="title" value="" size="30">
<select name="start_date">
({foreach from=$daylist item=item})
<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({/foreach})
</select>
<input type="submit" class="submit" value="追加">

&nbsp;
<a href="({t_url m=biz a=page_`$cmd`_home})&amp;w=({$w-1})&amp;target_c_commu_id=({$target_id})" title="前の週">＜</a>
<a href="({t_url m=biz a=page_`$cmd`_home})&amp;target_c_commu_id=({$target_id})" title="今週">■</a>
<a href="({t_url m=biz a=page_`$cmd`_home})&amp;w=({$w+1})&amp;target_c_commu_id=({$target_id})" title="次の週">＞</a>
&nbsp;

</td>
</tr>
</table>
</form>

<div>
({elseif $cmd == "s_list"})

({t_form m=biz a=do_s_add_schedule})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="shisetsu_id" value="({$target_id})">

<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:697px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:666px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$list.name})</span></td>
</tr>
({if $list.info})
<tr>
<td class="border_01 bg_02" align="left" style="width:10px;border-right:none;"><img src="./skin/dummy.gif" alt="dummy" style="width:9px;height:10px;" class="dummy"></td>
<td class="border_01 bg_02 padding_ss" style="border-left:none;" align="left">
({$list.info})
</td>
</tr>
({/if})
</table>
</div>

<table border="0" cellspacing="0" cellpadding="0" style="width:699px;">
<tr>
<td class="border_01 bg_02" align="right" style="width:130px;border-right:none;"><img src="./skin/dummy.gif" alt="dummy" style="width:129px;height:10px;" class="dummy"></td>
<td class="border_01 bg_02 padding_ss" style="border-left:none;" align="right">

施設予約を入れる:

<select name="start_date">
({foreach from=$calendar item=item})
<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({/foreach})
</select>

<select name='start_time'>
	<option value=''>現在時
	({section name=i loop=$hours})
		<option value="({if $hours[i] < 10 })0({/if})({$hours[i]})">({$hours[i]})時
	({/section})
</select>
から
<select name='finish_time'>
	({section name=i loop=$mins})
		<option value="({$mins[i]})">({$mins[i]})分後
	({/section})
</select>
まで
<input type="submit" class="submit" value="追加">

&nbsp;
<a href="({t_url m=biz a=page_s_list})&amp;w=({$w-1})" title="前の週">＜</a>
<a href="({t_url m=biz a=page_s_list})" title="今週">■</a>
<a href="({t_url m=biz a=page_s_list})&amp;w=({$w+1})" title="次の週">＞</a>
&nbsp;
</td>
</tr>
</table>
</form>

({else})

<div class="border_01" style="border-left:none;border-right:none;border-bottom:none;">
({/if})
<table border="0" cellspacing="0" cellpadding="0" style="width:699px;">
({/if})  <!-- END HEAD -->


({if $value})  <!-- BEGIN VALUE -->
({*****})
<tr>
<td class="bg_05 border_01" style="width:131px;border-top:none;border-right:none;" align="center" valign="top"><img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:10px;" class="dummy"></td>
({foreach from=$calendar item=item name=calendar})
<td class="({if $item.now})bg_09({else})bg_05({/if}) padding_ss border_01({if $item.dayofweek == "日" || $item.holiday}) c_02({elseif $item.dayofweek == "土"}) c_03({else})({/if})" style="width:81px;border-top:none;({if !$smarty.foreach.calendar.last}) border-right:none;({/if})" align="center">

({if $item.now})<span class="b_b">({/if})

({if $smarty.foreach.calendar.first || $item.day == 1})
({$item.month_disp})/({/if})({$item.day_disp})(({$item.dayofweek}))

({if $item.now})</span>({/if})

</td>
({/foreach})
</tr>
({*****})
<tr>
<td class="bg_02 border_01" style="width:131px;border-top:none;border-right:none;" align="center" valign="top" rowspan="2">
<img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:10px;" class="dummy">

({if $cmd == "s_list"})
<img src="({t_img_url filename=$list.image_filename w=120 h=120 noimg=no_image})" class="pict" alt="写真" style="margin:2px">
({else})
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$member_info.c_member_id})"><img src="({t_img_url filename=$member_info.image_filename w=120 h=120 noimg=no_image})" class="pict" alt="写真" style="margin:2px"></a>
({/if})
<img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:10px;" class="dummy">

({if $cmd == "s_list"})
({if !$is_closed_shisetsu})
<input type="button" onClick="location.href='({t_url m=biz a=page_s_edit_shisetsu})&id=({$target_id})'" value="編　集" style="width:112px;" class="submit">

<img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:3px;" class="dummy">

<input type="button" onClick="location.href='({t_url m=biz a=page_s_delete_shisetsu})&target_id=({$target_id})&sessid=({$PHPSESSID})'" value="削　除" style="width:112px;" class="submit">
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

({else})

({if $cmd != "h"})
({if $member_info.image_filename})
<input type="button" onClick="location.href='({t_url m=pc a=page_f_show_image})&amp;target_c_member_id=({$member_info.c_member_id})'" value="もっと写真を見る" style="width:112px;" class="submit">
({/if})
<a href="({t_url m=pc a=page_f_home})&target_c_member_id=({$member_info.c_member_id})" class="border_01 bg_02" style="padding:4px 0;display:block;border-left:none;border-right:none;">({$member_info.nickname})</a>
最終ログインは<br>({$member_info.last_login})<br>
({else})
<div class="border_01 bg_02" style="padding:4px 0;display:block;border-left:none;border-right:none;">

({if $smarty.const.OPENPNE_IS_POINT_ADMIN || $member_info.c_member_id != 1})
({if ($smarty.const.OPENPNE_DISP_RANK && $rank) || ($smarty.const.OPENPNE_DISP_POINT && $point)})
({if $smarty.const.OPENPNE_DISP_RANK && $rank})
<img src="({t_img_url filename=$rank.image_filename})" class="pict" alt="({$rank.name})" style="margin:2px"><br>
({/if})
({if $smarty.const.OPENPNE_DISP_POINT && $point})
({$point}) Point<br>
({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({/if})
({/if})

({$stateform|smarty:nodefaults})
</div>
({/if})

({/if})
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">

({if $cmd == "h"})
<input type="button" onClick="location.href='({t_url m=pc a=page_h_config_image})'" value="写真を編集" style="width:112px;" class="submit">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

<input type="button" onClick="location.href='({t_url m=pc a=page_h_config_prof})'" value="プロフィール変更" style="width:112px;" class="submit">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({/if})

</td>
({foreach from=$calendar item=item name=calendar})
<td class="({if $item.now})bg_09({else})bg_02({/if}) border_01({if $item.dayofweek == "日" || $item.holiday}) c_02({elseif $item.dayofweek == "土"}) c_03({else})({/if})" style="width:81px;border-top:none;({if !$smarty.foreach.calendar.last}) border-right:none;({/if}) border-bottom:none;" align="left" valign="top">

({* 祝日 *})
<div class="padding_s">
({foreach from=$item.holiday item=item_holiday})
({$item_holiday})<br>
({/foreach})
</div>

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
<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $cmd=='f'})&amp;target_id=({$member_info.c_member_id})({/if})">({$item_schedule.title})</a>
 </div>
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
({ext_include file="inc_biz_schedule_week_time.tpl"})
<div class="padding_s" style="padding-top:0;">
<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $cmd=='f'})&amp;target_id=({$member_info.c_member_id})({/if})">({$item_schedule.title})</a>
</div>
	({/if})
({/foreach})

<img src="./skin/dummy.gif" alt="dummy" style="width:80px;height:10px;" class="dummy">

</td>
({/foreach})
</tr>
({*****})

<tr>

({foreach from=$calendar item=item name=calendar})
<td class="({if $item.now})bg_09({else})bg_02({/if}) border_01({if $item.dayofweek == "日" || $item.holiday}) c_02({elseif $item.dayofweek == "土"}) c_03({else})({/if})" style="width:81px;border-top:none;({if !$smarty.foreach.calendar.last}) border-right:none;({/if})" align="left" valign="top">

({if $cmd == 'h'})
({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
<div class="padding_s"><img src="({t_img_url_skin filename=icon_birthday})" class="icon"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a></div>
({/foreach})

({* イベント *})
({foreach from=$item.event item=item_event})
<div class="padding_s"><img src="({if $item_event.is_join})({t_img_url_skin filename=icon_event_R})({else})({t_img_url_skin filename=icon_event_B})({/if})" class="icon"><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name|t_truncate:20:".."})</a></div>
({/foreach})

({else})
&nbsp;
({/if})

({* Todo *})
({foreach from=$item.todo item=item_todo})
<div class="padding_s">
<img src="./skin/default/img/biz/todo_icon.gif"  class="icon">
<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$item_todo.biz_todo_id})&target_id=({$member_info.c_member_id})">({$item_todo.memo|t_truncate:20:".."})</a></div>
({/foreach})

({* スケジュール(時間無) *})
({if $item.schedule})
({foreach from=$item.schedule item=item_schedule name=schedule})
	({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
<div class="padding_s">
({*<img src="({t_img_url_skin filename=icon_pen})" class="icon">*})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $cmd=='f'})&target_id=({$member_info.c_member_id})({/if})">({$item_schedule.title})</a>
</div>
	({else})
&nbsp;
	({/if})
({/foreach})
({else})
&nbsp;
({/if})

</td>
({/foreach})

</tr>
({/if})  <!-- END VALUE -->

({if $foot})  <!-- BEGIN FOOT -->
<tr>
<td class="bg_02 border_01" style="border-top:none;border-right:none;" align="center" valign="top"><img src="./skin/dummy.gif" alt="dummy" style="width:130px;height:10px;" class="dummy"></td>
<td class="bg_02 border_01" style="border-top:none;" align="right" valign="top" colspan="7">

<table border="0" cellspacing="0" cellpadding="0" style="width:100%;">
<tr>
<td class="({if $cmd != "g"})border_01 ({/if})padding_ss" align="left" valign="middle" style="border-left:none;border-top:none;border-bottom:none;border-right:none;">

({if ($cmd == "h") || ($cmd == "f")})
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $cmd == 'f'})&amp;target_id=({$member_info.c_member_id})({/if})">月間カレンダー</a>
({else})
&nbsp;
({/if})

</td>
<td class="padding_ss" align="right" valign="middle">

({if ($cmd == "h") || ($cmd == "f")})
({t_form m=biz a=do_`$cmd`_home_add_biz_schedule})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_id" value="({$target_id})">
予定：
<input type="text" class="text" name="title" value="" size="30">
<select name="start_date">
({foreach from=$daylist item=item})
<option value="({$item.year})-({$item.month})-({$item.day})"({if $item.now}) selected="selected"({/if})>({$item.month})/({$item.day})(({$item.dayofweek}))</option>
({/foreach})
</select>
<input type="submit" class="submit" value="追加">

&nbsp;
<a href="({t_url m=pc a=page_`$cmd`_home})&amp;w=({$w-1})({if $target_id})&amp;target_c_member_id=({$target_id})({/if})" title="前の週">＜</a>
<a href="({t_url m=pc a=page_`$cmd`_home})({if $target_id})&amp;target_c_member_id=({$target_id})({/if})" title="今週">■</a>
<a href="({t_url m=pc a=page_`$cmd`_home})&amp;w=({$w+1})({if $target_id})&amp;target_c_member_id=({$target_id})({/if})" title="次の週">＞</a>
&nbsp;
</form>
({else})

&nbsp;

({/if})

</td>
</tr>
</table>

</td>
</tr>
</table>
</div>

<!-- ここまで：主内容 -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

</td>
</tr>
</table>
<!-- ******ここまで：週間予定****** -->
<!-- ***************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({/if}) <!-- END FOOT -->
