({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">あしあと</a></font><br>
</td></tr>
</table>
あなたのページを訪れた人たちです。<br>
<hr color="#({$ktai_color_config.border_01})">
総ｱｸｾｽ数: ({$c_ashiato_num})ｱｸｾｽ
<hr color="#({$ktai_color_config.border_01})">
[i:91]最近のあしあと<br>
<table width="100%">
({foreach from=$c_ashiato_list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$item.r_datetime|date_format:"%m/%d %H:%M"})
({if $item.nickname})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})&amp;({$tail})">({$item.nickname})</a><br>
({/if})
</td></tr>
({/foreach})
</table>

({$inc_ktai_footer|smarty:nodefaults})
