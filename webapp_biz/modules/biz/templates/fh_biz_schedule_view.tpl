({$inc_html_header|smarty:nodefaults})
<body>
({ext_include file="inc_extension_pagelayout_top.tpl"})
<table class="mainframe" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="container inc_page_header">
({$inc_page_header|smarty:nodefaults})
</td>
</tr>
<tr>
<td class="container inc_navi">
({$inc_navi|smarty:nodefaults})
</td>
</tr>
<tr>
<td class="container main_content" align="center">

({if $msg || $msg1 || $msg2 || $msg3 || $err_msg})
({assign var=is_no_alert value=true})
({/if})
({ext_include file="inc_alert_box.tpl"})({* エラーメッセージコンテナ *})


<table class="container" border="0" cellspacing="0" cellpadding="0">({*BEGIN:container*})
<tr>
<td class="full_content" align="center">
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ********************************** -->
<!-- ******ここから：予定を編集する****** -->

<table border="0" cellspacing="0" cellpadding="0" style="width:640px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:626px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *ここから：予定を編集する＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:626px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="./skin/content_header_1.gif" style="width:30px;height:20px;" class="dummy"></td>
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
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:120px;" class="bg_05" align="center" valign="middle">

<div style="padding:4px 3px;">

タイトル

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:501px;" class="bg_02" align="left" valign="middle">

<div style="padding:4px 3px;">

({$schedule.title})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

日時

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({if $schedule.rep_type_loc})
	毎週 ({$schedule.rep_type_loc})曜日
({else})
	({$schedule.begin_date})
({/if})

({$schedule.begin_time}) ({if $schedule.begin_time})～({/if})

({if $schedule.begin_date != $schedule.finish_date})
	({$schedule.finish_date})
({/if})

({$schedule.finish_time}) 

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({if $schedule.rep_first})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

開始日

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({$repeat_begin_date|date_format:"%Y年%m月%d日"})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

期間

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({$repeat_term})週間

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

内容

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({$schedule.value})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({if $is_h})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

登録者
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

	<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$schedule.c_member_id})">({$schedule.writer_name})</a>	<br>

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
({/if})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

参加者
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

({foreach item=name key=id from=$jmembers})
	<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$id})">({$name})</a>	<br>
({/foreach})

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="center" colspan="3">

<img src="./skin/dummy.gif" class="v_spacer_m">

({if $is_f})
<table border="0" cellspacing="0" cellpadding="0">
<tr>

<td class="padding_ss" align="left">

({t_form _method=get m=pc a=page_h_home})
<input value="マイホームに戻る" type="submit" class="submit">
</form>

</td>

<td class="padding_ss" align="center">

({t_form m=biz a=page_fh_biz_schedule_edit})
<input type="hidden" name="rep_type" value="({$schedule.rep_type})">
<input type="hidden" name="begin_date" value="({$schedule.begin_date})">
<input type="hidden" name="begin_time" value="({$schedule.begin_time})">
<input type="hidden" name="finish_date" value="({$schedule.finish_date})">
<input type="hidden" name="finish_time" value="({$schedule.finish_time})">
<input type="hidden" name="title" value="({$schedule.title})">
<input type="hidden" name="value" value="({$schedule.value})">
<input type="hidden" name="members" value="({$jmembers_enc})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input type="hidden" name="target_id" value="({$target_c_member.c_member_id})">

<input value="修正する" type="submit" class="submit">
</form>

</td>
</tr>
</table>
({elseif !$msg})
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="padding_ss" align="left">

({t_form _method=get m=pc a=page_h_home})
<input value="マイページに戻る" type="submit" class="submit">
</form>

</td>

<td class="padding_ss" align="center">

({t_form m=biz a=page_fh_biz_schedule_edit})
<input type="hidden" name="rep_type" value="({$schedule.rep_type})">
<input type="hidden" name="begin_date" value="({$schedule.begin_date})">
<input type="hidden" name="begin_time" value="({$schedule.begin_time})">
<input type="hidden" name="finish_date" value="({$schedule.finish_date})">
<input type="hidden" name="finish_time" value="({$schedule.finish_time})">
<input type="hidden" name="title" value="({$schedule.title})">
<input type="hidden" name="value" value="({$schedule.value})">
<input type="hidden" name="members" value="({$jmembers_enc})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input value="修正する" type="submit" class="submit">
</form>

</td>
<td class="padding_ss" align="left">

({t_form m=biz a=page_h_biz_schedule_delete})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="schedule_id" value="({$schedule_id})">
<input value="削除する" type="submit" class="submit">

</td>
</tr>
({if $schedule.rep_first})
<tr>
<td class="padding_ss" align="center" colspan="2">

<input value="1" type="checkbox" name="is_rep" checked class="no_bg">ほかの繰り返し予定も一緒に削除する

</td>
</tr>
({/if})

</form>
</table>
({else})
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="padding_ss" align="right">

({t_form m=biz a=page_fh_biz_schedule_add})
<input value="続けて新規の予定登録をする" type="submit" class="submit">
</form>

</td>
<td class="padding_ss" align="center">

({t_form m=biz a=page_s_list})
<input type="hidden" name="w" value="({$w})">
<input value="続けて施設予約をする" type="submit" class="submit">
</form>

</td>
<td class="padding_ss" align="left">

({t_form _method=get m=pc a=page_h_home})
<input value="マイページに戻る" type="submit" class="submit">
</form>

</td>
</tr>
</table>
({/if})

<img src="./skin/dummy.gif" class="v_spacer_m">

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
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
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>

<!--/form-->
<!-- ******ここまで：予定を編集する****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
</td>
</tr>
</table>({*END:container*})
</td>
</tr>
<tr>
<td class="container inc_page_footer">
({$inc_page_footer|smarty:nodefaults})
</td>
</tr>
</table>
({ext_include file="inc_extension_pagelayout_bottom.tpl"})
</body>
</html>
