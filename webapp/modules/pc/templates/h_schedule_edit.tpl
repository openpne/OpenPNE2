<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>予定を編集する</h3></div>
({t_form_block m=pc a=page_h_schedule_edit_confirm})
<input type="hidden" name="target_c_schedule_id" value="({$target_c_schedule_id})" />
<table>
<tr>
<th>タイトル</th>
<td>
<input type="text" class="input_text" name="title" value="({$input.title})" size="40" />
</td>
</tr>
<tr>
<th>開始日時</th>
<td>
<select name="start_year">
({foreach from=$year_list item=item})
<option value="({$item})"({if $item==$input.start_year}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 年
<select name="start_month">
({foreach from=$month_list item=item})
<option value="({$item})"({if $item==$input.start_month}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 月
<select name="start_day">
({foreach from=$day_list item=item})
<option value="({$item})"({if $item==$input.start_day}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 日
<select name="start_hour"><option value="">--</option>
({foreach from=$hour_list item=item})
<option value="({$item})"({if $item==$input.start_hour}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 時
<select name="start_minute"><option value="">--</option>
({foreach from=$minute_list item=item})
<option value="({$item})"({if $item==$input.start_minute}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 分
</td>
</tr>
<tr>
<th>終了日時</th>
<td>
<select name="end_year"><option value="">----</option>
({foreach from=$year_list item=item})
<option value="({$item})"({if $item==$input.end_year}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 年
<select name="end_month"><option value="">--</option>
({foreach from=$month_list item=item})
<option value="({$item})"({if $item==$input.end_month}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 月
<select name="end_day"><option value="">--</option>
({foreach from=$day_list item=item})
<option value="({$item})"({if $item==$input.end_day}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 日
<select name="end_hour"><option value="">--</option>
({foreach from=$hour_list item=item})
<option value="({$item})"({if $item==$input.end_hour}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 時
<select name="end_minute"><option value="">--</option>
({foreach from=$minute_list item=item})
<option value="({$item})"({if $item==$input.end_minute}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select> 分
</td>
</tr>
<tr>
<th>詳細</th>
<td>
<textarea name="body" rows="6" cols="50">({$input.body})</textarea>
</td>
</tr>
({if !$is_unused_schedule})
<tr>
<th>お知らせメール</th>
<td>
<input type="checkbox" class="input_checkbox" name="is_receive_mail" id="is_receive_mail" value="1"({if $input.is_receive_mail}) checked="checked"({/if}) /><label for="is_receive_mail">メールを受け取る</label>
<p>※予定当日の朝に登録メールアドレスに通知メールが届きます。</p>
</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_schedule})&amp;target_c_schedule_id=({$target_c_schedule_id})">編集をキャンセルしてもどる</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
