({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">紹介文の編集</font><br>
</td></tr></table>

({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</a><br>({/if})

<font color="#({$ktai_color_config.font_06})">紹介文：</font><br>
({t_form m=ktai a=do_f_intro_edit_update_c_friend})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$target_member.c_member_id})">
<textarea name="body" rows="6">({$intro_body})</textarea><br>
<center>
<input type="submit" value="紹介文を編集する">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
