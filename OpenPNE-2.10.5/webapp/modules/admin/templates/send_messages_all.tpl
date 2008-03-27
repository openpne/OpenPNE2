({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メッセージ・メール送信"})
({assign var="parent_page_name" value="メンバーリスト"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<h2 id="ttl01">メッセージ・メール送信</h2>
<div class="contents">
<p class="info">すべてのメンバーにメッセージもしくはEメールを送信します。</p>
<p class="caution" id="c01"><strong>※このメッセージは、ID No.1のメンバーから送信されます。</strong></p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages_all','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<dl>
	<dt class="msgAdd"><strong>送信種別</strong></dt>
	<dd class="msgAdd"><select class="basic" name="send_type"><option value="message"({if $send_type=='message'}) selected="selected"({/if})>メッセージ送信</option>
<option value="mail"({if $send_type=='mail'}) selected="selected"({/if})>Eメール送信</option>
</option></select></dd>
</dl>
<dl>
	<dt class="msgAdd"><strong>送信先</strong></dt>
	<dd class="msgAdd"><strong>すべてのメンバー</strong></dd>
</dl>
<dl>
<dt class="msgTtl"><strong>タイトル</strong></dt>
<dd class="msgTtl"><input class="basic" type="text" name="subject" size="50" value="({$requests.subject})" /></dd>
<dt class="msgTxt"><strong>本文</strong></dt>
<dd class="msgTxt"><textarea name="body" cols="50" rows="10">({$requests.body})</textarea></dd>
</dl>
<p class="textBtn"><input type="submit" value="メッセージ送信" /></p>
</form>
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">メンバーリストに戻る</a></p>

({$inc_footer|smarty:nodefaults})
