({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">Todo編集</a></font><br>
</td></tr></table>
<br>
({if $msg})
<a name="comment"><font color="#({$ktai_color_config.font_09})">({$msg})</font></a><br>
<br>
({/if})
({t_form m=ktai_biz a=do_fh_biz_todo_edit})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})">
<input type="hidden" name="target_biz_todo_id" value="({$target_biz_todo_id})">
<font color="#({$ktai_color_config.font_06})">Todo：</font><br>
<input type="text" name='value' value="({$todo.memo})"><br>
<br>
<font color="#({$ktai_color_config.font_06})">目標期日：</font><br>
<input type="text" name='due_datetime_y' size="4" value="({if $todo.due_datetime})({$todo.due_datetime|date_format:'%Y'})({/if})" istyle="4" mode="numeric">年
<input type="text" name='due_datetime_m' size="2" value="({if $todo.due_datetime})({$todo.due_datetime|date_format:'%m'})({/if})" istyle="4" mode="numeric">月
<input type="text" name='due_datetime_d' size="2" value="({if $todo.due_datetime})({$todo.due_datetime|date_format:'%d'})({/if})" istyle="4" mode="numeric">日<br>
<br>
<center>
<input type='submit' value='登録する'>
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai_biz a=page_fh_biz_todo_list})&amp;({$tail})">Todoﾘｽﾄ</a><br>
({$inc_ktai_footer|smarty:nodefaults})
