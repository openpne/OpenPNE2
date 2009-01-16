<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>以下の内容でよろしいですか？</h3></div>

<table>
<tr><th>タイトル</th><td>({$input.title})</td></tr>
<tr><th>開　　始</th><td>
({$input.start_year|string_format:"%04d"}) 年
({$input.start_month|string_format:"%02d"}) 月
({$input.start_day|string_format:"%02d"}) 日
({if is_null($input.start_hour)})
--
({else})
({$input.start_hour|string_format:"%02d"})
({/if}) 時
({if is_null($input.start_minute)})
--
({else})
({$input.start_minute|string_format:"%02d"})
({/if}) 分
</td></tr>

<tr><th>終　　了</th><td>
({$input.end_year|string_format:"%04d"}) 年
({$input.end_month|string_format:"%02d"}) 月
({$input.end_day|string_format:"%02d"}) 日
({if is_null($input.end_hour)})
--
({else})
({$input.end_hour|string_format:"%02d"})
({/if}) 時
({if is_null($input.end_minute)})
--
({else})
({$input.end_minute|string_format:"%02d"})
({/if}) 分
</td></tr>
<tr><th>詳　　細</th><td>({$input.body|nl2br})</td></tr>
({if !$is_unused_schedule})
<tr><th>お知らせメール</th><td>
({if $input.is_receive_mail})
受け取る
({else})
受け取らない
({/if})
</td></tr>
({/if})
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_schedule_edit_update_c_schedule})
<input type="hidden" name="target_c_schedule_id" value="({$target_c_schedule_id})" />
<input type="hidden" name="title" value="({$input.title})" />
<input type="hidden" name="body" value="({$input.body})" />
<input type="hidden" name="start_year" value="({$input.start_year})" />
<input type="hidden" name="start_month" value="({$input.start_month})" />
<input type="hidden" name="start_day" value="({$input.start_day})" />
<input type="hidden" name="start_hour" value="({$input.start_hour})" />
<input type="hidden" name="start_minute" value="({$input.start_minute})" />
<input type="hidden" name="end_year" value="({$input.end_year})" />
<input type="hidden" name="end_month" value="({$input.end_month})" />
<input type="hidden" name="end_day" value="({$input.end_day})" />
<input type="hidden" name="end_hour" value="({$input.end_hour})" />
<input type="hidden" name="end_minute" value="({$input.end_minute})" />
<input type="hidden" name="is_receive_mail" value="({$input.is_receive_mail})" />
<input type="submit" class="input_submit" value="　完　了　" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_h_schedule_edit})
<input type="hidden" name="target_c_schedule_id" value="({$target_c_schedule_id})" />
<input type="hidden" name="title" value="({$input.title})" />
<input type="hidden" name="body" value="({$input.body})" />
<input type="hidden" name="start_year" value="({$input.start_year})" />
<input type="hidden" name="start_month" value="({$input.start_month})" />
<input type="hidden" name="start_day" value="({$input.start_day})" />
<input type="hidden" name="start_hour" value="({$input.start_hour})" />
<input type="hidden" name="start_minute" value="({$input.start_minute})" />
<input type="hidden" name="end_year" value="({$input.end_year})" />
<input type="hidden" name="end_month" value="({$input.end_month})" />
<input type="hidden" name="end_day" value="({$input.end_day})" />
<input type="hidden" name="end_hour" value="({$input.end_hour})" />
<input type="hidden" name="end_minute" value="({$input.end_minute})" />
<input type="hidden" name="is_receive_mail" value="({$input.is_receive_mail})" />
<input type="submit" class="input_submit" value="　修　正　" /><br />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
