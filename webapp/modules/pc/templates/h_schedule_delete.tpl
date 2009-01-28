<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>この予定を削除してよろしいですか？</h3></div>

<table>
<tr><th>タイトル</th><td>({$c_schedule.title})</td></tr>
<tr><th>開　　始</th><td>
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
</td></tr>
<tr><th>終　　了</th><td>
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
</td></tr>
<tr><th>詳　　細</th><td>({$c_schedule.body|nl2br})</td></tr>
({if !$is_unused_schedule})
<tr><th>お知らせメール</th><td>
({if $c_schedule.is_receive_mail})
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
({t_form_block m=pc a=do_h_schedule_delete_delete_c_schedule})
<input type="hidden" name="target_c_schedule_id" value="({$c_schedule.c_schedule_id})" />
<input type="submit" class="input_submit" value="　削　除　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_h_schedule})
<input type="hidden" name="target_c_schedule_id" value="({$c_schedule.c_schedule_id})" />
<input type="submit" class="input_submit" value="キャンセル" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
