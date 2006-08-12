({$inc_header|smarty:nodefaults})

<h2>メール設定</h2>

<p>SNSから送信される各種メールを送信するかどうかの設定およびメール文言の変更をおこなうことができます。</p>

<ul>
<li><a href="#send">メール送信設定</a></li>
<li><a href="#template">メール文言設定</a></li>
</ul>

<hr>

<h3><a name="send">メール送信設定</a></h3>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_mail_send','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table>
<tr>
<th colspan="2">PCメールアドレス向け</th>
</tr>
({foreach from=$pc key=key item=item})
<tr>
<th style="text-align:left">({$item})</th>
<td>
<input type="radio" name="mail[({$key})]" value="1"({if !in_array($key, $unused)}) checked="checked"({/if})>送信する
<input type="radio" name="mail[({$key})]" value="0"({if in_array($key, $unused)}) checked="checked"({/if})>送信しない
</td>
</tr>
({/foreach})

<tr>
<th colspan="2">携帯メールアドレス向け</th>
</tr>
({foreach from=$ktai key=key item=item})
<tr>
<th style="text-align:left">({$item})</th>
<td>
<input type="radio" name="mail[({$key})]" value="1"({if !in_array($key, $unused)}) checked="checked"({/if})>送信する
<input type="radio" name="mail[({$key})]" value="0"({if in_array($key, $unused)}) checked="checked"({/if})>送信しない
</td>
</tr>
({/foreach})
<tr>
<td colspan="2" style="text-align:right"><input type="submit" class="submit" value="変更"></td>
</tr>
</table>

</form>

<h3><a name="template">メール文言変更（上級者向け設定）</a></h3>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})" title="メール文言変更: SNSから送信する各種メールの文言変更">メール文言変更</a>（別ページ）</li>
</ul>

({$inc_footer|smarty:nodefaults})