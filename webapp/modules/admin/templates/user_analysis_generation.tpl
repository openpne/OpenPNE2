({$inc_header|smarty:nodefaults})
<br>

<h2>世代別ユーザー表示</h2>

<br><br>
<table width="300" border="1" cellpadding="5" cellspacing="0">
<tr>
<th>
年齢
</th>
<th>
人数
</th>
</tr>
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