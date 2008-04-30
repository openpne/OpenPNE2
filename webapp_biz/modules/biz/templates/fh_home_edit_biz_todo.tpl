<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>Todo編集</h3></div>

({t_form_block m=biz a=do_`$cmd`_home_edit_biz_todo})
<input type="hidden" name="target_id" value="({$target_id})" />
<input type="hidden" name="nickname" value="({$nickname})" />
<input name="id" type="hidden" value="({$todo.biz_todo_id})" />
<input name="writer_id" type="hidden" value="({$todo.writer_id})" />
<input name="writer_name" type="hidden" value="({$todo.writer_name})" />
<input name="sort_order" type="hidden" value="({$todo.sort_order})" />
<input name="member_id" type="hidden" value="({$todo.c_member_id})" />

<table>
<tr>
<th>Todo</th><td><textarea class="text" name='memo' cols="50" rows="5">({$todo.memo})</textarea><br /><input type="checkbox" name="is_done" value="1"({if $todo.is_check}) checked="checked"({/if}) />このTodoを完了済みにする<br /></td>
</tr><tr>
<th>目標期日</th>
<td>
<select name="due_year">
<option>--</option>
({foreach from=$year_list item=item})
<option value="({$item})"({if $item==$todo_date.0}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select>年
<select name="due_month">
<option>--</option>
({foreach from=$month_list item=item})
<option value="({$item})"({if $item==$todo_date.1}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select>月
<select name="due_day">
<option>--</option>
({foreach from=$day_list item=item})
<option value="({$item})"({if $item==$todo_date.2}) selected="selected"({/if})>({$item})</option>
({/foreach})
</select>日
</td>
</tr><tr>
<th>重要度</th>
<td>
<select name="priority">
<option value="1"({if $todo.priority == 1}) selected="selected"({/if})>高</option>
<option value="2"({if $todo.priority == 2}) selected="selected"({/if})>中</option>
<option value="3"({if $todo.priority == 3}) selected="selected"({/if})>低</option>
</select>
</td>
</tr><tr>
<th>グループ</th>
<td>
<select name="biz_group_id">
<option value="0">指定なし</option>
({foreach from=$biz_group_list item=biz_group})
<option value="({$biz_group.biz_group_id})"({if $biz_group.biz_group_id == $todo.biz_group_id}) selected="selected"({/if})>({$biz_group.name})</option>
({/foreach})
</select>
</td>
</tr><tr>
<th>公開範囲</th>
<td>
<input type="radio" name="public_flag" value="public"({if $todo.public_flag == "public"}) checked="checked"({/if}) id="public_flag_public" /><label for="public_flag_public">全員に公開</label><br />
<input type="radio" name="public_flag" value="group"({if $todo.public_flag == "group"}) checked="checked"({/if}) id="public_flag_group" /><label for="public_flag_group">グループまで公開</label><br />
({if $is_h})
<input type="radio" name="public_flag" value="private"({if $todo.public_flag == "private"}) checked="checked"({/if}) id="public_flag_private" /><label for="public_flag_private">公開しない</label><br />
({/if})
<input type="checkbox" name="is_check" value="1"({if $todo.c_member_id == 0}) checked="checked"({/if}) />だれかがTodo<br />
</td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　編　集　" /></li>
</ul>
</div>
({/t_form_block})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
