({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_COMMUNITY_HALF})に参加</font><br>
</td></tr></table>

({$WORD_COMMUNITY_HALF})管理者への参加希望ﾒｯｾｰｼﾞを送信し、承諾を受けてください。<br>
({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
({/if})
({t_form m=ktai a=do_c_join_request_insert_c_commu_member_confirm})
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
<textarea name="body" rows="6"></textarea><br>
<center>
<input type="submit" value="参加を希望する">
</center>
</form>
<hr　color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$target_c_commu_id})&amp;({$tail})">({$c_commu.name})ﾄｯﾌﾟ</a><br>
({$inc_ktai_footer|smarty:nodefaults})