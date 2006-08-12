({$inc_header|smarty:nodefaults})

<h2>メッセージ送信</h2>

<p>すべてのユーザにメッセージを送信します。タイトルと本文を入力してください。</p>
<p class="caution">※このメッセージは、ID1番のユーザから送信されます。<br>
※全員にメッセージを送る場合、ユーザの数によっては大きな負荷がかかる可能性がありますのでご注意ください。</p>

<div id="page_navi">
◆送信先
<ul>
すべてのユーザ
</ul>
</div>

<div style="float:left">
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages_all','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<dl>
<dt>タイトル</dt>
<dd><input type="text" name="subject" size="50" value="({$requests.subject})"></dd>
<dt>本文</dt>
<dd><textarea name="body" cols="50" rows="10">({$requests.body})</textarea></dd>
<dd><input type="submit" class="submit" value="メッセージ送信"></dd>
</dl>
</form>
</div>

({$inc_footer|smarty:nodefaults})