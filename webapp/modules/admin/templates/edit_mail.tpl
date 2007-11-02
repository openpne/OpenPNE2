({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="メール文言変更"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

<h2>メール文言変更</h2>
<div class="contents">
<p class="caution" id="c01">※Smartyテンプレート形式で記述します。</p>
<p class="caution" id="c02">誤った形式で記述すると、メールを送信することができなくなってしまいます。<br />その場合は、「デフォルトに戻す」から元に戻してください。</p>

<table class="contents" cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="menu">
<dl>
<dt><strong class="item">PCメールアドレス向け</strong></dt>
<dd>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=inc_signature">署名（全PCメール共通）</a></li>
({foreach from=$pc key=key item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=({$key})">({$item})</a></li>
({/foreach})
</ul>
</dd>
<dt><strong class="item">携帯メールアドレス向け</strong></dt>
<dd>
<ul>
({foreach from=$ktai key=key item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=({$key})">({$item})</a></li>
({/foreach})
</ul>
</dd>
<dt><strong class="item">管理用メールアドレス向け</strong></dt>
<dd>
<ul>
({foreach from=$admin key=key item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})&amp;target=({$key})">({$item})</a></li>
({/foreach})
</ul>
</dd>
</dl>
</td>
<td class="detail">
<h3>({if $requests.target == "inc_signature"})
署名（全PCメール共通）
({elseif $pc[$requests.target]})
({$pc[$requests.target]})
({elseif $ktai[$requests.target]})
({$ktai[$requests.target]})
({elseif $admin[$requests.target]})
({$admin[$requests.target]})
({/if})</h3>
({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<p id="default"><a href="./?m=({$module_name})&amp;a=do_({$hash_tbl->hash('delete_mail','do')})&amp;target=({$requests.target})&amp;sessid=({$PHPSESSID})">デフォルトに戻す</a></p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_mail','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target" value="({$requests.target})" />
<dl>
({if $requests.target != "inc_signature"})
<dt><strong class="item">件名</strong></dt>
<dd><input class="basic" type="text" name="subject" value="({$subject})" size="72" /></dd>
<dt><strong class="item">本文</strong></dt>
({/if})
<dd><textarea name="body" cols="({$cols|default:72})" rows="({$rows|default:30})">({$body})</textarea></dd>
</dl>
<p class="textBtn"><input type="submit" value="変更する"></p>
</form>
</td>
</tr>
</table>

({$inc_footer|smarty:nodefaults})
