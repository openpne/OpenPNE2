({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;セキュリティ管理：ページ名ランダム生成</div>
</div>

({*ここまで:navi*})

<h2>({$item_str}) 日次ページビュー集計</h2>
<div class="contents">
({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})


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
</div>
({$inc_footer|smarty:nodefaults})
