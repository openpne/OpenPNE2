({$inc_header|smarty:nodefaults})

<h2>ナビゲーション項目変更</h2>

<p>ナビゲーション項目の「URL」と「説明(alt属性)」を変更することができます。</p>

<p class="caution">※「説明」を変更しても画像内の文字は自動的には変更されません。<br>
画像の変更は「<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})">スキン画像変更</a>」からおこなってください。</p>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<ul>
<li><a href="#navi_global">グローバルナビゲーション</a></li>
<li><a href="#navi_h">h_系ナビゲーション</a></li>
<li><a href="#navi_f">f_系ナビゲーション</a></li>
<li><a href="#navi_c">c_系ナビゲーション</a></li>
</ul>

<hr>

<h3><a name="navi_global">グローバルナビゲーション</a></h3>

<p><img src="({t_img_url_skin filename=skin_after_header})"></p>

<table>
<tr>
<th>並び順<br>（左から）</th>
<th>URL</th>
<th>説明</th>
<th colspan="2">操作</th>
</tr>
({foreach from=$navi_global key=key item=item})
<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_navi','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="navi_type" value="global">
<input type="hidden" name="sort_order" value="({$key+1})">
<td>({$key+1})</td>
<td><input type="text" name="url" value="({$item.url})" size="40"></td>
<td><input type="text" name="caption" value="({$item.caption})" size="20"></td>
<td><input type="submit" class="submit" value="変更"></td>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_navi','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="navi_type" value="global">
<input type="hidden" name="sort_order" value="({$key+1})">
<td><input type="submit" class="submit" value="リセット"></td>
</form>
</tr>
({/foreach})
<tr>
<td>({$key+2})</td>
<td>-</td>
<td>ログアウト</td>
<td colspan="2">変更できません</td>
</tr>
</table>

<hr>

<h3><a name="navi_h">h_系ナビゲーション</a></h3>

<p><img src="({t_img_url_skin filename=skin_navi_h})"></p>

<table>
<tr>
<th>並び順<br>（左から）</th>
<th>URL</th>
<th>説明</th>
<th colspan="2">操作</th>
</tr>
({foreach from=$navi_h key=key item=item})
<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_navi','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="navi_type" value="h">
<input type="hidden" name="sort_order" value="({$key+1})">
<td>({$key+1})</td>
<td><input type="text" name="url" value="({$item.url})" size="40"></td>
<td><input type="text" name="caption" value="({$item.caption})" size="20"></td>
<td><input type="submit" class="submit" value="変更"></td>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_navi','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="navi_type" value="h">
<input type="hidden" name="sort_order" value="({$key+1})">
<td><input type="submit" class="submit" value="リセット"></td>
</form>
</tr>
({/foreach})
</table>

<hr>

<h3><a name="navi_f">f_系ナビゲーション</a></h3>

<p><img src="({t_img_url_skin filename=skin_navi_f})"></p>

<table>
<tr>
<th>並び順<br>（左から）</th>
<th>URL</th>
<th>説明</th>
<th colspan="2">操作</th>
</tr>
({foreach from=$navi_f key=key item=item})
<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_navi','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="navi_type" value="f">
<input type="hidden" name="sort_order" value="({$key+1})">
<td>({$key+1})</td>
<td><input type="text" name="url" value="({$item.url})" size="40"></td>
<td><input type="text" name="caption" value="({$item.caption})" size="20"></td>
<td><input type="submit" class="submit" value="変更"></td>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_navi','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="navi_type" value="f">
<input type="hidden" name="sort_order" value="({$key+1})">
<td><input type="submit" class="submit" value="リセット"></td>
</form>
</tr>
({/foreach})
</table>

<hr>

<h3><a name="navi_c">c_系ナビゲーション</a></h3>

<p><img src="({t_img_url_skin filename=skin_navi_c})"></p>

<table>
<tr>
<th>並び順<br>（左から）</th>
<th>URL</th>
<th>説明</th>
<th colspan="2">操作</th>
</tr>
({foreach from=$navi_c key=key item=item})
<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_navi','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="navi_type" value="c">
<input type="hidden" name="sort_order" value="({$key+1})">
<td>({$key+1})</td>
<td><input type="text" name="url" value="({$item.url})" size="40"></td>
<td><input type="text" name="caption" value="({$item.caption})" size="20"></td>
<td><input type="submit" class="submit" value="変更"></td>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_navi','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="navi_type" value="c">
<input type="hidden" name="sort_order" value="({$key+1})">
<td><input type="submit" class="submit" value="リセット"></td>
</form>
</tr>
({/foreach})
</table>

({$inc_footer|smarty:nodefaults})