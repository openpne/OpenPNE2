({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$WORD_MY_FRIEND_HALF})管理</a></font><br>
</td></tr></table>

({if !$friend_list})
({$WORD_MY_FRIEND_HALF})がいません。
({else})
<center>
({$pager.start})～({$pager.end})件目を表示
</center>
({if $msg})
({foreach from=$msg item=item})
<font color="#({$ktai_color_config.font_09})">({$item})</font></br>
<br>
({/foreach})
({/if})

<table width="100%">
({foreach from=$friend_list item=friend})
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">({$WORD_NICKNAME_HALF})：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">({$friend.nickname})</a><br>
<br>
({if $friend.intro})
<font color="#({$ktai_color_config.font_06})">紹介文：</font><br>
({$friend.intro|nl2br})
<br>
[<a href="({t_url m=ktai a=page_f_intro_edit})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">編集</a>][<a href="({t_url m=ktai a=do_f_intro_delete})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">削除</a>]<br>
<br>
({else})
<a href="({t_url m=ktai a=page_f_intro_edit})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">紹介文を書く</a><br>
({/if})
<a href="({t_url m=ktai a=page_fh_friend_list_delete_c_friend_confilm})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})から外す</a><br>
({if $friend.is_display_friend_home})
<a href="({t_url m=ktai a=do_h_friend_update_is_display_friend_home page=$page})&amp;target_c_member_id=({$friend.c_member_id})&amp;target_is_display_friend_home=0&amp;({$tail})">({$WORD_MY_FRIEND_HALRF})最新書き込みを表示しない</a><br>
({else})
<a href="({t_url m=ktai a=do_h_friend_update_is_display_friend_home page=$page})&amp;target_c_member_id=({$friend.c_member_id})&amp;target_is_display_friend_home=1&amp;({$tail})">({$WORD_MY_FRIEND_HALRF})最新書き込みを表示する</a><br>
({/if})
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<hr color="#({$ktai_color_config.border_02})">
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_manage_friend})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_manage_friend})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
({/if})
<hr color="#({$ktai_color_config.border_01})">
[i:140]<a href="({t_url m=ktai a=page_fh_friend_list})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})ﾘｽﾄ</a><br>
({$inc_ktai_footer|smarty:nodefaults})
