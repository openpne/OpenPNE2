({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ｺﾐｭﾆﾃｨﾒﾝﾊﾞｰの編集</font></center>
<hr>
ﾒﾝﾊﾞｰ数：({$count_member|default:"0"})人<br>
({foreach from=$c_member_list item=item})
({$item.nickname})
({if $item.c_member_id == $u})☆({elseif $c_commu.c_member_id_admin != $item.c_member_id})<a href="({t_url m=ktai a=page_c_edit_member_delete_c_commu_member_confirm})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">削除</a>({/if})<br>
({/foreach})

({if $is_prev || $is_next})
<br>
({if $is_prev})<a href="({t_url m=ktai a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page})&amp;direc=-1&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page})&amp;direc=1&amp;({$tail})">次へ</a>({/if})
<br>
({/if})

({if count($c_member_list) > 1 && $c_commu.c_member_id_sub_admin != $u})
<hr>

◆管理者交代の要請
({t_form m=ktai a=do_c_edit_member_insert_c_commu_admin_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
ﾒﾝﾊﾞｰ<br>
<select name="target_c_member_id">
({foreach from=$c_member_list item=item})
({if $item.c_member_id != $u})
<option value="({$item.c_member_id})">({$item.nickname})
({/if})
({/foreach})
</select><br>
ﾒｯｾｰｼﾞ<br>
<textarea name="body"></textarea><br>
<input type="submit" value="送信">
</form>
<hr>

◆副管理者の要請
({t_form m=ktai a=do_c_edit_member_insert_c_commu_sub_admin_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
ﾒﾝﾊﾞｰ<br>
<select name="target_c_member_id">
({foreach from=$c_member_list item=item})
({if $item.c_member_id != $u && $item.c_member_id != $c_commu.c_member_id_sub_admin})
<option value="({$item.c_member_id})">({$item.nickname})
({/if})
({/foreach})
</select><br>
ﾒｯｾｰｼﾞ<br>
<textarea name="body"></textarea><br>
<input type="submit" value="送信">
</form>

({/if})

<hr>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})