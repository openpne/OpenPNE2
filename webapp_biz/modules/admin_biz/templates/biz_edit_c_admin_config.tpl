({$inc_header|smarty:nodefaults})

<h2>PNEBIZ基本設定</h2>

({if $msg})<p class="caution">({$msg})</p>({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('biz_update_c_admin_config','do')})">

<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table>

<tr>
<th>施設操作可否</th>
<td>
<input name="IS_CLOSED_SHISETSU" id="IS_CLOSED_SHISETSU_1" type="radio" value="1"({if $c_admin_config.IS_CLOSED_SHISETSU !== "0"}) checked="checked"({/if})><label for="IS_CLOSED_SHISETSU_1">管理者のみ施設の操作ができる</label><br />
<input name="IS_CLOSED_SHISETSU" id="IS_CLOSED_SHISETSU_2" type="radio" value="0"({if $c_admin_config.IS_CLOSED_SHISETSU === "0"}) checked="checked"({/if})><label for="IS_CLOSED_SHISETSU_2">誰でも施設の操作ができる</label><br />
</td>
</tr>

<tr>
<th>&nbsp;</th>
<td><input type="submit" class="submit" value="設定変更"></td>
</tr>
</table>
</form>

({$inc_footer|smarty:nodefaults})