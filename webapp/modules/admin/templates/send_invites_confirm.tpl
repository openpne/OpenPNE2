({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;メール管理：招待メール送信</div>
</div>

({*ここまで:navi*})

<h2>招待メール送信確認</h2>
<div class="contents">

({if $requests.pc_mails})
({if !(($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
PCからは登録できない設定になっています。<br>
<div class="caution">※以下のアドレスには送信されません</div>
({else})
<dl class="invitesAdd">
	<dt><strong>【PCアドレス】</strong></dt>
({/if})
<dd>({foreach from=$requests.pc_mails item=item})<strong>({$item})</strong>&nbsp;／&nbsp;({/foreach})</dd>
</dl>
({/if})
({if $requests.ktai_mails})
({if !(($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI))})
携帯からは登録できない設定になっています。<br>
<div class="caution">※以下のアドレスには送信されません</div>
({else})
<dl class="invitesAdd">
	<dt><strong>【携帯アドレス】</strong></dt>
({/if})
	<dd>({foreach from=$requests.ktai_mails item=item})<strong>({$item})</strong>&nbsp;／&nbsp;({/foreach})</dd>
</dl>
({/if})
({if $requests.error_mails})
<dl class="invitesAdd" id="warning">
	<dt><strong>以下のアドレスは登録済みのため送信されません。</strong></dt>
	<dd>({foreach from=$requests.error_mails item=item})<strong>({$item})</strong>&nbsp;／&nbsp;({/foreach})</dd>
</dl>
({/if})


({if !$cannot_send})
<p class="caution" id="c02">送信してもよろしいですか？</p>
({/if})
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_invites','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="mails" value="({$requests.mails})" />
<input type="hidden" name="message" value="({$requests.message})" />
({if !$cannot_send})<p class="textBtn"><input name="complete" type="submit" value="送信する"></p>({/if})<p class="textBtn"><input name="input" type="submit" value="修正する"></p>
</form>
<br class="clear" />
({if $pc_subject || $ktai_subject})
<h3>招待メール内容確認<span>(※変更はできません)</span></h3>

({if $pc_subject})
<h4>【PC向け】</h4>
<dl class="invitesDetail">
<dt><strong>件名</strong></dt>
<dd>({$pc_subject})</dd>
<dt><strong>本文</strong></dt>
<dd><textarea rows="10" cols="72" readonly="readonly">({$pc_body})</textarea></dd>
</dl>
({/if})
({if $ktai_subject})
<h4>【携帯向け】</h4>
<dl class="invitesDetail">
<dt><strong>件名</strong></dt>
<dd>({$ktai_subject})</dd>
<dt><strong>本文</strong></dt>
<dd><textarea rows="10" cols="72" readonly="readonly">({$ktai_body})</textarea></dd>
</dl>

({/if})
({/if})

</div>
({$inc_footer|smarty:nodefaults})