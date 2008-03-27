<div id="LayoutC">
<div id="Center">

({* #1952 *})<!-- ******ここから：スケジュール修正内容確認****** -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td align="center">
({* #1952 *})<!-- *ここから：スケジュール修正内容確認内容* -->
({* #1952 *})({*ここから：header*})
({* #1952 *})<!-- ここから：小タイトル -->
({* #1952 *})<table border="0" cellspacing="0" align="center" cellpadding="0" style="width:566px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width: 30px;height: 20px;" class="dummy" align="left" /><div class="b_b c_00" style="padding:3px 0px;">以下の内容でよろしいですか？</div></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：小タイトル -->
({* #1952 *})({*ここまで：header*})
({* #1952 *})({*ここから：body*})
({* #1952 *})<!-- *ここから：スケジュール詳細* -->
({* #1952 *})<table border="0" cellspacing="0" align="center" cellpadding="0" style="width:566px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td align="center">
({* #1952 *})<!-- *スケジュール詳細＞タイトル* -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01 bg_05" style="width:110px;border-width:0px 1px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})タイトル
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="border_01 bg_02" style="width:454px;border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$input.title})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<!-- *スケジュール詳細＞開始日時* -->
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})開　　始
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$input.start_year|string_format:"%04d"}) 年
({* #1952 *})({$input.start_month|string_format:"%02d"}) 月
({* #1952 *})({$input.start_day|string_format:"%02d"}) 日
({* #1952 *})({if is_null($input.start_hour)})
({* #1952 *})--
({* #1952 *})({else})
({* #1952 *})({$input.start_hour|string_format:"%02d"})
({* #1952 *})({/if}) 時
({* #1952 *})({if is_null($input.start_minute)})
({* #1952 *})--
({* #1952 *})({else})
({* #1952 *})({$input.start_minute|string_format:"%02d"})
({* #1952 *})({/if}) 分
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<!-- *スケジュール詳細＞終了日時* -->
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})終　　了
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$input.end_year|string_format:"%04d"}) 年
({* #1952 *})({$input.end_month|string_format:"%02d"}) 月
({* #1952 *})({$input.end_day|string_format:"%02d"}) 日
({* #1952 *})({if is_null($input.end_hour)})
({* #1952 *})--
({* #1952 *})({else})
({* #1952 *})({$input.end_hour|string_format:"%02d"})
({* #1952 *})({/if}) 時
({* #1952 *})({if is_null($input.end_minute)})
({* #1952 *})--
({* #1952 *})({else})
({* #1952 *})({$input.end_minute|string_format:"%02d"})
({* #1952 *})({/if}) 分
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})<!-- *スケジュール詳細＞詳細テキスト* -->
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})詳　　細
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$input.body|nl2br})&nbsp;
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})({if !$is_unused_schedule})
({* #1952 *})<!-- *スケジュール詳細＞お知らせメール有無* -->
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})お知らせメール
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({if $input.is_receive_mail})
({* #1952 *})受け取る
({* #1952 *})({else})
({* #1952 *})受け取らない
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})({/if})
({* #1952 *})({*********})
({* #1952 *})<!-- *ここまで：スケジュール詳細* -->
({* #1952 *})<!-- *ここから：編集・修正ボタン* -->
({* #1952 *})<tr>
({* #1952 *})<td class="bg_03" align="center" colspan="2">
({* #1952 *})
({* #1952 *})<div class="padding_w_m">
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="6">
({* #1952 *})<tr>
({* #1952 *})<td>
({* #1952 *})
({* #1952 *})({t_form_block m=pc a=do_h_schedule_edit_update_c_schedule})
({* #1952 *})
({* #1952 *})<input type="hidden" name="target_c_schedule_id" value="({$target_c_schedule_id})">
({* #1952 *})<input type="hidden" name="title" value="({$input.title})">
({* #1952 *})<input type="hidden" name="body" value="({$input.body})">
({* #1952 *})<input type="hidden" name="start_year" value="({$input.start_year})">
({* #1952 *})<input type="hidden" name="start_month" value="({$input.start_month})">
({* #1952 *})<input type="hidden" name="start_day" value="({$input.start_day})">
({* #1952 *})<input type="hidden" name="start_hour" value="({$input.start_hour})">
({* #1952 *})<input type="hidden" name="start_minute" value="({$input.start_minute})">
({* #1952 *})<input type="hidden" name="end_year" value="({$input.end_year})">
({* #1952 *})<input type="hidden" name="end_month" value="({$input.end_month})">
({* #1952 *})<input type="hidden" name="end_day" value="({$input.end_day})">
({* #1952 *})<input type="hidden" name="end_hour" value="({$input.end_hour})">
({* #1952 *})<input type="hidden" name="end_minute" value="({$input.end_minute})">
({* #1952 *})<input type="hidden" name="is_receive_mail" value="({$input.is_receive_mail})">
({* #1952 *})<td><input type="submit" class="input_submit" value="　 完　　了 　">
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td>
({* #1952 *})
({* #1952 *})({t_form_block m=pc a=page_h_schedule_edit})
({* #1952 *})<input type="hidden" name="target_c_schedule_id" value="({$target_c_schedule_id})">
({* #1952 *})<input type="hidden" name="title" value="({$input.title})">
({* #1952 *})<input type="hidden" name="body" value="({$input.body})">
({* #1952 *})<input type="hidden" name="start_year" value="({$input.start_year})">
({* #1952 *})<input type="hidden" name="start_month" value="({$input.start_month})">
({* #1952 *})<input type="hidden" name="start_day" value="({$input.start_day})">
({* #1952 *})<input type="hidden" name="start_hour" value="({$input.start_hour})">
({* #1952 *})<input type="hidden" name="start_minute" value="({$input.start_minute})">
({* #1952 *})<input type="hidden" name="end_year" value="({$input.end_year})">
({* #1952 *})<input type="hidden" name="end_month" value="({$input.end_month})">
({* #1952 *})<input type="hidden" name="end_day" value="({$input.end_day})">
({* #1952 *})<input type="hidden" name="end_hour" value="({$input.end_hour})">
({* #1952 *})<input type="hidden" name="end_minute" value="({$input.end_minute})">
({* #1952 *})<input type="hidden" name="is_receive_mail" value="({$input.is_receive_mail})">
({* #1952 *})<td><input type="submit" class="input_submit" value="　 修　　正 　"><br />
({* #1952 *})({/t_form_block})
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})<!-- *ここまで：編集・修正ボタン* -->
({* #1952 *})({*********})
({* #1952 *})</table>
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})({*ここまで：body*})
({* #1952 *})({*ここから：footer*})
({* #1952 *})<!-- 無し -->
({* #1952 *})({*ここまで：footer*})
({* #1952 *})<!-- *ここまで：スケジュール修正内容確認内容* -->
({* #1952 *})</td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ******ここまで：スケジュール修正内容確認****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
