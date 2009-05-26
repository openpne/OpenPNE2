({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_COMMUNITY_HALF})詳細</font><br>
</td></tr></table>
<br>
<font color="#({$ktai_color_config.font_06})">({$WORD_COMMUNITY_HALF})名：</font><br>
({$c_commu.name})<br>
<br>
<font color="#({$ktai_color_config.font_06})">開設日：</font><br>
({$c_commu.r_datetime|date_format:"%Y年%m月%d日"})<br>
<br>
<font color="#({$ktai_color_config.font_06})">({$WORD_COMMUNITY_HALF})ID：</font><br>
({$c_commu.c_commu_id})<br>
<br>
<font color="#({$ktai_color_config.font_06})">管理者：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu.c_member_id_admin})&amp;({$tail})">({$c_commu.c_member_admin.nickname})</a><br>
<br>
<font color="#({$ktai_color_config.font_06})">副管理者：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$sub_admin.c_member_id})&amp;({$tail})">({$sub_admin.nickname})</a><br>
<br>
<font color="#({$ktai_color_config.font_06})">ｶﾃｺﾞﾘ：</font><br>
({$c_commu.c_commu_category.name})<br>
<br>
<font color="#({$ktai_color_config.font_06})">ﾒﾝﾊﾞｰ数：</font><br>
({$c_commu.count_member})人<br>
<br>
<font color="#({$ktai_color_config.font_06})">参加条件：</font><br>
({if $c_commu.is_admit == 'public'})
誰でも参加可能
({elseif $c_commu.is_admit == 'auth'})
管理者の承認が必要
({/if})<br>
<br>
<font color="#({$ktai_color_config.font_06})">公開範囲：</font><br>
({if $c_commu.is_open == 'public'})
全員に公開
({elseif $c_commu.is_open == 'member'})
({$WORD_COMMUNITY_HALF})ﾒﾝﾊﾞ-にのみ公開
({/if})<br>
<br>
<font color="#({$ktai_color_config.font_06})">ﾄﾋﾟｯｸ作成権限：</font><br>
({if $c_commu.is_topic == 'member'})
({$WORD_COMMUNITY_HALF})参加者全員が作成可能
({elseif $c_commu.is_topic == 'admin_only'})
({$WORD_COMMUNITY_HALF})管理者のみ作成可能
({elseif $c_commu.is_topic == 'public'})
誰でも作成可能
({/if})<br>
<br>
<font color="#({$ktai_color_config.font_06})">ｺﾒﾝﾄ作成権限：</font><br>
({if $c_commu.is_comment == 'member'})
({$WORD_COMMUNITY_HALF})参加者のみｺﾒﾝﾄ作成可能
({elseif $c_commu.is_comment == 'public'})
誰でもｺﾒﾝﾄ可能
({/if})<br>
<br>
<font color="#({$ktai_color_config.font_06})">({$WORD_COMMUNITY_HALF})の説明：</font><br>
({$c_commu.info|t_url2a_ktai|nl2br})<br>
<br>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})に戻る</a><br>
({if $c_commu.c_member_id_admin == $u})
[i:75]<a href="({t_url m=ktai a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})設定を変更する</a><br>
({/if})
({$inc_ktai_footer|smarty:nodefaults})
