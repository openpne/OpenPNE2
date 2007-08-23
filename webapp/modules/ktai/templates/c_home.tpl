({$inc_ktai_header|smarty:nodefaults})
({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee">({$c_commu.name})</font><br>
</td></tr>
({if $inc_ktai_entry_point[2]})
<tr><td>
({$inc_ktai_entry_point[2]|smarty:nodefaults})
</td></tr>
({/if})
</table>
({if $inc_ktai_entry_point[3]})
({$inc_ktai_entry_point[3]|smarty:nodefaults})
({/if})
({if $c_siteadmin})
({$c_siteadmin|smarty:nodefaults})<br>
<hr>
({/if})
<br>
<table width="100%" bgcolor="#eeeeff">
<tr><td align="center" width="50%" valign="top">
<img src="({t_img_url filename=$c_commu.image_filename w=120 h=120 noimg=no_logo_small})" alt="({$c_commu.name})"><br>
</td>
<td valign="top">
%%i115%%({$c_commu.c_commu_id})<br>
<font color="#999966">開設日：</font><br>
({$c_commu.r_datetime|date_format:"%Y年%m月%d日"})<br>
<font color="#999966">管理者:</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu.c_member_id_admin})&amp;({$tail})">({$c_commu.c_member_admin.nickname})</a><br>
<font color="#999966">ｶﾃｺﾞﾘ名:</font><br>
({$c_commu.c_commu_category.name})<br>
</td>
</tr>
<tr>
<td colspan="2">
<font color="#999966">ｺﾐｭﾆﾃｨの説明：</font><br>
({$c_commu.info|t_url2a_ktai|t_truncate:108:""})<br>
</td></tr>
<tr><td align="right" colspan="2">
<font color="#0c5f0f">⇒</font><a href="({t_url m=ktai a=page_c_commu_info_detail})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
</td></tr></table>


<table width="100%" bgcolor="#e0eaef">
<tr><td>
<hr color="#0d6ddf">
({if !$relation_c_member_and_c_commu.join && !$relation_c_member_and_c_commu.wait})
%%i1028%%<a href="({t_url m=ktai a=do_inc_join_c_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨに参加</a><br>
({/if})
({if ($c_commu.c_member_id_admin==$u || $c_commu.c_member_id_sub_admin==$u)})
%%i1014%%<a href="({t_url m=ktai a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨ編集</a><br>
({/if})
({if $relation_c_member_and_c_commu.join})
({if !($c_commu.c_member_id_admin==$u || $c_commu.c_member_id_sub_admin==$u)})
%%i138%%<a href="({t_url m=ktai a=do_inc_leave_c_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨから退会</a><br>
({/if})
({if !($is_unused_pc_bbs && $is_unused_ktai_bbs)})
%%i105%%<a href="#setting">ﾒｰﾙ受信設定</a><br>
({/if})
({/if})
%%i150%%<a href="({t_url m=ktai a=page_c_invite})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})に紹介</a><br>
<br>
</td></tr></table>

<table width="100%">
<tr><td bgcolor="#7ddadf">
<a accesskey="1" name="a1" href="#a1">%%i125%%</a>新着ﾄﾋﾟｯｸﾘｽﾄ<br>
</td></tr>
({if $is_c_commu_view})
({foreach from=$new_topic_comment item=item})
<tr><td bgcolor="#e0eaef">
<font color="#999966">[({$item.r_datetime|date_format:"%m/%d"})]</font> <a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name|t_truncate:22:""})(({$item.count_comments}))</a><br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
<tr><td align="right">
({if $new_topic_comment})
<font color="#0c5f0f">⇒</font><a href="({t_url m=ktai a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
({/if})
<a href="({t_url m=ktai a=page_c_topic_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ﾄﾋﾟｯｸの作成</a><br>
</td></tr>
({/if})
</table>
<br>

<table width="100%">
<tr><td bgcolor="#c49fff">
<a accesskey="2" name="a2" href="#a2">%%i126%%</a>新着ｲﾍﾞﾝﾄﾘｽﾄ<br>
</td></tr>
({if $is_c_commu_view})
({foreach from=$new_topic_comment_event item=item})
<tr><td bgcolor="#dcd1ef">
<font color="#999966">[({$item.r_datetime|date_format:"%m/%d"})]</font> <a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name|t_truncate:22:""})(({$item.count_comments}))</a><br>
</td></tr>
<tr><td>
<hr color="#bfa4ef">
</td></tr>
({/foreach})
<tr><td align="right">
({if $new_topic_comment_event})
<font color="#0c5f0f">⇒</font><a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
({/if})
<a href="({t_url m=ktai a=page_c_event_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｲﾍﾞﾝﾄの作成</a><br>
</td></tr>
</table>
({/if})
<br>
<table width="100%">
<tr><td bgcolor="#dddddd" align="center">
ﾄﾋﾟｯｸ検索<br>
</td></tr>
<tr><td>
({t_form _method=get m=ktai a=page_c_com_topic_find})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="keyword" value="({$search_word})">
<br>
<select name="target_commu">
<option value="in_commu">ｺﾐｭﾆﾃｨ内
<option value="all">全てのｺﾐｭﾆﾃｨ
</select>
<input type="hidden" name="c_commu_id" value="({$c_commu.c_commu_id})">
<br>
<input type="submit" value="検索">
</form>
</td></tr></table>
<br>

<table width="100%">
<tr><td bgcolor="#7ddadf">
<a accesskey="3" name="a3" href="#a3">%%i127%%</a>ｺﾐｭﾆﾃｨﾒﾝﾊﾞｰ<br>
</td></tr>
({foreach from=$c_commu_member_list item=c_commu_member})
<tr><td bgcolor="#e0eaef">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu_member.c_member_id})&amp;({$tail})">({$c_commu_member.nickname})</a><br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
<tr><td align="right">
<font color="#0c5f0f">⇒</font><a href="({t_url m=ktai a=page_c_member_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
({if ($c_commu.c_member_id_admin==$u || $c_commu.c_member_id_sub_admin==$u)})
<font color="#0c5f0f">⇒</font><a href="({t_url m=ktai a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ﾒﾝﾊﾞｰ管理</a><br>
({/if})
</td></tr>
</table>

({$inc_ktai_footer|smarty:nodefaults})
