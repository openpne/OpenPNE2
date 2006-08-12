({$inc_header|smarty:nodefaults})

<h2>新規ユーザー招待メール送信</h2>

({if $requests.pc_mails})
({if !(($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
PCからは登録できない設定になっています。<br>
<div class="caution">※以下のアドレスには送信されません</div>
({else})
PCアドレス
({/if})
<ul>
({foreach from=$requests.pc_mails item=item})
<li>({$item})</li>
({/foreach})
</ul>
({/if})

({if $requests.ktai_mails})
({if !(($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI))})
携帯からは登録できない設定になっています。<br>
<div class="caution">※以下のアドレスには送信されません</div>
({else})
携帯アドレス
({/if})
<ul>
({foreach from=$requests.ktai_mails item=item})
<li>({$item})</li>
({/foreach})
</ul>
({/if})

({if $requests.error_mails})
以下のアドレスは登録済みのため送信されません。
<ul>
({foreach from=$requests.error_mails item=item})
<li>({$item})</li>
({/foreach})
</ul>
({/if})

({if !$cannot_send})
送信してもよろしいですか？
({/if})
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_invites','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="mails" value="({$requests.mails})">
<input type="hidden" name="message" value="({$requests.message})">
({if !$cannot_send})<input type="submit" name="complete" class="submit" value="送信">&nbsp;({/if})
<input type="submit" name="input" class="submit" value="修正">
</form>

<hr>

({if $pc_subject || $ktai_subject})
<h3>招待メール内容確認(※変更はできません)</h3>

({if $pc_subject})
<h4>PC向け</h4>
<table>
<tr>
<th>件名</th>
<td>({$pc_subject})</td>
</tr>
<tr>
<th>本文</th>
<td><textarea rows="10" cols="72" readonly="readonly">({$pc_body})</textarea></td>
</tr>
</table>
({/if})

({if $ktai_subject})
<h4>携帯向け</h4>
<table>
<tr>
<th>件名</th>
<td>({$ktai_subject})</td>
</tr>
<tr>
<th>本文</th>
<td><textarea rows="10" cols="72" readonly="readonly">({$ktai_body})</textarea></td>
</tr>
</table>
({/if})
({/if})

({$inc_footer|smarty:nodefaults})