({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
ﾒﾝﾊﾞｰﾘｽﾄ<br>
</td></tr></table>

<center>
({$pager.start})件～({$pager.end})件を表示<br>
</center>

<hr color="#b3ceef">
<table width="100%">
({foreach from=$c_member_list item=c_member})
<tr><td bgcolor="({cycle values="#`$ktai_color_config.bg_05`,#ffffff"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})(({$c_member.friend_count}))</a><br>
</td></tr>
({/foreach})
</table>
<hr color="#b3ceef">

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_c_member_list})&amp;target_c_commu_id=({$c_commu_id})&amp;page=({$page})&amp;direc=-1&amp;({$tail})" accesskey="4">%%i128%%前を表示</a> ({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_member_list})&amp;target_c_commu_id=({$c_commu_id})&amp;page=({$page})&amp;direc=1&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})
<hr color="#({$ktai_color_config.border_01})">
%%i90%%<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
