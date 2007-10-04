({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="メール送信設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで：navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>メール送信設定</h2>
<div class="contents">
<p class="info">SNSから送信される各種メールを送信するかどうかの設定をします。</p>

<h3 id="ttl01">PCメールアドレス向け</h3>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_mail_send','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table>
({foreach from=$pc key=key item=item})
<tr>
<th>({$item})</th>
<td>
<label for="({$key})Y"><input id="({$key})Y" type="radio" name="mail[({$key})]" value="1"({if !in_array($key, $unused)}) checked="checked"({/if})>送信する</label>
<label for="({$key})N"><input id="({$key})N" type="radio" name="mail[({$key})]" value="0"({if in_array($key, $unused)}) checked="checked"({/if})>送信しない</label>
</td>
</tr>
({/foreach})
</table>

<h3 id="ttl02">携帯メールアドレス向け</h3>
<table>
({foreach from=$ktai key=key item=item})
<tr>
<th>({$item})</th>
<td>
<label for="({$key})Y"><input id="({$key})Y" type="radio" name="mail[({$key})]" value="1"({if !in_array($key, $unused)}) checked="checked"({/if})>送信する</label>
<label for="({$key})N"><input id="({$key})N" type="radio" name="mail[({$key})]" value="0"({if in_array($key, $unused)}) checked="checked"({/if})>送信しない</label>
</td>
</tr>
({/foreach})
</table>

<h3 id="ttl03">管理用メールアドレス向け</h3>
<table>
({foreach from=$admin key=key item=item})
<tr>
<th>({$item})</th>
<td>
<label for="({$key})Y"><input id="({$key})Y" type="radio" name="mail[({$key})]" value="1"({if !in_array($key, $unused)}) checked="checked"({/if})>送信する</label>
<label for="({$key})N"><input id="({$key})N" type="radio" name="mail[({$key})]" value="0"({if in_array($key, $unused)}) checked="checked"({/if})>送信しない</label>
</td>
</tr>
({/foreach})
</table>

<p class="textBtn"><input type="submit" value="変更する"></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})">メール文言変更へ</a></p>
({$inc_footer|smarty:nodefaults})
