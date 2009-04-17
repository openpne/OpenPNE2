({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_COMMUNITY_HALF})の編集</font><br>
</td></tr></table>

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})

({t_form m=ktai a=do_c_edit_update_c_commu})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<font color="#({$ktai_color_config.font_06})">({$WORD_COMMUNITY_HALF})名：</font><br>
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
<font color="#({$ktai_color_config.font_06})">参加条件：</font><br>
<input name="is_admit" type="radio" value="public"({if $c_commu.is_admit=='public'}) checked="checked"({/if})>誰でも参加可能<br>
<input name="is_admit" type="radio" value="auth"({if $c_commu.is_admit=='auth'}) checked="checked"({/if})>管理者の承認が必要<br>
<br>
<font color="#({$ktai_color_config.font_06})">公開範囲：</font><br>
<input name="is_open" type="radio" value="public"({if $c_commu.is_open=='public'}) checked="checked"({/if})>全員に公開<br>
<input name="is_open" type="radio" value="member"({if $c_commu.is_open=='member'}) checked="checked"({/if})>({$WORD_COMMUNITY_HALF})ﾒﾝﾊﾞｰにのみ公開<br>
<br>
<font color="#({$ktai_color_config.font_06})">ﾄﾋﾟｯｸ作成の権限：</font><br>
<input name="is_topic" type="radio" value="member"({if $c_commu.is_topic=='member'}) checked="checked"({/if})>({$WORD_COMMUNITY_HALF})参加者が作成可能<br>
<input name="is_topic" type="radio" value="admin_only"({if $c_commu.is_topic=='admin_only'}) checked="checked"({/if})>管理者のみ作成可能<br>
<input name="is_topic" type="radio" value="public"({if $c_commu.is_topic=='public'}) checked="checked"({/if})>誰でも作成可能<br>
<br>
<font color="#({$ktai_color_config.font_06})">ｺﾒﾝﾄ作成権限：</font><br>
<input name="is_comment" type="radio" value="member"({if $c_commu.is_comment=='member'}) checked="checked"({/if})>({$WORD_COMMUNITY_HALF})参加者のみ可能<br>
<input name="is_comment" type="radio" value="public"({if $c_commu.is_comment=='public'}) checked="checked"({/if})>誰でもｺﾒﾝﾄ可能<br>
<br>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="({$WORD_COMMUNITY_HALF})を編集する"><br>
</center>
</form>
<br>

({if !$is_sub_admin})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">({$WORD_COMMUNITY_HALF})の削除</font><br>
</td></tr></table>
({if $is_topic})
({$WORD_COMMUNITY_HALF})を削除するには、ﾄﾋﾟｯｸをすべて削除する必要があります。<br>
ﾄﾋﾟｯｸがある場合は、それらを削除した後、このﾍﾟｰｼﾞに再度ｱｸｾｽしてください。<br>
(削除ﾎﾞﾀﾝが表示されます)<br>
<br>
削除の際はﾄﾗﾌﾞﾙ等を避けるため、あらかじめ参加者へ削除を告知してください。<br>
({else})
この({$WORD_COMMUNITY_HALF})を削除します。削除の際はﾄﾗﾌﾞﾙ等を避けるため、あらかじめ参加者へ削除を告知してください。<br>
<center>
({t_form m=ktai a=page_c_edit_delete_c_commu_confirm})
<hr color="#({$ktai_color_config.border_01})">
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<input type="submit" value="({$WORD_COMMUNITY_HALF})を削除する">
</form>
</center>
({/if})

({/if})

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})ﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
