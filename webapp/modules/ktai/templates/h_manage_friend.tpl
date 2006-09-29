({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">({$WORD_MY_FRIEND_HALF})管理</font></center>
<hr>

({if $msg})
({foreach from=$msg item=item})
<font color="red">({$item})</font></br>
<br>
({/foreach})
({/if})

({foreach from=$friend_list item=friend})
<!--*VV matrix_L VV*-->
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">({$friend.nickname})</a><br>
<a href="({t_url m=ktai a=page_f_intro_edit})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">→紹介文を書く</a><br>
<a href="({t_url m=ktai a=page_fh_intro})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">→紹介文を見る</a><br>
<a href="({t_url m=ktai a=do_fh_friend_list_delete_c_friend})&amp;target_c_member_id=({$friend.c_member_id})&amp;({$tail})">→({$WORD_MY_FRIEND_HALF})からはずす</a><br>

<br>
({/foreach})

({if $is_prev || $is_next})
<br>
({if $is_prev})<a href="({t_url m=ktai a=page_h_manage_friend})&amp;page=({$page-1})&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_manage_friend})&amp;page=({$page+1})&amp;({$tail})">次へ</a>({/if})

({/if})

({$inc_ktai_footer|smarty:nodefaults})