({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾄﾋﾟｯｸの作成</font><br>
</td></tr></table>

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br><br>
({/if})

({t_form m=ktai a=do_c_topic_add_insert_c_commu_topic})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<font color="#({$ktai_color_config.font_06})">ﾄﾋﾟｯｸ名：</font><br>
<input type="text" name="title" value=""><br>
<br>
<font color="#({$ktai_color_config.font_06})">本文：</font><br>
<textarea name="body" rows="6"></textarea><br>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="ﾄﾋﾟｯｸを作成する">
</center>
</form>
({$inc_ktai_footer|smarty:nodefaults})
