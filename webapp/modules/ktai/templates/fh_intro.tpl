({$inc_ktai_header|smarty:nodefaults})
<center><font color="orange">({if $type=="f"})({$WORD_FRIEND_HALF})({else})({$WORD_MY_FRIEND_HALF})({/if})からの紹介文</font></center>
<hr>

({foreach from=$intro_list item=item})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.nickname})</a><br>
({$item.intro|t_url2a_ktai|nl2br})<br>

({if $target_member.c_member_id==$member.c_member_id})
({if !$item.has_intro_by_me})
<a href="({t_url m=ktai a=page_f_intro_edit})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">この({$WORD_FRIEND_HALF})を紹介する</a><br>
({/if})
({/if})

({if $item.c_member_id==$member.c_member_id})
<a href="({t_url m=ktai a=page_f_intro_edit})&amp;target_c_member_id=({$target_member.c_member_id})&amp;({$tail})">編集</a><br>
<a href="({t_url m=ktai a=do_f_intro_delete})&amp;target_c_member_id=({$target_member.c_member_id})&amp;({$tail})">削除</a><br>
({elseif $type=='h'})
<a href="({t_url m=ktai a=do_f_intro_from_delete})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">削除</a><br>
({/if})
<br>
({foreachelse})
紹介文はありません
({/foreach})

({if $is_prev || $is_next})
({if $is_prev})<a href="({t_url m=ktai a=page_fh_intro})&amp;target_c_member_id=({$requests.target_c_member_id})&amp;page=({$page-1})&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_intro})&amp;target_c_member_id=({$requests.target_c_member_id})&amp;page=({$page+1})&amp;({$tail})">次へ</a>({/if})
({/if})

<hr>
({if $type=="f"})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})&amp;({$tail})">({$target_member.nickname})さんのﾄｯﾌﾟ</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
