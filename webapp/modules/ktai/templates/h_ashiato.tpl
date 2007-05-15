({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">あしあと</font></center>
<hr>

あなたのページを訪れた人たちです。<br>
<br>
総ｱｸｾｽ数: ({$c_ashiato_num})ｱｸｾｽ<br>

({foreach from=$c_ashiato_list item=item})
({$item.r_datetime|date_format:"%m/%d %H:%M"})
({if $item.nickname})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})&amp;({$tail})">({$item.nickname})</a>
({/if})
<br>
({/foreach})

<hr>

({$inc_ktai_footer|smarty:nodefaults})