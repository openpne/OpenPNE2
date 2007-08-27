({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
ﾄﾋﾟｯｸの編集<br>
</td></tr></table>

({t_form m=ktai a=do_c_topic_edit_update_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<font color="#({$ktai_color_config.font_02})">ﾄﾋﾟｯｸ名：</font><br>
<input type="text" name="title" value="({$c_topic.name})"><br>
<br>
<font color="#({$ktai_color_config.font_02})">本文：</font><br>
<textarea name="body" rows="6">({$c_topic.body})</textarea><br>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="ﾄﾋﾟｯｸを編集する">
</center>
</form>

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">ﾄﾋﾟｯｸの削除</a></font><br>
</td></tr></table>
このﾄﾋﾟｯｸと書き込みを削除します。
<hr color="#({$ktai_color_config.border_01})">
({t_form m=ktai a=page_c_topic_delete_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<center>
<input type="submit" value="ﾄﾋﾟｯｸを削除する">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
