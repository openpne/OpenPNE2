({$inc_header|smarty:nodefaults})
({$inc_user_analysis_navi|smarty:nodefaults})
<br>

<b>登録日別（日次集計）</b>

<br><br>
({$date})
<table width="300" border="1" cellpadding="5" cellspacing="0">
({foreach from=$analysis_date_day key=key item=item})
<tr>
	<td width="100">({$key})</td>
	<td>({$item})人</td>
</tr>
({/foreach})
<tr>
	<td width="100">合計</td>
	<td>({$analysis_date_day_sum})人</td>
</tr>
</table>
({$inc_footer|smarty:nodefaults})