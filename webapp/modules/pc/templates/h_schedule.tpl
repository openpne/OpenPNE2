<div id="LayoutC">
<div id="Center">

({* #1952 *})<!-- ******ここから：予定****** -->
({* #1952 *})<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
({* #1952 *})<tr>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
({* #1952 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td align="center">
({* #1952 *})<!-- *ここから：予定内容* -->
({* #1952 *})({*ここから：header*})
({* #1952 *})<!-- ここから：小タイトル -->
({* #1952 *})<table border="0" cellspacing="0" align="center" cellpadding="0" style="width:566px;" class="border_01">
({* #1952 *})<tr>
({* #1952 *})<td class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width: 30px;height: 20px;" class="dummy" align="left"><div class="b_b c_00" style="padding:3px 0px;">予定</div></td></tr>
({* #1952 *})</table>
({* #1952 *})<!-- ここまで：小タイトル -->
({* #1952 *})({*ここまで：header*})
({* #1952 *})({*ここから：body*})
({* #1952 *})<!-- *ここから：主内容* -->
({* #1952 *})<table border="0" cellspacing="0" align="center" cellpadding="0" style="width: 566px;" class="border_01 bg_03">
({* #1952 *})({*********})
({* #1952 *})<tr>
({* #1952 *})<td align="center">
({* #1952 *})<table border="0" style="width: 564px;" cellspacing="0" cellpadding="0">
({* #1952 *})({********})
({* #1952 *})<!-- ここから：スケジュール詳細＞タイトル -->
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01" style="width:110px;border-width:0px 1px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})タイトル
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="border_01" style="width:454px;border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$c_schedule.title})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})<!-- ここまで：スケジュール詳細＞タイトル -->
({* #1952 *})({********})
({* #1952 *})<!-- ここから：スケジュール詳細＞開始日時 -->
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01" style="border-width:0px 1px 1px 0px">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})開　　始
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="border_01" style="border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$c_schedule.start_date|date_format:"%Y"}) 年
({* #1952 *})({$c_schedule.start_date|date_format:"%m"}) 月
({* #1952 *})({$c_schedule.start_date|date_format:"%d"}) 日
({* #1952 *})({if is_null($c_schedule.start_time)})
({* #1952 *})-- 時
({* #1952 *})-- 分
({* #1952 *})({else})
({* #1952 *})({$c_schedule.start_time|date_format:"%H"}) 時
({* #1952 *})({$c_schedule.start_time|date_format:"%M"}) 分
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})<!-- ここまで：スケジュール詳細＞開始日時 -->
({* #1952 *})({********})
({* #1952 *})<!-- ここから：スケジュール詳細＞終了日時 -->
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01" style="border-width:0px 1px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})終　　了
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="border_01" style="border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$c_schedule.end_date|date_format:"%Y"}) 年
({* #1952 *})({$c_schedule.end_date|date_format:"%m"}) 月
({* #1952 *})({$c_schedule.end_date|date_format:"%d"}) 日
({* #1952 *})({if is_null($c_schedule.end_time)})
({* #1952 *})-- 時
({* #1952 *})-- 分
({* #1952 *})({else})
({* #1952 *})({$c_schedule.end_time|date_format:"%H"}) 時
({* #1952 *})({$c_schedule.end_time|date_format:"%M"}) 分
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})<!-- ここまで：スケジュール詳細＞終了日時 -->
({* #1952 *})({********})
({* #1952 *})<!-- ここから：スケジュール詳細＞詳細テキスト -->
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01" style="border-width:0px 1px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})詳　　細
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})</td>
({* #1952 *})<td class="border_01" style="border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({$c_schedule.body|nl2br})&nbsp;
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})<!-- ここまで：スケジュール詳細＞詳細テキスト -->
({* #1952 *})({********})
({* #1952 *})({if !$is_unused_schedule})
({* #1952 *})<!-- ここから：スケジュール詳細＞お知らせメール有無 -->
({* #1952 *})<tr>
({* #1952 *})<td align="center" class="border_01" style="border-width:0px 1px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})お知らせメール
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})<td class="border_01" style="border-width:0px 0px 1px 0px;">
({* #1952 *})
({* #1952 *})<div class="padding_s">
({* #1952 *})
({* #1952 *})({if $c_schedule.is_receive_mail})
({* #1952 *})受け取る
({* #1952 *})({else})
({* #1952 *})受け取らない
({* #1952 *})({/if})
({* #1952 *})
({* #1952 *})</div>
({* #1952 *})
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})<!-- ここまで：スケジュール詳細＞お知らせメール有無 -->
({* #1952 *})({/if})
({* #1952 *})({********})
({* #1952 *})<!-- *ここから：主内容＞編集削除ボタン* -->
({* #1952 *})<tr>
({* #1952 *})<td class="bg_03" colspan="2">
({* #1952 *})
({* #1952 *})<div class="padding_w_m">
({* #1952 *})
({* #1952 *})<table border="0" cellspacing="0" cellpadding="6" align="center" style="width:240px;">
({* #1952 *})<tr>
({* #1952 *})<td>
({* #1952 *})
({* #1952 *})({t_form_block m=pc a=page_h_schedule_edit})
({* #1952 *})<input type="hidden" name="target_c_schedule_id" value="({$c_schedule.c_schedule_id})">
({* #1952 *})<input type="submit" class="input_submit" value="　 編　　集 　">
({* #1952 *})({/t_form_block})
({* #1952 *})</td>
({* #1952 *})
({* #1952 *})<td>
({* #1952 *})({t_form_block m=pc a=page_h_schedule_delete})
({* #1952 *})<input type="hidden" name="target_c_schedule_id" value="({$c_schedule.c_schedule_id})">
({* #1952 *})<input type="submit" class="input_submit" value="　 削　　除 　">
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
({* #1952 *})<!-- *ここまで：主内容＞編集削除ボタン* -->
({* #1952 *})({********})
({* #1952 *})</table>
({* #1952 *})<!-- *ここまで：主内容* -->
({* #1952 *})</td>
({* #1952 *})</tr>
({* #1952 *})({*********})
({* #1952 *})</table>
({* #1952 *})({*ここまで：body*})
({* #1952 *})({*ここから：footer*})
({* #1952 *})<!-- *無し* -->
({* #1952 *})({*ここまで：footer*})
({* #1952 *})</td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})<tr>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1952 *})</tr>
({* #1952 *})</table>
({* #1952 *})<!-- ******ここまで：予定内容****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
