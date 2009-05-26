({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$WORD_COMMUNITY_HALF})の作成</a></font><br>
</td></tr></table>

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})

({t_form m=ktai a=do_h_com_add_insert_c_commu})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">({$WORD_COMMUNITY_HALF})名：</font><br>
<input type="text" name="name" value=""><br>
<br>
<font color="#({$ktai_color_config.font_06})">ｶﾃｺﾞﾘ：</font><br>
<select name="c_commu_category_id">
({foreach from=$c_commu_category_list item=c_commu_category})
<option value="({$c_commu_category.c_commu_category_id})">({$c_commu_category.name})
({/foreach})
</select><br>
<br>
<font color="#({$ktai_color_config.font_06})">説明文：</font><br>
<textarea name="info" rows="6"></textarea><br>
<br>
<font color="#({$ktai_color_config.font_06})">参加条件：</font><br>
<input name="is_admit" type="radio" value="public" checked="checked">誰でも参加可能<br>
<input name="is_admit" type="radio" value="auth">管理者の承認が必要<br>
<br>
<font color="#({$ktai_color_config.font_06})">公開範囲：</font><br>
<input name="is_open" type="radio" value="public" checked="checked">全員に公開<br>
<input name="is_open" type="radio" value="member">({$WORD_COMMUNITY_HALF})ﾒﾝﾊﾞｰにのみ公開<br>
<br>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="({$WORD_COMMUNITY_HALF})を作成する">
</center>
</form>

({$inc_ktai_footer|smarty:nodefaults})
