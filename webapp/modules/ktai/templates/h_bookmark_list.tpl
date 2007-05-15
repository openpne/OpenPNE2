({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">お気に入り</font></center>
<hr>

({if $c_members_num==0})
お気に入り登録はありません。
({else})

(({$c_members_num})件)<br>
<br>
({foreach from=$c_members item=c_member})

<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a>
&nbsp;
<a href="({t_url m=ktai a=do_f_bookmark_delete_delete_c_bookmark})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">削除</a>
<br>

({/foreach})

({if $is_prev || $is_next})
<br>
({if $is_prev})<a href="({t_url m=ktai a=page_h_bookmark_list})&amp;page=({$page-1})&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_bookmark_list})&amp;page=({$page+1})&amp;({$tail})">次へ</a>({/if})
({/if})

({/if})

<hr>

({$inc_ktai_footer|smarty:nodefaults})
