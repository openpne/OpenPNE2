<div id="LayoutC">
<div id="Center">

({* #1931 *})<!-- ******ここから：スケジュール追加内容確認****** -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
({* #1931 *})<tr>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1931 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td align="center">
({* #1931 *})<!-- *ここから：スケジュール追加内容確認内容* -->
({* #1931 *})({*ここから：header*})
({* #1931 *})<!-- ここから：小タイトル -->
({* #1931 *})<table border="0" cellspacing="0" align="center" cellpadding="0" style="width:566px;" class="border_01">
({* #1931 *})<tr>
({* #1931 *})<td class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width: 30px;height: 20px;" class="dummy" align="left"><div class="b_b c_00" style="padding:3px 0px;">以下の内容でよろしいですか？</div>
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ここまで：小タイトル -->
({* #1931 *})({*ここまで：header*})
({* #1931 *})({*ここから：body*})
({* #1931 *})<!-- *ここから：スケジュール詳細* -->
({* #1931 *})<table border="0" cellspacing="0" cellpadding="0" style="width:566px;" class="border_01">
({* #1931 *})({*********})
({* #1931 *})<!-- *ここから：スケジュール詳細＞タイトル* -->
({* #1931 *})<tr>
({* #1931 *})<td align="center" class="border_01 bg_05" style="width:110px;border-width:0px 1px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})タイトル
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="border_01 bg_02" style="width:454px;border-width:0px 0px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$input.title})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})<!-- *ここまで：スケジュール詳細＞タイトル* -->
({* #1931 *})({*********})
({* #1931 *})<!-- *ここから：スケジュール詳細＞開始日時* -->
({* #1931 *})<tr>
({* #1931 *})<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})開　　始
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$input.start_year|string_format:"%04d"}) 年
({* #1931 *})({$input.start_month|string_format:"%02d"}) 月
({* #1931 *})({$input.start_day|string_format:"%02d"}) 日
({* #1931 *})({if is_null($input.start_hour)})
({* #1931 *})--
({* #1931 *})({else})
({* #1931 *})({$input.start_hour|string_format:"%02d"})
({* #1931 *})({/if}) 時
({* #1931 *})({if is_null($input.start_minute)})
({* #1931 *})--
({* #1931 *})({else})
({* #1931 *})({$input.start_minute|string_format:"%02d"})
({* #1931 *})({/if}) 分
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})<!-- *ここまで：スケジュール詳細＞開始日時* -->
({* #1931 *})({*********})
({* #1931 *})<!-- *ここから：スケジュール詳細＞終了日時* -->
({* #1931 *})<tr>
({* #1931 *})<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})終　　了
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$input.end_year|string_format:"%04d"}) 年
({* #1931 *})({$input.end_month|string_format:"%02d"}) 月
({* #1931 *})({$input.end_day|string_format:"%02d"}) 日
({* #1931 *})({if is_null($input.end_hour)})
({* #1931 *})--
({* #1931 *})({else})
({* #1931 *})({$input.end_hour|string_format:"%02d"})
({* #1931 *})({/if}) 時
({* #1931 *})({if is_null($input.end_minute)})
({* #1931 *})--
({* #1931 *})({else})
({* #1931 *})({$input.end_minute|string_format:"%02d"})
({* #1931 *})({/if}) 分
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})<!-- *ここまで：スケジュール詳細＞終了日時* -->
({* #1931 *})({*********})
({* #1931 *})<!-- *ここから：スケジュール詳細＞詳細テキスト* -->
({* #1931 *})<tr>
({* #1931 *})<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})詳　　細
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({$input.body|nl2br})&nbsp;
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})<!-- *ここまで：スケジュール詳細＞詳細テキスト* -->
({* #1931 *})({*********})
({* #1931 *})({if !$is_unused_schedule})
({* #1931 *})<!-- *ここから：スケジュール詳細＞お知らせメール有無* -->
({* #1931 *})<tr>
({* #1931 *})<td align="center" class="border_01 bg_05" style="border-width:0px 1px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})お知らせメール
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td class="border_01 bg_02" style="border-width:0px 0px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_s">
({* #1931 *})
({* #1931 *})({if $input.is_receive_mail})
({* #1931 *})受け取る
({* #1931 *})({else})
({* #1931 *})受け取らない
({* #1931 *})({/if})
({* #1931 *})
({* #1931 *})</div>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})<!-- *ここまで：スケジュール詳細＞お知らせメール有無* -->
({* #1931 *})({/if})
({* #1931 *})({*********})
({* #1931 *})<!-- *ここまで：スケジュール詳細* -->
({* #1931 *})<!-- *ここから：追加修正ボタン* -->
({* #1931 *})<tr>
({* #1931 *})<td class="bg_03" colspan="2" class="border_01" style="border-width:0px 0px 1px 0px;">
({* #1931 *})
({* #1931 *})<div class="padding_w_s" align="center">
({* #1931 *})
({* #1931 *})<table border="0" cellspacing="0" cellpadding="6" style="width:240px;">
({* #1931 *})<tr>
({* #1931 *})<td>
({* #1931 *})
({* #1931 *})({t_form_block m=pc a=do_h_schedule_add_insert_c_schedule})
({* #1931 *})
({* #1931 *})<input type="hidden" name="title" value="({$input.title})">
({* #1931 *})<input type="hidden" name="body" value="({$input.body})">
({* #1931 *})<input type="hidden" name="start_year" value="({$input.start_year})">
({* #1931 *})<input type="hidden" name="start_month" value="({$input.start_month})">
({* #1931 *})<input type="hidden" name="start_day" value="({$input.start_day})">
({* #1931 *})<input type="hidden" name="start_hour" value="({$input.start_hour})">
({* #1931 *})<input type="hidden" name="start_minute" value="({$input.start_minute})">
({* #1931 *})<input type="hidden" name="end_year" value="({$input.end_year})">
({* #1931 *})<input type="hidden" name="end_month" value="({$input.end_month})">
({* #1931 *})<input type="hidden" name="end_day" value="({$input.end_day})">
({* #1931 *})<input type="hidden" name="end_hour" value="({$input.end_hour})">
({* #1931 *})<input type="hidden" name="end_minute" value="({$input.end_minute})">
({* #1931 *})<input type="hidden" name="is_receive_mail" value="({$input.is_receive_mail})">
({* #1931 *})<input type="submit" class="input_submit" value="　 追　　加 　">
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})<td>
({* #1931 *})
({* #1931 *})({t_form_block m=pc a=page_h_schedule_add})
({* #1931 *})<input type="hidden" name="title" value="({$input.title})">
({* #1931 *})<input type="hidden" name="body" value="({$input.body})">
({* #1931 *})<input type="hidden" name="start_year" value="({$input.start_year})">
({* #1931 *})<input type="hidden" name="start_month" value="({$input.start_month})">
({* #1931 *})<input type="hidden" name="start_day" value="({$input.start_day})">
({* #1931 *})<input type="hidden" name="start_hour" value="({$input.start_hour})">
({* #1931 *})<input type="hidden" name="start_minute" value="({$input.start_minute})">
({* #1931 *})<input type="hidden" name="end_year" value="({$input.end_year})">
({* #1931 *})<input type="hidden" name="end_month" value="({$input.end_month})">
({* #1931 *})<input type="hidden" name="end_day" value="({$input.end_day})">
({* #1931 *})<input type="hidden" name="end_hour" value="({$input.end_hour})">
({* #1931 *})<input type="hidden" name="end_minute" value="({$input.end_minute})">
({* #1931 *})<input type="hidden" name="is_receive_mail" value="({$input.is_receive_mail})">
({* #1931 *})<input type="submit" class="input_submit" value="　 修　　正 　"><br>
({* #1931 *})({/t_form_block})
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})
({* #1931 *})</td>
({* #1931 *})</tr>
({* #1931 *})<!-- *ここまで：ボタン* -->
({* #1931 *})({*********})
({* #1931 *})</table>
({* #1931 *})({*ここまで：body*})
({* #1931 *})({*ここから：footer*})
({* #1931 *})<!-- *無し* -->
({* #1931 *})({*ここまで：footer*})
({* #1931 *})<!-- *ここから：スケジュール追加内容確認内容* -->
({* #1931 *})</td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})<tr>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1931 *})</tr>
({* #1931 *})</table>
({* #1931 *})<!-- ******ここまで：スケジュール追加内容確認****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
