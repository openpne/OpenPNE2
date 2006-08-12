({$inc_header|smarty:nodefaults})

<h2>新規ユーザー招待メール送信</h2>

({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
<p>新規登録ができない設定になっているので送信できません。</p>
({else})
<p>入力されたメールアドレス宛に「({$SNS_NAME})」への招待状を送信します。</p>
<ul>
<li class="caution">ID１番のユーザーからの招待メールとして送信されます。</li>
<li class="caution">既に登録済みのメールアドレスへは送信されません。</li>
<li class="caution">一度に大量のメールアドレスを指定するとシステム側で送りきれない可能性があります。</li>
</ul>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_invites','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
メールアドレス<br>
<textarea cols="50" rows="8" name="mails">({$requests.mails})</textarea><br>
<div class="caution">※複数のメールアドレス宛にメールを送信する場合は、改行で区切って入力してください。</div>
<br>
招待文<br>
<textarea cols="60" rows="5" name="message">({$requests.message})</textarea><br>
<br>
<input type="submit" class="submit" value="確認画面">
</form>
({/if})

({$inc_footer|smarty:nodefaults})