({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メッセージ送信"})
({assign var="parent_page_name" value="メンバーリスト"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})


<h2 id="ttl01">メッセージ送信</h2>
<div class="contents">
<p class="info">選択したメンバーにメッセージを送信します。</p>
<p class="caution" id="c01">タイトルと本文を入力してください。<br /><strong>※このメッセージは、ID No.1のメンバー名にて送信されます。</strong></p>
<dl>
	<dt class="msgAdd"><strong>送信先</strong></dt>
	<dd class="msgAdd">({foreach from=$c_member_list item=item name=cml})<strong><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a></strong>({if !$smarty.foreach.cml.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
</dl>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
({foreach from=$c_member_list item=item})
<input type="hidden" name="c_member_ids[]" value="({$item.c_member_id})" />
({/foreach})
<dl>
<dt class="msgTtl"><strong>タイトル</strong></dt>
<dd class="msgTtl"><input class="basic" type="text" name="subject" size="50" value="({$requests.subject})" /></dd>
<dt class="msgTxt"><strong>本文</strong></dt>
<dd class="msgTxt"><textarea name="body" cols="50" rows="10">({$requests.body})</textarea></dd>
</dl>
<p class="textBtn"><input type="submit" value="メッセージ送信"></p>
</form>
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">メンバーリストに戻る</a></p>

({$inc_footer|smarty:nodefaults})
