({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">副管理者要請</font><br>
</td></tr></table>

({$member.nickname})さんに副管理者要請ﾒｯｾｰｼﾞを送信します。
<hr color="#({$ktai_color_config.border_01})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>({/if})
<font color="#({$ktai_color_config.font_06})">宛先：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})&amp;({$tail})">({$member.nickname})</a><br>
<br>
({t_form m=ktai a=do_c_edit_member_insert_c_commu_sub_admin_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$member.c_member_id})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
<textarea name="body" rows="6"></textarea>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="送信">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})ﾄｯﾌﾟ</a><br>
({$inc_ktai_footer|smarty:nodefaults})
