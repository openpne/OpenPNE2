({$inc_header|smarty:nodefaults})
<br>

<h2>登録日別ユーザー表示（月次集計）</h2>

<br><br>
<table width="300" border="1" cellpadding="5" cellspacing="0">
<tr>
<th>
月
</th>
<th>
人数
</th>
</tr>
({foreach from=$analysis_date_month key=key item=item})
<tr>
	({if $key eq "合計"})
	<td width="100">({$key})</td>	
	({else})
	<td width="100"><a href="?m=admin&a=page_user_analysis_date_day&date=({$key})">({$key})</a></td>	
	({/if})
	<td>({$item})人</td>
</tr>
({/foreach})
<tr>
	<td width="100">合計</td>
	<td>({$analysis_date_month_sum})人</td>
</tr>
</table>
({$inc_footer|smarty:nodefaults})
