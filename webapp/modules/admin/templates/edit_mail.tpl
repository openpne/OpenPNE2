({$inc_header|smarty:nodefaults})

<h2>メール文言変更（上級者向け設定）</h2>

<p class="caution">※Smartyテンプレート形式で記述します。<br>
誤った形式で記述すると、メールを送信することができなくなってしまいます。<br>
その場合は、「デフォルトに戻す」から元に戻してください。</p>

<table>
<tr>
<td style="vertical-align: top">

<p>PCメールアドレス向け</p>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=inc_signature">署名（全PCメール共通）</a></li>
</ul>
<ul>
({foreach from=$pc key=key item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=({$key})">({$item})</a></li>
({/foreach})
</ul>

<p>携帯メールアドレス向け</p>
<ul>
({foreach from=$ktai key=key item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=({$key})">({$item})</a></li>
({/foreach})
</ul>

</td>

<td style="vertical-align:top;">

<p>
({if $requests.target == "inc_signature"})
署名（全PCメール共通）
({elseif $pc[$requests.target]})
({$pc[$requests.target]})
({elseif $ktai[$requests.target]})
({$ktai[$requests.target]})
({/if})
</p>

({if $msg})
<div class="caution">({$msg})</div>
({/if})

<p style="text-align:right"><a href="./?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_mail','do')})&amp;target=({$requests.target})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a></p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_mail','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target" value="({$requests.target})">
({if $requests.target != "inc_signature"})
件名：<br>
<input type="text" name="subject" value="({$subject})" size="72"><br>
本文：<br>
({/if})
<textarea name="body" cols="({$cols|default:72})" rows="({$rows|default:30})">({$body})</textarea><br>
<input type="submit" class="submit" value="変更">
</form>

</td>
</tr>
</table>

({$inc_footer|smarty:nodefaults})