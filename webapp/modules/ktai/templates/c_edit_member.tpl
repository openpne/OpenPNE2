({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_COMMUNITY_HALF})ﾒﾝﾊﾞｰ管理</font><br>
</td></tr></table>
<center>
({$pager.start})～({$pager.end})件目を表示
</center>
<hr color="#({$ktai_color_config.border_01})">

<table width="100%">
({foreach from=$c_member_list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">({$WORD_NICKNAME_HALF})：</font><br>
({$item.nickname})<br>
<br>
({if !$item.is_c_commu_admin && !$item.is_c_commu_sub_admin })
<a href="({t_url m=ktai a=page_c_edit_member_delete_c_commu_member_confirm})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})から退会させる</a><br>
({/if})
({if $c_commu.c_member_id_admin == $u})
({if $item.is_display_admin})
<a href="({t_url m=ktai a=page_c_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">管理権を渡す</a><br>
({/if})
({if $item.is_display_sub_admin})
<a href="({t_url m=ktai a=page_c_sub_admin_request})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">副管理者に任命</a><br>
({elseif $item.is_c_commu_sub_admin })
<a href="({t_url m=ktai a=page_c_edit_member_delete_c_sub_admin_confirm})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">副管理者から降格</a><br>
({/if})
({/if})
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})ﾄｯﾌﾟ</a><br>
</font>

({$inc_ktai_footer|smarty:nodefaults})
