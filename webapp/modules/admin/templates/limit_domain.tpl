({$inc_header|smarty:nodefaults})

<h2>ドメイン制限</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_limit_domain','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<table>

<tr>
<th>ドメイン制限1</th>
<td><input name="LIMIT_DOMAIN1" type="text" class="text" value="({$smarty.const.LIMIT_DOMAIN1})" size="30"><br>
</td>
</tr>
<tr>
<th>ドメイン制限2</th>
<td><input name="LIMIT_DOMAIN2" type="text" class="text" value="({$smarty.const.LIMIT_DOMAIN2})" size="30"><br>
</td>
</tr>
<tr>
<th>ドメイン制限3</th>
<td><input name="LIMIT_DOMAIN3" type="text" class="text" value="({$smarty.const.LIMIT_DOMAIN3})" size="30"><br>
</td>
</tr>
<tr>
<th>ドメイン制限4</th>
<td><input name="LIMIT_DOMAIN4" type="text" class="text" value="({$smarty.const.LIMIT_DOMAIN4})" size="30"><br>
</td>
</tr>
<tr>
<th>ドメイン制限5</th>
<td><input name="LIMIT_DOMAIN5" type="text" class="text" value="({$smarty.const.LIMIT_DOMAIN5})" size="30"><br>
</td>
</tr>

<tr><td colspan="2" style="padding:0;background:#000"><img src="skin/dummy.gif" height="1"></td></tr>

<tr>
<th>&nbsp;</th>
<td><input type="submit" class="submit" value=" 更　新 "></td>
</tr>
</table>
</form>

({$inc_footer|smarty:nodefaults})
