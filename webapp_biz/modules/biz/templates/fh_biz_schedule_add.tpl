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

({t_form _enctype=file m=biz a=do_fhg_biz_schedule_add})
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table border="0" cellspacing="0" cellpadding="0" style="width:540px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:526px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *ここから：予定を編集する＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:526px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="./skin/content_header_1.gif" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:488px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">予定を登録する</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞予定表示 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:526px;" class="border_01">
({*********})
<tr>
<td style="width:524px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:100px;" class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">

繰り返し設定

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:421px;" class="bg_02" align="left" valign="middle">

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="padding_ss" style="width:100px;">

<input type='radio' name='sc_rp' value='0' checked class="no_bg">繰り返さない

</td>
<td class="padding_ss">

<select name='sc_bn'>
	({section name=i loop=$bn_num})
		<option value="({$bn_num[i]})">({$bn_num[i]})日間
	({/section})
</select>

</td>
</tr>
<tr>
<td class="padding_ss">

<input type='radio' name='sc_rp' value='true'class="no_bg">繰り返す

</td>
<td class="padding_ss">

<select name='sc_rcount'>
	({section name=i loop=$rp_count})
		<option type='radio' value='({$rp_count[i]})'>({$rp_count[i]})週間
	({/section})
</select>　　

</td>
</tr>
<tr>
<td class="padding_ss" style="text-align:right;">

繰り返す曜日

</td>
<td class="padding_ss">

({section name=i loop=$wk})
<input type='checkbox' name="sc_rwk[]" value='({$smarty.section.i.index})' class="no_bg">({$wk[i]})
({/section})

</td>
</tr>
</table>

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

開始日

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<select name='sc_b_year'>
	({$years|smarty:nodefaults})
</select>
<select name='sc_b_month'>
	({$monthes|smarty:nodefaults})
</select>
<select name='sc_b_date'>
	({$days|smarty:nodefaults})
</select>

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

時　刻

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">
<select name='sc_b_hour'>
	<option value='' ({if $begin_hour == null})selected({/if})>--時
	({section name=i loop=$hours})
		<option value="({$hours[i]|string_format:"%02d"})" ({if $begin_hour})({if ($hours[i]|string_format:"%02d") == $begin_hour})selected({/if})({/if})>({$hours[i]})時
	({/section})
</select>
<select name='sc_b_minute'>
	<option value=''>--分
	({section name=i loop=$mins})
		<option value="({$mins[i]|string_format:"%02d"})" ({if $begin_min})({if ($mins[i]|string_format:"%02d") == $begin_min})selected({/if})({/if})>({$mins[i]})分
	({/section})
</select>～

<select name='sc_f_hour'>
	<option value=''>--時
	({section name=i loop=$hours})
		<option value="({$hours[i]|string_format:"%02d"})" ({if $finish_hour})({if ($hours[i]|string_format:"%02d") == $finish_hour})selected({/if})({/if})>({$hours[i]})時
	({/section})
</select>
<select name='sc_f_minute'>
	<option value=''>--分
	({section name=i loop=$mins})
		<option value="({$mins[i]|string_format:"%02d"})" ({if $finish_min})({if ($mins[i]|string_format:"%02d") == $finish_min})selected({/if})({/if})>({$mins[i]})分
	({/section})
</select>
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

タイトル
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<input type='text' name='sc_title' size="60" value="({$sc_title})">

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

内容

</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<textarea name='sc_memo' cols="50" rows="5">({$sc_memo})</textarea>
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
<!--
({*********})
<script type="text/javascript" src="./modules/biz/schedule_member_form.js"></script>
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">
参加者<br>
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">

<table name="join">
<tr>
	<td>
		<select id="groupSelect" onchange="">
			<option value="0">(全員)</option>
		</select>
	</td>
</tr>
<tr>
	<td>
		<select name="sc_j_mem[]" size="5" multiple="multiple">
		<option value='({$my_id})' selected>({$members[$my_id]})</option>
		</select>
	</td>
	<td>
		<input value="← 追加" onclick="addMember(this.form, 'members', 'sc_j_mem[]')" type="button"><br>
		<input value="削除 →" onclick="deleteMember(this.form, 'sc_j_mem[]')" type="button">
	<td>
	<td>
		<select name="members" size="5" multiple="multiple">
			<option value='({$my_id})' selected>({$members[$my_id]})</option>
		({section name=i start=1 loop=$members})
			({if $smarty.section.i.index != $my_id})
			<option value='({$smarty.section.i.index})' selected>({$members[i]})</option>
			({/if})
		({/section})
		</select>
	</td>
</tr>
</table>-->
<!--	<input name='sc_j_mem[]' value='({$my_id})' type='checkbox' class='no_bg' checked>({$members[$my_id]})<br>
	<input name='sc_j_mem[]' value='({$my_id})' type='checkbox' class='no_bg' checked>({$members[$my_id]})<br>
	({section name=i start=1 loop=$members})
		({if $smarty.section.i.index != $my_id})
		<input name='sc_j_mem[]' value='({$smarty.section.i.index})' type='checkbox' class='no_bg' ({if $smarty.section.i.index == $my_id})checked({/if})>({$members[i]})<br>
		({/if})
	({/section})-->
<!--</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})-->

({*ここから：新規予定*})

<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" style="width:1px; height:1px;" class="dummy"></td>
<td style="width:150px;" class="bg_05">

<div class="padding_s" align="center">

参加者<br>※未選択は全員

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td style="width:412px;" class="bg_02">

<table border="0" cellspacing="0" cellpadding="0" style="width:100%;">
<tr>
({foreach from=$members item=item name=mem})
({if $item})
<td class="padding_ss" style="width:33%;" valign="top">

<input name='sc_j_mem[]' value='({$item.c_member_id})' type='checkbox' class='no_bg'({if $item.checkflag}) checked="checked"({/if})>({$item.nickname})

</td>
({else})
<td class="padding_ss" style="width:33%;">&nbsp;</td>
({/if})


({if $smarty.foreach.mem.last && ($smarty.foreach.mem.iteration%3 == 1 || $smarty.foreach.mem.iteration%3 == 2)})<td>&nbsp;</td>({/if})

({if $smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 1})<td>&nbsp;</td>({/if})

({if !$smarty.foreach.mem.last && $smarty.foreach.mem.iteration%3 == 0})</tr><tr>({/if})
({/foreach})
</tr>
</table>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" style="width:1px; height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})

({*ここまで：新規予定*})


<!--
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_05" align="center" valign="middle">
<div style="padding:4px 3px;">
設備
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="left" valign="middle">
<div style="padding:4px 3px;">
	({foreach item=shisetsu name=i from=$shisetsu})
		<input name='sc_j_plc[]' value='({$shisetsu.biz_shisetsu_id})' type='checkbox' class='no_bg'>({$shisetsu.name})<br>
	({/foreach})
</div>
</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})-->
<tr>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" style="width:1px;height:1px;" class="dummy"></td>
<td class="bg_02" align="center" colspan="3">

<img src="./skin/dummy.gif" class="v_spacer_m">

<div style="padding:4px 3px;">

<input type='submit' name='entry' value='登録する'({if $is_g}) onclick="allSelect(this.form, 'sc_j_mem[]')"({/if})>

</div>

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

</form>
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
