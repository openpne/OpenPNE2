({$inc_ktai_header|smarty:nodefaults})
<table width="100%">
<tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">承認待ちﾘｽﾄ</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_COMMUNITY_HALF})管理者交代承認待ち</font><br>
</td></tr></table>
({if !$anatani_c_commu_admin_confirm_list})
現在あなたに({$WORD_COMMUNITY_HALF})管理者交代を要請してるﾒﾝﾊﾞｰはいません。
({else})
<center>
({$pager.start})～({$pager.end})件目を表示<br>
</center>
<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$anatani_c_commu_admin_confirm_list item=item name=anatani_c_commu_admin_confirm_list_name})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">({$WORD_NICKNAME_HALF})：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_admin})&amp;({$tail})">({$item.nickname})</a><br>
<br>
<font color="#({$ktai_color_config.font_06})">({$WORD_COMMUNITY_HALF})名：</font><br>
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})&amp;({$tail})">({$item.c_commu_name})</a><br>
<br>
({if $item.message})
<font color="#({$ktai_color_config.font_06})">ﾒｯｾｰｼﾞ：</font><br>
({$item.message|nl2br})<br>
<br>
({/if})
<center>
[<a href="({t_url m=ktai a=do_h_confirm_list_update_c_commu_admin_confirm})&amp;target_c_commu_admin_confirm_id=({$item.c_commu_admin_confirm_id})&amp;({$tail})">承認</a>]
[<a href="({t_url m=ktai a=do_h_confirm_list_delete_c_commu_admin_confirm})&amp;target_c_commu_admin_confirm_id=({$item.c_commu_admin_confirm_id})&amp;({$tail})">拒否</a>]<br>
</center>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
({/if})

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_anatani_c_commu_admin_confirm_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_anatani_c_commu_admin_confirm_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
<hr color="#({$ktai_color_config.border_01})">

[i:90]<a href="({t_url m=ktai a=page_h_confirm_list})&amp;({$tail})">承認待ちﾘｽﾄ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
