({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="招待メール送信"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})


<h2>招待メール送信</h2>
<div class="contents">
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
<p>新規登録ができない設定になっているので送信できません。</p>
({else})

<p class="info">入力されたメールアドレス宛に「({$SNS_NAME})」への招待状を送信します。</p>
<ul class="caution" id="c01">
	<li>ID１番のメンバーからの招待メールとして送信されます。</li>
	<li>既に登録済みのメールアドレスへは送信されません。</li>
	<li>一度に大量のメールアドレスを指定するとシステム側で送りきれない可能性があります。</li>
</ul>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_invites','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<dl>
<dt class="mails"><strong>メールアドレス</strong></dt>
<dd class="mails"><textarea cols="50" rows="8" name="mails">({$requests.mails})</textarea></dd>
<dd class="caution" id="c02">※複数のメールアドレス宛にメールを送信する場合は、改行で区切って入力してください。</dd>
<dt class="message"><strong>招待文</strong></dt>
<dd class="message"><textarea cols="60" rows="5" name="message">({$requests.message})</textarea></dd>
</dl>
<p class="textBtn"><input type="submit" value="確認画面"></p>
</form>
({/if})
({$inc_footer|smarty:nodefaults})
