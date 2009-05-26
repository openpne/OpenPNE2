({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="招待メール送信"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>招待メール送信確認</h2>
<div class="contents">

({if $requests.pc_mails})
({if !(($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_PC))})
PCからは登録できない設定になっています。<br>
<div class="caution">※以下のメールアドレスには送信されません</div>
({else})
<dl class="invitesAdd">
	<dt><strong>【PCメールアドレス】</strong></dt>
({/if})
<dd>({foreach from=$requests.pc_mails item=item name=pm})<strong>({$item})</strong>({if !$smarty.foreach.pm.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
</dl>
({/if})
({if $requests.ktai_mails})
({if !(($smarty.const.OPENPNE_REGIST_FROM) & ($smarty.const.OPENPNE_REGIST_FROM_KTAI))})
携帯からは登録できない設定になっています。<br>
<div class="caution">※以下のメールアドレスには送信されません</div>
({else})
<dl class="invitesAdd">
	<dt><strong>【携帯メールアドレス】</strong></dt>
({/if})
	<dd>({foreach from=$requests.ktai_mails item=item name=km})<strong>({$item})</strong>({if !$smarty.foreach.km.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
</dl>
({/if})
({if $smarty.const.IS_GET_EASY_ACCESS_ID == 2 || $smarty.const.IS_GET_EASY_ACCESS_ID == 3})
<dl class="invitesAdd">
    <dt><strong>【携帯個体識別番号の登録】</strong></dt>
    ({if $requests.is_disable_regist_easy_access_id})
    <dd><strong>必須にしない</strong></dd>
    ({else})
    <dd><strong>必須にする</strong></dd>
    ({/if})
</dl>
({if $smarty.const.IS_GET_EASY_ACCESS_ID == 2})
<div class="caution">※携帯メールアドレスへの招待のみ適用されます。</div>
({/if})
({/if})
({if $requests.registered_mails})
<dl class="invitesAdd warning">
	<dt><strong>以下のメールアドレスは登録済みのため送信されません。</strong></dt>
	<dd>({foreach from=$requests.registered_mails item=item name=em})<strong>({$item})</strong>({if !$smarty.foreach.em.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
</dl>
({/if})

({if $requests.error_mails})
<dl class="invitesAdd warning">
	<dt><strong>不正なメールアドレスです。</strong></dt>
	<dd>({foreach from=$requests.error_mails item=item name=em})<strong>({$item})</strong>({if !$smarty.foreach.em.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
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
<input type="hidden" name="is_disable_regist_easy_access_id" value="({$requests.is_disable_regist_easy_access_id})" />
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

({$inc_footer|smarty:nodefaults})
