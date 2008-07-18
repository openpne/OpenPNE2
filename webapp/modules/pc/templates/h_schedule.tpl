({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************* -->
<!-- ******ここから：予定****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td align="center">
<!-- *ここから：予定内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" align="center" cellpadding="0" style="width:566px;" class="border_01">
<tr>
<td class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width: 30px;height: 20px;" class="dummy" align="left"><div class="b_b c_00" style="padding:3px 0px;">予定</div></td></tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- *ここから：主内容* -->
<table border="0" cellspacing="0" align="center" cellpadding="0" style="width: 566px;" class="border_01 bg_03">
({*********})
<tr>
<td align="center">
<table border="0" style="width: 564px;" cellspacing="0" cellpadding="0">
({********})
<!-- ここから：スケジュール詳細＞タイトル -->
<tr>
<td align="center" class="border_01" style="width:110px;border-width:0px 1px 1px 0px;">

<div class="padding_s">

タイトル

</div>

</td>
<td class="border_01" style="width:454px;border-width:0px 0px 1px 0px;">

<div class="padding_s">

({$c_schedule.title})

</div>

</td>
</tr>
<!-- ここまで：スケジュール詳細＞タイトル -->
({********})
<!-- ここから：スケジュール詳細＞開始日時 -->
<tr>
<td align="center" class="border_01" style="border-width:0px 1px 1px 0px">

<div class="padding_s">

開　　始

</div>

</td>
<td class="border_01" style="border-width:0px 0px 1px 0px;">

<div class="padding_s">

({$c_schedule.start_date|date_format:"%Y"}) 年
({$c_schedule.start_date|date_format:"%m"}) 月
({$c_schedule.start_date|date_format:"%d"}) 日
({if is_null($c_schedule.start_time)})
-- 時
-- 分
({else})
({$c_schedule.start_time|date_format:"%H"}) 時
({$c_schedule.start_time|date_format:"%M"}) 分
({/if})

</div>

</td>
</tr>
<!-- ここまで：スケジュール詳細＞開始日時 -->
({********})
<!-- ここから：スケジュール詳細＞終了日時 -->
<tr>
<td align="center" class="border_01" style="border-width:0px 1px 1px 0px;">

<div class="padding_s">

終　　了

</div>

</td>
<td class="border_01" style="border-width:0px 0px 1px 0px;">

<div class="padding_s">

({$c_schedule.end_date|date_format:"%Y"}) 年
({$c_schedule.end_date|date_format:"%m"}) 月
({$c_schedule.end_date|date_format:"%d"}) 日
({if is_null($c_schedule.end_time)})
-- 時
-- 分
({else})
({$c_schedule.end_time|date_format:"%H"}) 時
({$c_schedule.end_time|date_format:"%M"}) 分
({/if})

</div>

</td>
</tr>
<!-- ここまで：スケジュール詳細＞終了日時 -->
({********})
<!-- ここから：スケジュール詳細＞詳細テキスト -->
<tr>
<td align="center" class="border_01" style="border-width:0px 1px 1px 0px;">

<div class="padding_s">

詳　　細

</div>
</td>
<td class="border_01" style="border-width:0px 0px 1px 0px;">

<div class="padding_s">

({$c_schedule.body|nl2br})&nbsp;

</div>

</td>
</tr>
<!-- ここまで：スケジュール詳細＞詳細テキスト -->
({********})
({if !$is_unused_schedule})
<!-- ここから：スケジュール詳細＞お知らせメール有無 -->
<tr>
<td align="center" class="border_01" style="border-width:0px 1px 1px 0px;">

<div class="padding_s">

お知らせメール

</div>

</td>
<td class="border_01" style="border-width:0px 0px 1px 0px;">

<div class="padding_s">

({if $c_schedule.is_receive_mail})
受け取る
({else})
受け取らない
({/if})

</div>

</td>
</tr>
<!-- ここまで：スケジュール詳細＞お知らせメール有無 -->
({/if})
({********})
<!-- *ここから：主内容＞編集削除ボタン* -->
<tr>
<td class="bg_03" colspan="2">

<div class="padding_w_m">

<table border="0" cellspacing="0" cellpadding="6" align="center" style="width:240px;">
<tr>
<td>

({t_form m=pc a=page_h_schedule_edit})
<input type="hidden" name="target_c_schedule_id" value="({$c_schedule.c_schedule_id})">
<input type="submit" class="submit" value="　 編　　集 　">
</form>
</td>

<td>
({t_form m=pc a=page_h_schedule_delete})
<input type="hidden" name="target_c_schedule_id" value="({$c_schedule.c_schedule_id})">
<input type="submit" class="submit" value="　 削　　除 　">
</form>

</td>
</tr>
</table>

</div>

</td>
</tr>
<!-- *ここまで：主内容＞編集削除ボタン* -->
({********})
</table>
<!-- *ここまで：主内容* -->
</td>
</tr>
({*********})
</table>
({*ここまで：body*})
({*ここから：footer*})
<!-- *無し* -->
({*ここまで：footer*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：予定内容****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})

