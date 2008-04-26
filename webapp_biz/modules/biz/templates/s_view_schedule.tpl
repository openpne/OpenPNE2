<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>施設予定詳細</h3></div>

<table>
<tr>
<th>施設名</th><td>({$list.name})</td>
</tr><tr>
<th>日時</th><td>({$schedule.date|date_format:"%Y年%m月%d日"})({$schedule.begin_time|date_format:"%H:%M"})～({$schedule.finish_time|date_format:"%H:%M"})</td>
</tr><tr>
<th>予定登録者</th><td>({$schedule.member_name})</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
({if !$msg})
<li>
({t_form_block m=biz a=page_s_delete_schedule})
<input type="hidden" name="target_id" value="({$schedule.biz_shisetsu_schedule_id})" />
<input value="削除する" type="submit" class="input_submit" />
({/t_form_block})
</li>
({else})
<li>
({t_form_block m=biz a=page_s_list})
<input type="hidden" name="w" value="({$w})" />
<input value="続けて新規の施設予定登録をする" type="submit" class="input_submit" />
({/t_form_block})
</li>
({capture name="続けて予定登録"})
<li>
({t_form_block m=biz a=page_h_biz_schedule_add})
<input value="続けて予定登録をする" type="submit" class="input_submit" />
({/t_form_block})
</li>
({/capture})
<li>
({t_form_block m=biz a=page_s_list})
<input value="施設一覧に戻る" type="submit" class="input_submit" />
({/t_form_block})
</li>
({/if})
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
