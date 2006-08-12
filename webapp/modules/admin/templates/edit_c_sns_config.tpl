({$inc_header|smarty:nodefaults})

<h2>配色・CSS変更</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<ul>
<li><a href="#color">配色設定</a></li>
<li><a href="#css">カスタムCSS追加</a></li>
</ul>

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})">スキン画像設定</a> (別ページ)</li>
</ul>

<hr>

<h3><a name="color">配色設定</a></h3>

<p class="caution">色は16進数表記で指定してください。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_sns_config','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table style="float:left; margin: 0 5px;">
({foreach from=$border_names item=item})
<tr>
<th>({$item})</th>
<td>#<input type="text" name="({$item})" value="({$c_sns_config[$item]})" size="8" maxlength="6"></td>
<td style="background-color:#({$c_sns_config[$item]});">&nbsp;</td>
</tr>
({/foreach})
</table>

<table style="float;left; margin: 0 5px;">
({foreach from=$bg_names item=item})
<tr>
<th>({$item})</th>
<td>#<input type="text" name="({$item})" value="({$c_sns_config[$item]})" size="8" maxlength="6"></td>
<td style="background-color:#({$c_sns_config[$item]});">&nbsp;</td>
</tr>
({/foreach})
</table>

<div style="margin: 5px;"><input type="submit" class="submit" value="変更"></div>
</form>

<hr>

<h3><a name="css">カスタムCSS追加</a></h3>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_siteadmin_css','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<textarea name="body" cols="72" rows="20">({$inc_custom_css})</textarea>
<div style="margin: 5px;"><input type="submit" class="submit" value="変更"></div>
</form>

({$inc_footer|smarty:nodefaults})