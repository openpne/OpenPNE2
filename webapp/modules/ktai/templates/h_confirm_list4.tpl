({$inc_ktai_header|smarty:nodefaults})
<table width="100%">
<tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">承認待ちﾘｽﾄ</a></font><br>
</td></tr></table>

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
({/if})

<table width="100%">

<tr><td bgcolor="#({$ktai_color_config.bg_05})">
<font color="#({$ktai_color_config.color_25})">({$WORD_COMMUNITY_HALF})副管理者承認待ち</font><br>
</td></tr>

({if $anatani_c_commu_sub_admin_confirm_list})
({foreach from=$anatani_c_commu_sub_admin_confirm_list item=item})
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
({/if})
<center>
[<a href="({t_url m=ktai a=do_h_confirm_list_update_c_commu_sub_admin_confirm})&amp;target_c_commu_sub_admin_confirm_id=({$item.c_commu_sub_admin_confirm_id})&amp;({$tail})">承認</a>]
[<a href="({t_url m=ktai a=do_h_confirm_list_delete_c_commu_sub_admin_confirm})&amp;target_c_commu_sub_admin_confirm_id=({$item.c_commu_sub_admin_confirm_id})&amp;({$tail})">拒否</a>]<br>
</center>
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
({/if})
</table>
<br>

({$inc_ktai_footer|smarty:nodefaults})