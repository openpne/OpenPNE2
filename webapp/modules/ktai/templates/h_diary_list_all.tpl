({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">({if $keyword})日記検索結果({else})最新日記({/if})</font></center>
<hr>

({if $keyword})
「<font color="orange">({$keyword})</font>」の検索結果(({$c_diary_search_list_count|default:"0"}))<br>
<br>
({/if})

({foreach from=$new_diary_list item=item})
({$item.r_datetime|date_format:"%m/%d"})(({$item.c_member.nickname}))<br>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;({$tail})">({$item.subject|t_truncate:36:".."})</a>(({$item.comment_count}))<br>
({/foreach})
<br>

({if $is_prev || $is_next})
({if $is_prev})
<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;keyword=({$keyword|to_sjis|escape:"url"})&amp;page=({$page})&amp;direc=-1&amp;({$tail})">前へ</a>&nbsp;
({/if})
({if $is_next})
<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;keyword=({$keyword|to_sjis|escape:"url"})&amp;page=({$page})&amp;direc=1&amp;({$tail})">次へ</a>
({/if})
<br>
({/if})

({if $c_diary_search_list_count})
({$pager.start})件～({$pager.end})件を表示<br>
<br>
({/if})

({t_form _method=get m=ktai a=page_h_diary_list_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="text" name="keyword" value="({$keyword})">
<input type="submit" value="検索">
</form>

<hr>
({if $keyword})<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;({$tail})">最新日記</a><br>({/if})

({$inc_ktai_footer|smarty:nodefaults})