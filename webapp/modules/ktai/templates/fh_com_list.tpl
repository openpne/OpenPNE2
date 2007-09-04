({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">({$target_c_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
参加ｺﾐｭﾆﾃｨﾘｽﾄ(({$count_commus|default:0}))<br>
</td></tr></table>

<center>
({$pager.start})件～({$pager.end})件を表示<br>
</center>

<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$c_commu_list item=c_commu})
<tr><td bgcolor="({cycle values="#`$ktai_color_config.bg_05`,#`$ktai_color_config.bg_08`"})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$c_commu.name|t_truncate:50:""})</a>(({$c_commu.count_members}))<br>
</td></tr>
<tr><td>
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>
({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_fh_com_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_com_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})

({if $INC_NAVI_type=="f"})
<hr color="#({$ktai_color_config.border_01})">
%%i90%%<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
