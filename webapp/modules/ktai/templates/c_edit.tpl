({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
ｺﾐｭﾆﾃｨの編集<br>
</td></tr></table>

({t_form m=ktai a=do_c_edit_update_c_commu})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<font color="#({$ktai_color_config.font_06})">ｺﾐｭﾆﾃｨ名：</font><br>
<input type="text" name="name" value="({$c_commu.name})"><br>
<br>
<font color="#({$ktai_color_config.font_06})">ｶﾃｺﾞﾘ：</font><br>
<select name="c_commu_category_id">
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $c_commu.c_commu_category_id==$item.c_commu_category_id}) selected="selected"({/if})>({$item.name})
({/foreach})
</select><br>
<br>
<font color="#({$ktai_color_config.font_06})">説明文：</font><br>
<textarea name="info" rows="6">({$c_commu.info})</textarea><br>
<br>
<font color="#({$ktai_color_config.font_06})">写真：</font><br>
[i:68]<a href="({t_url m=ktai a=page_c_edit_image})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">写真を編集する</a><br>
<br>
<font color="#({$ktai_color_config.font_06})">参加条件と公開範囲：</font><br>
<select name="public_flag">
<option value="public"({if $c_commu.public_flag=='public'}) selected="selected"({/if})>誰でも参加可能、掲示板は全員に公開
<option value="auth_sns"({if $c_commu.public_flag=='auth_sns'}) selected="selected"({/if})>参加には管理者の承認が必要、掲示板は全員に公開
<option value="auth_commu_member"({if $c_commu.public_flag=='auth_commu_member'}) selected="selected"({/if})>参加には管理者の承認が必要、掲示板はｺﾐｭﾆﾃｨﾒﾝﾊﾞｰにのみ公開
</select><br>
<br>
<font color="#({$ktai_color_config.font_06})">ﾄﾋﾟｯｸ作成の権限：</font><br>
<select name="topic_authority">
<option value="public"({if $c_commu.topic_authority=='public'}) selected="selected"({/if})>({$topic_authority_list.public})
<option value="auth_sns"({if $c_commu.topic_authority=='admin_only'}) selected="selected"({/if})>({$topic_authority_list.admin_only})
</select>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="ｺﾐｭﾆﾃｨを編集する"><br>
</center>
</form>
<br>

({if !$is_sub_admin})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">ｺﾐｭﾆﾃｨの削除</font><br>
</td></tr></table>
({if $is_topic})
ｺﾐｭﾆﾃｨを削除するには、ﾄﾋﾟｯｸをすべて削除する必要があります。<br>
ﾄﾋﾟｯｸがある場合は、それらを削除した後、このﾍﾟｰｼﾞに再度ｱｸｾｽしてください。<br>
(削除ﾎﾞﾀﾝが表示されます)<br>
<br>
削除の際はﾄﾗﾌﾞﾙ等を避けるため、あらかじめ参加者へ削除を告知してください。<br>
({else})
このｺﾐｭﾆﾃｨを削除します。削除の際はﾄﾗﾌﾞﾙ等を避けるため、あらかじめ参加者へ削除を告知してください。<br>
<center>
({t_form m=ktai a=page_c_edit_delete_c_commu_confirm})
<hr color="#({$ktai_color_config.border_01})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<input type="submit" value="ｺﾐｭﾆﾃｨを削除する">
</form>
</center>
({/if})

({/if})

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
