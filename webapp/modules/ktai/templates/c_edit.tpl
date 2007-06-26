({$inc_ktai_header|smarty:nodefaults})

<center>ｺﾐｭﾆﾃｨ編集</center>
<hr>
({t_form m=ktai a=do_c_edit_update_c_commu})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
ｶﾃｺﾞﾘ<br>
<select name="c_commu_category_id">
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $c_commu.c_commu_category_id==$item.c_commu_category_id}) selected="selected"({/if})>({$item.name})
({/foreach})
</select><br>
ｺﾐｭﾆﾃｨ名<br>
<input type="text" name="name" value="({$c_commu.name})"><br>
説明文<br>
<textarea name="info">({$c_commu.info})</textarea><br>
参加・公開<br>
<input type="radio" name="public_flag" value="public"({if $c_commu.public_flag=='public'}) checked({/if})>誰でも参加可能、掲示板は全員に公開<br>
<input type="radio" name="public_flag" value="auth_sns"({if $c_commu.public_flag=='auth_sns'}) checked({/if})>参加には管理者の承認が必要、掲示板は全員に公開<br>
<input type="radio" name="public_flag" value="auth_commu_member"({if $c_commu.public_flag=='auth_commu_member'}) checked({/if})>参加には管理者の承認が必要、掲示板はｺﾐｭﾆﾃｨﾒﾝﾊﾞｰにのみ公開<br>
トピック作成権限<br>
({html_radios name="topic_authority" options=$topic_authority_list class="no_bg" selected=$c_commu.topic_authority separator="<br>"})
<input type="submit" value="編集">
</form>

({if !$is_sub_admin})
<hr>
({if $is_topic})
ｺﾐｭﾆﾃｨを削除するには、ﾄﾋﾟｯｸをすべて削除する必要があります。<br>
ﾄﾋﾟｯｸがある場合は、それらを削除した後、このﾍﾟｰｼﾞに再度ｱｸｾｽしてください。<br>
(削除ボタンが表示されます)<br>
<br>
削除の際はﾄﾗﾌﾞﾙ等を避けるため、あらかじめ参加者へ削除を告知してください。<br>
({else})
このｺﾐｭﾆﾃｨを削除します。削除の際はﾄﾗﾌﾞﾙ等を避けるため、あらかじめ参加者へ削除を告知してください。<br>
({t_form m=ktai a=page_c_edit_delete_c_commu_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<input type="submit" value="ｺﾐｭﾆﾃｨ削除">
</form>
({/if})

({/if})

<hr>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟに戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})