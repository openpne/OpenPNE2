({$inc_header|smarty:nodefaults})

<h2>({$item_str}) 日次ページビュー集計</h2>
<br>

<table>
({foreach from=$access_analysis_day item=item})
<tr>

<td>
({$item.ymd|date_format:"%d日"})
</td>

<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_page')})&ymd=({$item.ymd})&month_flag=0&ktai_flag=({$ktai_flag})">({$item.count})</a>
</td>

</tr>
({/foreach})
</table>
({$inc_footer|smarty:nodefaults})
