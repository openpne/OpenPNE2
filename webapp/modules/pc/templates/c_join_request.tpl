<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>この({$WORD_COMMUNITY})に参加</h3></div>

({t_form_block m=pc a=do_c_join_request_insert_c_commu_member_confirm})
<input type="hidden" name="c_member_id" value="({$member.c_member_id})" />
<input type="hidden" name="target_c_commu_id" value="({$c_commu_id})" />

<table>
<tr><th>メッセージ (任意)</th><td><textarea name="body" rows="6" cols="50">({$body})</textarea></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="参加を希望する" /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
