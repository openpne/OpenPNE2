({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">承認待ちﾘｽﾄ</a></font><br>
</td></tr></table>
({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<hr color="#({$ktai_color_config.border_01})">
({/if})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_anatani_c_friend_confirm_list})&amp;({$tail})">({$WORD_FRIEND_HALF})ﾘﾝｸ承認待ち</a>(({$num_from_f_confirm_list|default:'0'}))<br>
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_anatani_c_commu_member_confirm_list})&amp;({$tail})">({$WORD_COMMUNITY_HALF})参加承認待ち</a>(({$num_from_h_confirm_list|default:'0'}))<br>
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_anatani_c_commu_admin_confirm_list})&amp;({$tail})">({$WORD_COMMUNITY_HALF})管理者交代承認待ち</a>(({$num_from_c_commu_admin_confirm_list|default:'0'}))<br>
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_anatani_c_commu_sub_admin_confirm_list})&amp;({$tail})">({$WORD_COMMUNITY_HALF})副管理者承認待ち</a>(({$num_from_c_commu_sub_admin_confirm_list|default:'0'}))<br><br>
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_anataga_c_friend_confirm_list})&amp;({$tail})">({$WORD_FRIEND_HALF})ﾘﾝｸ要請中</a>(({$num_to_f_confirm_list|default:'0'}))<br>
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_anataga_c_commu_member_confirm_list})&amp;({$tail})">({$WORD_COMMUNITY_HALF})参加要請中</a>(({$num_to_h_confirm_list|default:'0'}))<br>
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_anataga_c_commu_admin_confirm_list})&amp;({$tail})">({$WORD_COMMUNITY_HALF})管理者交代要請中</a>(({$num_to_c_commu_admin_confirm_list|default:'0'}))<br>
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_anataga_c_commu_sub_admin_confirm_list})&amp;({$tail})">({$WORD_COMMUNITY_HALF})副管理者要請中</a>(({$num_to_c_commu_sub_admin_confirm_list|default:'0'}))<br>

({$inc_ktai_footer|smarty:nodefaults})
