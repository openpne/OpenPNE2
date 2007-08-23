({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$WORD_MY_FRIEND_HALF})管理</a></font><br>
</td></tr></table>

<center>
({$pager.start})～({$pager.end})件目を表示
</center>
({if $msg})
({foreach from=$msg item=item})
<font color="#ff0000">({$item})</font></br>
<br>
({/foreach})
({/if})

<table width="100%">
({foreach from=$friend_list item=friend})
<tr><td>
<hr color="#b3ceef">
</td></tr>
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<font color="#999966">ﾆｯｸﾈｰﾑ：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">({$friend.nickname})</a><br>
<br>
({if $friend.intro})
<font color="#999966">紹介文：</font><br>
({$friend.intro|nl2br})
<br>
[<a href="({t_url m=ktai a=page_f_intro_edit})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">編集</a>][<a href="({t_url m=ktai a=do_f_intro_delete})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">削除</a>]<br>
<br>
({else})
<a href="({t_url m=ktai a=page_f_intro_edit})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">紹介文を書く</a><br>
({/if})
<a href="({t_url m=ktai a=page_fh_friend_list_delete_c_friend_confilm})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})から外す</a><br>
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<hr color="#b3ceef">
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_manage_friend})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_manage_friend})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})
<hr color="#0d6ddf">
%%i140%%<a href="({t_url m=ktai a=page_fh_friend_list})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})ﾘｽﾄ</a><br>
({$inc_ktai_footer|smarty:nodefaults})
