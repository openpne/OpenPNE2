<div class="parts bizSideTodoList">
<div class="partsHeading"><h3>Todo一覧</h3></div>

({t_form_block m=biz a=do_`$cmd`_home_insert_biz_todo})
<input type="hidden" name="target_id" value="({$target_id})" />
<input type="hidden" name="nickname" value="({$nickname})" />
<div class="block">
<textarea name="todo" cols="30" rows="2"></textarea>
<label for="is_all">だれかがTodo</label><input type="checkbox" class="input_checkbox" name="is_all" id="is_all" value="1" />
<input type="submit" class="input_submit" value="　追　加　" />
</div>
({/t_form_block})

({if $is_todo_list})
<div class="block">
<p>Todoはありません。</p>
</div>
({else})
<table>

({foreach key=i item=value from=$todolist})
({if $value.memo})
<tr class="({if $value.priority == 1})priHigh({elseif $value.priority == 2})priMiddle({else})priLow({/if})({if $value.writer_id != $target_id}) someone({/if})">
<td class="state">
<p><a href="({t_url m=biz a=do_`$cmd`_home_check_biz_todo})&amp;sessid=({$PHPSESSID})&amp;chid=({$value.biz_todo_id})&amp;is_check=({$value.is_check})&amp;target_c_member_id=({$target_id})"><img src="./skin/default/img/biz/checkbox_nochecked_({if $value.c_member_id == 0})share_({/if})2.gif" alt="" /></a></p>
</td>
<td class="text">({strip})
({$value.memo|nl2br|t_url2a})
({if ($value.writer_id != $target_id) || ($value.c_member_id == 0)})
（<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$value.writer_id})">({$value.writer_name})</a>）
({/if})
({/strip})</td>
<td class="operation">
<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$value.biz_todo_id})&amp;target_id=({$target_id})"><img src="./skin/default/img/biz/edit_2.gif" alt="編集" /></a>
<a href="({t_url m=biz a=do_`$cmd`_home_delete_biz_todo})&amp;sessid=({$PHPSESSID})&amp;delid=({$value.biz_todo_id})&amp;target_id=({$target_id})"><img src="./skin/default/img/biz/delete_2.gif" alt="削除" /></a>
</td>
</tr>
({/if})
({/foreach})

({foreach key=i item=value from=$checkedlist})
({if $value.memo})
<tr class="checked ({if $value.priority == 1})priHigh({elseif $value.priority == 2})priMiddle({else})priLow({/if})({if $value.writer_id != $target_id}) someone({/if})">
<td class="state">
<p><a href="({t_url m=biz a=do_`$cmd`_home_check_biz_todo})&amp;sessid=({$PHPSESSID})&amp;chid=({$value.biz_todo_id})&amp;is_check=({$value.is_check})&amp;target_c_member_id=({$target_id})"><img src="./skin/default/img/biz/checkbox_checked_({if !$value.member_id == 0})share_({/if})2.gif" alt="" /></a></p>
</td>
<td class="text">({strip})
({$value.memo|nl2br|t_url2a})
({if ($value.writer_id != $target_id) || ($value.c_member_id == 0)})
（<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$value.writer_id})">({$value.writer_name})</a>）
({/if})
({/strip})</td>
<td class="operation">
<a href="({t_url m=biz a=page_fh_home_edit_biz_todo})&amp;id=({$value.biz_todo_id})&amp;target_id=({$target_id})"><img src="./skin/default/img/biz/edit_2.gif" alt="編集" /></a>
<a href="({t_url m=biz a=do_`$cmd`_home_delete_biz_todo})&amp;sessid=({$PHPSESSID})&amp;delid=({$value.biz_todo_id})&amp;target_id=({$target_id})"><img src="./skin/default/img/biz/delete_2.gif" alt="削除" /></a>
</td>
</tr>
({/if})
({/foreach})

</table>
({/if})

</div>
