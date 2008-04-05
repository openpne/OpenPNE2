<div id="LayoutC">
<div id="Center">

<table border="0" cellspacing="0" cellpadding="0" style="width:640px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td style="width:626px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_01" align="center">
<!-- *ここから：予定を編集する＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:626px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
<td style="width:588px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">予定の詳細</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞予定表示 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:626px;" class="border_01">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:120px;" class="bg_05" align="center" valign="middle">

<div style="padding:4px 3px;">

タイトル

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td style="width:501px;" class="bg_02" align="left" valign="middle">

<div style="padding:4px 3px;">

({$schedule.title})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

日時

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({strip})
({if $schedule.rep_type_loc})
	毎週 ({$schedule.rep_type_loc})曜日
({else})
	({$schedule.begin_date})
({/if})

({if $schedule.begin_date != $schedule.finish_date})
	～({$schedule.finish_date})
({/if})
({/strip})

({strip})
({$schedule.begin_time})
({if $schedule.begin_time || $schedule.finish_time})～({/if})
({$schedule.finish_time}) 
({/strip})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
({if $schedule.rep_first})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

開始日

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({$repeat_begin_date|date_format:"%Y年%m月%d日"})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

期間

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({$repeat_term})週間

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
({/if})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

内容

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({$schedule.value|nl2br})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
({if $is_h})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

登録者
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">
	<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$schedule.c_member_id})">({$schedule.writer_name})</a>	<br>
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
({/if})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

参加者
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({foreach item=name key=id from=$jmembers})
	<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$id})">({$name})</a>	<br>
({/foreach})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

公開範囲

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({if $schedule.public_flag == 'private'})
参加者のみに公開
({else})
全体に公開
({/if})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
<td class="bg_02" align="center" colspan="3">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />

<table border="0" cellspacing="0" cellpadding="0">
<tr>

<td class="padding_ss" align="left">

({t_form_block _method=get m=biz a=page_fh_biz_schedule_calendar})
<input type="hidden" name="target_id" value="({$target_c_member_id})" />
<input type="hidden" name="year" value="({$schedule.begin_date|date_format:'%Y'})" />
<input type="hidden" name="month" value="({$schedule.begin_date|date_format:'%m'})" />
<input value="月間カレンダーを表示する" type="submit" class="submit" />
({/t_form_block})

</td>

<td class="padding_ss" align="center">

({t_form_block m=biz a=page_fh_biz_schedule_edit})
<input type="hidden" name="rep_type" value="({$schedule.rep_type})" />
<input type="hidden" name="begin_date" value="({$schedule.begin_date})" />
<input type="hidden" name="begin_time" value="({$schedule.begin_time})" />
<input type="hidden" name="finish_date" value="({$schedule.finish_date})" />
<input type="hidden" name="finish_time" value="({$schedule.finish_time})" />
<input type="hidden" name="title" value="({$schedule.title})" />
<input type="hidden" name="value" value="({$schedule.value})" />
<input type="hidden" name="members" value="({$jmembers_enc})" />
<input type="hidden" name="schedule_id" value="({$schedule_id})" />
<input type="hidden" name="target_id" value="({$target_c_member_id})" />
<input type="hidden" name="sc_bn" value="({$sc_bn})" />

<input value="修正する" type="submit" class="submit" />
({/t_form_block})

</td>

<td class="padding_ss" align="left">

({t_form_block m=biz a=page_h_biz_schedule_delete})
<input type="hidden" name="schedule_id" value="({$schedule_id})" />
<input value="削除する" type="submit" class="submit" />

</td>
</tr>

({if $schedule.rep_first})
<tr>
<td class="padding_ss" align="center" colspan="2">

<input value="1" type="checkbox" name="is_rep" checked class="no_bg" />ほかの繰り返し予定も一緒に削除する

</td>
</tr>
({/if})
({/t_form_block})
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞予定表示 -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：予定を編集する＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
</tr>
</table>

</div><!-- Center -->
</div><!-- LayoutC -->
