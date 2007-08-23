({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$target_c_member.nickname})({if $INC_NAVI_type=="f"})さん({/if})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
({$WORD_MY_FRIEND_HALF})ﾘｽﾄ(({$total_num}))<br>
</td></tr></table>

<center>
({$pager.start})～({$pager.end})件目を表示<br>
</center>

<hr color="#b3ceef">
<table width="100%">
({foreach from=$target_friend_list item=target_friend})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_friend.c_member_id})&amp;({$tail})">({$target_friend.nickname})</a>(({$target_friend.friend_count}))<br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_fh_friend_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_friend_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})
<hr color="#0d6ddf">
({if $INC_NAVI_type=="f"})
%%i117%%<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>
({else})
%%i170%%<a href="({t_url m=ktai a=page_h_manage_friend})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})管理</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
