({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({if $keyword})日記検索結果({else})最新日記({/if})</a></font><br>
</td></tr></table>
<center>
({if $keyword})
「({$keyword})」の検索結果
({/if})
<font color="#999966">(({$c_diary_search_list_count|default:"0"})件)</font><br>
</center>
<table width="100%">
<tr><td>
<hr color="#b3ceef">
</td></tr>

({foreach from=$new_diary_list item=item})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
({$item.r_datetime|date_format:"%Y/%m/%d %H:%M"})<br>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;({$tail})">({$item.subject|t_truncate:28:""})(({$item.num_comment}))</a>(({$item.c_member.nickname|t_truncate:17:""}))<br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>
({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;keyword=({$keyword|to_sjis|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=-1&amp;({$tail})" accesskey="4">&#xE6E5;前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;keyword=({$keyword|to_sjis|escape:url|smarty:nodefaults})&amp;page=({$page})&amp;direc=1&amp;({$tail})" accesskey="6">&#xE6E7;次を表示</a>({/if})
<br>
</center>
({/if})
<table width="100%">
<tr><td bgcolor="#dddddd" align="center">
日記検索<br>
</td></tr></table>
({t_form _method=get m=ktai a=page_h_diary_list_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#999966">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="keyword" value="({$keyword})">
<center>
<input type="submit" value="検索">
</center>
</form>

<hr color="#0d6ddf">
({if $keyword})<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;({$tail})">最新日記</a><br>({/if})

({$inc_ktai_footer|smarty:nodefaults})