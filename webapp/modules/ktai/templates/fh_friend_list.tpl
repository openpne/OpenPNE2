({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_c_member.nickname})({if $INC_NAVI_type=="f"})さん({/if})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({if $INC_NAVI_type=="h"})({$WORD_MY_FRIEND_HALF})({else})({$WORD_FRIEND_HALF})({/if})ﾘｽﾄ(({$total_num}))</font><br>
</td></tr></table>

({if !$target_friend_list})
({if $INC_NAVI_type=="h"})({$WORD_MY_FRIEND_HALF})({else})({$WORD_FRIEND_HALF})({/if})はいません。
({else})
<center>
({$pager.start})～({$pager.end})件目を表示<br>
</center>

<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$target_friend_list item=target_friend})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_friend.c_member_id})&amp;({$tail})">({$target_friend.nickname})</a>(({$target_friend.friend_count}))<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_fh_friend_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_friend_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
({/if})
<hr color="#({$ktai_color_config.border_01})">
({if $INC_NAVI_type=="f"})
[i:90]<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>
({else})
[i:140]<a href="({t_url m=ktai a=page_h_manage_friend})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})管理</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
