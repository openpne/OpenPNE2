({$inc_ktai_header|smarty:nodefaults})
<center><font color="orange">Todo登録</font></center>
<hr>

({if $msg})
<a name="comment"><font color="red">({$msg})</font></a><br>
<br>
({/if})

({t_form m=ktai_biz a=do_fh_biz_todo_add})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})">

Todo：<input type="text" name='value' size="30"><br>

目標期日：<br>
<input type="text" name='due_datetime_y' size="2" value="({$now.year})" istyle="4" mode="numeric">年
<input type="text" name='due_datetime_m' size="2" value="({$now.month})" istyle="4" mode="numeric">月
<input type="text" name='due_datetime_d' size="2" value="({$now.day})" istyle="4" mode="numeric">日<br>

<center>
<input type='submit' value='登録する'>
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
