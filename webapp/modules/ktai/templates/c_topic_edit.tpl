({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾄﾋﾟｯｸの編集</font><br>
</td></tr></table>

({t_form m=ktai a=do_c_topic_edit_update_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_topic.c_commu_topic_id})">
<font color="#({$ktai_color_config.font_06})">ﾄﾋﾟｯｸ名：</font><br>
<input type="text" name="title" value="({$c_topic.name})"><br>
<br>
<font color="#({$ktai_color_config.font_06})">本文：</font><br>
<textarea name="body" rows="6">({$c_topic.body})</textarea><br>
<br>
<font color="#({$ktai_color_config.font_06})">写真：</font><br>
[i:68]<a href="({t_url m=ktai a=page_c_topic_edit_image})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;({$tail})">写真を編集する</a><br>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="ﾄﾋﾟｯｸを編集する"><br>
</center>
</form>

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ﾄﾋﾟｯｸの削除</a></font><br>
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

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;({$tail})">ﾄﾋﾟｯｸ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
