({$inc_header|smarty:nodefaults})
({$inc_user_analysis_navi|smarty:nodefaults})
<br>

<b>世代別</b>

<br><br>
<table width="300" border="1" cellpadding="5" cellspacing="0">
({foreach from=$analysis_generation key=key item=item})
<tr>
	<td width="100">({$key})</td>
	<td>({$item})人</td>
</tr>
({/foreach})
<tr>
	<td width="100">合計</td>
	<td>({$analysis_generation_sum})人</td>
</tr>
</table>
({$inc_footer|smarty:nodefaults})