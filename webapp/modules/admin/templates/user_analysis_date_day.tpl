({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;セキュリティ管理：ページ名ランダム生成</div>
</div>

({*ここまで:navi*})

<h2>登録日別ユーザー数表示（日次集計）</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<h3 class="item">({$date})</h3>
<table class="basicType2">
<thead>
({****})
<tr>
<th>
日
</th>
<th>
人数
</th>
</tr>
({****})
</thead>
<tbody>
({****})
({foreach from=$analysis_date_day key=key item=item})
<tr>
	<th>({$key})</th>
	<td>({$item})人</td>
</tr>
({/foreach})
({****})
</tbody>
<tfoot>
({****})
<tr>
	<th width="100">合計</th>
	<td>({$analysis_date_day_sum})人</td>
</tr>
({****})
</tfoot>
</table>

</div>
({$inc_footer|smarty:nodefaults})
