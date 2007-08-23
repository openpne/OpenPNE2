({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">あしあと</a></font><br>
</td></tr>
</table>
あなたのページを訪れた人たちです。<br>
<hr color="#0d6ddf">
総ｱｸｾｽ数: ({$c_ashiato_num})ｱｸｾｽ
<hr color="#0d6ddf">
&#xE698;最近のあしあと<br>
<table width="100%">
({foreach from=$c_ashiato_list item=item})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
({$item.r_datetime|date_format:"%m/%d %H:%M"})
({if $item.nickname})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})&amp;({$tail})">({$item.nickname})</a>
({/if})
</td></tr>
({/foreach})
</table>

({$inc_ktai_footer|smarty:nodefaults})
