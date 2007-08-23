({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ｺﾐｭﾆﾃｨ詳細<br>
</td></tr></table>
<br>
<font color="#999966">ｺﾐｭﾆﾃｨ名：</font><br>
({$c_commu.name})<br>
<br>
<font color="#999966">開設日：</font><br>
({$c_commu.r_datetime|date_format:"%Y年%m月%d日"})<br>
<br>
<font color="#999966">ｺﾐｭﾆﾃｨID：</font><br>
({$c_commu.c_commu_id})<br>
<br>
<font color="#999966">管理者：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu.c_member_id_admin})&amp;({$tail})">({$c_commu.c_member_admin.nickname})</a><br>
<br>
<font color="#999966">副管理者：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$sub_admin.c_member_id})&amp;({$tail})">({$sub_admin.nickname})</a><br>
<br>
<font color="#999966">ｶﾃｺﾞﾘ：</font><br>
({$c_commu.c_commu_category.name})<br>
<br>
<font color="#999966">ﾒﾝﾊﾞｰ数：</font><br>
({$c_commu.count_member})人<br>
<br>
<font color="#999966">参加条件と公開範囲：</font><br>
({if $c_commu.public_flag == 'public'})
だれでも参加できる(公開)
({elseif $c_commu.public_flag == 'auth_public'})
管理者の承認が必要(公開)
({elseif $c_commu.public_flag == 'auth_sns'})
管理者の承認が必要(公開)
({elseif $c_commu.public_flag == 'auth_commu_member'})
管理者の承認が必要(非公開)
({/if})<br>
<br>
<font color="#999966">ﾄﾋﾟｯｸ作成権限：</font><br>
({if $c_commu.topic_authority == 'public'})
ｺﾐｭﾆﾃｨ参加者全員が作成可能
({elseif $c_commu.topic_authority == 'admin_only'})
ｺﾐｭﾆﾃｨ管理者のみ作成可能
({/if})<br>
<br>
<font color="#999966">ｺﾐｭﾆﾃｨの説明：</font><br>
({$c_commu.info|t_url2a_ktai})<br>
<br>
<hr color="#0d6ddf">
&#xE6DA;<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨに戻る</a><br>
({if $c_commu.c_member_id_admin == $u})
&#xE718;<a href="({t_url m=ktai a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨ設定を変更する</a><br>
({/if})
({$inc_ktai_footer|smarty:nodefaults})
