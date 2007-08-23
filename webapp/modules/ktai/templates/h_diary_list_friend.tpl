({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">
({$WORD_FRIEND_HALF})最新日記</a></font><br>
</td></tr></table>
<center>
({$pager.start})件～({$pager.end})件を表示<br>
</center>
<hr color="#b3ceef">
<table width="100%">
({foreach from=$h_diary_list_friend item=each_diary})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
({$each_diary.r_datetime|date_format:"%Y/%m/%d %H:%M"})<br>({$each_diary.c_member.nickname|t_truncate:17:""})<br>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$each_diary.c_diary_id})&amp;({$tail})">({$each_diary.subject|t_truncate:28:""})(({$each_diary.count_comments}))</a>
({$each_diary.c_member.nickname|t_truncate:17:""})<br>
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>
({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_diary_list_friend})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_diary_list_friend})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})
({$inc_ktai_footer|smarty:nodefaults})