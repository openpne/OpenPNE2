({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$target_member.nickname})({if $type=="f"})さん({/if})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
({if $type=="f"})({$WORD_FRIEND_HALF})({else})({$WORD_MY_FRIEND_HALF})({/if})からの紹介文<br>
</td></tr></table>

<center>
({$pager_index.displaying_first})件～({$pager_index.displaying_last})件を表示
</center>

<table width="100%">
({foreach from=$intro_list item=item})
<tr><td>
<hr color="#b3ceef">
</td></tr>
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<font color="#999966">ﾆｯｸﾈｰﾑ：</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.nickname})</a><br><br>
<font color="#999966">紹介文：</font><br>
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
</td></tr>
({foreachelse})
<tr><td>
<hr color="#b3ceef">
</td></tr>
<tr><td>
紹介文はありません
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<hr color="#b3ceef">
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_fh_intro})&amp;target_c_member_id=({$requests.target_c_member_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_intro})&amp;target_c_member_id=({$requests.target_c_member_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})

<hr color="#0d6ddf">
({if $type=="f"})
%%i117%%<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})&amp;({$tail})">({$target_member.nickname})さんのﾄｯﾌﾟ</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
