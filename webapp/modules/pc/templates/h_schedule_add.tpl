({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************************* -->
<!-- ******ここから：スケジュール入力フォーム****** -->
({t_form m=pc a=page_h_schedule_add_confirm})

<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td align="center">
<!-- *ここから：スケジュール入力フォーム内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:566px;" class="border_01">
<tr>
<td class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width: 30px;height: 20px;" class="dummy" align="left">

<div class="b_b c_00" style="padding:3px;">

予定を追加する

</div>

</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<table border="0" cellspacing="0" cellpadding="0" style="width:566px;" class="border_01">
({*********})
<tr>
<td>
<table border="0" style="width:564px;" cellspacing="0" cellpadding="0">
({********})
<!-- ここから：スケジュールフォーム＞タイトル -->
<tr>
<td align="center" class="border_01 bg_05" style="width:110px;border-width:0px 1px 1px 0px;">

<div class="padding_s">

タイトル

</div>

</td>
<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">

<div class="padding_s">

<input type="text" class="text" name="title" value="({$input.title})" style="width:400px">

</div>

</td>
</tr>
<!-- ここまで：スケジュールフォーム＞タイトル -->
({********})
<!-- ここから：スケジュールフォーム＞開始日時 -->
<tr>
<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px">

<div class="padding_s">

開　　始

</div>

</td>
<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">

<div class="padding_s">

<select name="start_year">
({foreach from=$year_list item=item})
<option value="({$item})"({if $item==$input.start_year}) selected({/if})>({$item})
({/foreach})
</select>年
<select name="start_month">
({foreach from=$month_list item=item})
<option value="({$item})"({if $item==$input.start_month}) selected({/if})>({$item})
({/foreach})
</select>月
<select name="start_day">
({foreach from=$day_list item=item})
<option value="({$item})"({if $item==$input.start_day}) selected({/if})>({$item})
({/foreach})
</select>日
<select name="start_hour"><option value="" selected>--
({foreach from=$hour_list item=item})
<option value="({$item})"({if $item==$input.start_hour}) selected({/if})>({$item})
({/foreach})
</select>時
<select name="start_minute"><option value="" selected>--
({foreach from=$minute_list item=item})
<option value="({$item})"({if $item==$input.start_minute}) selected({/if})>({$item})
({/foreach})
</select>分

</div>

</td>
</tr>
<!-- ここまで：スケジュールフォーム＞開始日時 -->
({********})
<!-- ここから：スケジュールフォーム＞終了日時 -->
<tr>
<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px;">

<div class="padding_s">

終　　了

</div>

</td>
<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">

<div class="padding_s">

<select name="end_year"><option value="">----
({foreach from=$year_list item=item})
<option value="({$item})"({if $item==$input.end_year}) selected({/if})>({$item})
({/foreach})
</select>年
<select name="end_month"><option value="">--
({foreach from=$month_list item=item})
<option value="({$item})"({if $item==$input.end_month}) selected({/if})>({$item})
({/foreach})
</select>月
<select name="end_day"><option value="">--
({foreach from=$day_list item=item})
<option value="({$item})"({if $item==$input.end_day}) selected({/if})>({$item})
({/foreach})
</select>日
<select name="end_hour"><option value="" selected>--
({foreach from=$hour_list item=item})
<option value="({$item})"({if $item==$input.end_hour}) selected({/if})>({$item})
({/foreach})
</select>時
<select name="end_minute"><option value="" selected>--
({foreach from=$minute_list item=item})
<option value="({$item})"({if $item==$input.end_minute}) selected({/if})>({$item})
({/foreach})
</select>分

</div>

</td>
</tr>
<!-- ここまで：スケジュールフォーム＞終了日時 -->
({********})
<!-- ここから：スケジュールフォーム＞詳細テキスト -->
<tr>
<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px;">

<div class="padding_s">

詳　　細

</div>

</td>
<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">

<div class="padding_s">

<textarea class="text" name="body" style="width:400px;height:150px">({$input.body})</textarea>

</div>

</td>
</tr>
<!-- ここまで：スケジュールフォーム＞詳細テキスト -->
({********})
({if !$is_unused_schedule})
<!-- ここから；スケジュールフォーム＞お知らせメール通知 -->
<tr>
<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px;">

<div class="padding_s">お知らせメール</div>

</td>
<td class="border_01 bg_05" style="border-width:0px 0px 1px 0px;">

<div class="padding_s">

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="middle" class="bg_02">

<input type="checkbox" name="is_receive_mail" value="1" align="middle"({if $input.is_receive_mail}) checked="checked"({/if}) class="no_bg">

</td>
<td valign="middle">
　予定当日の朝に通知メールが届きます<br>
　<span>※送信先は登録メールアドレスです</span>
</td>
</tr>
</table>

</div>

</td>
</tr>
<!-- ここまで；スケジュールフォーム＞お知らせメール通知 -->
({/if})
({********})
<!-- スケジュールフォーム＞サブミットボタン -->
<tr>
<td class="bg_03" align="center" colspan="2">

<div class="padding_w_m">

<input type="submit" class="submit" value="　 確認画面 　">

</div>

</td>
</tr>
({********})
</table>
</td>
</tr>
({*********})
</table>
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここから：footer*})
<!-- *ここまで：スケジュール入力フォーム内容* -->
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
<!-- ******ここまで：スケジュール入力フォーム****** -->
<!-- ******************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
