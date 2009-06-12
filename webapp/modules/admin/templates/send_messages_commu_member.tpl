({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="$WORD_COMMUNITYメンバー一括送信"})
({assign var="parent_page_name" value="$WORD_COMMUNITYリスト"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<h2 id="ttl01">メッセージ・メール送信</h2>
<div class="contents">
<p class="info">指定した({$WORD_COMMUNITY})メンバー全員にメッセージもしくはEメールを送信します。</p>
<p class="caution" id="c01"><strong>※このメッセージは、ID No.1のメンバーから送信されます。</strong></p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('send_messages_commu_member','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
({foreach from=$c_member_list item=item})
<input type="hidden" name="c_member_ids[]" value="({$item.c_member_id})" />
({/foreach})
<input type="hidden" name="target_c_commu_id" value=({$target_c_commu_id}) />
<dl>
<dt class="msgAdd"><strong>送信種別</strong></dt>
<dd><select class="basic" name="send_type">
<option value="message"({if $send_type=='message'}) selected="selected"({/if})>メッセージ送信</option>
<option value="mail"({if $send_type=='mail'}) selected="selected"({/if})>Eメール送信</option>
</option>
</select>
</dd>
<dt class="msgAdd"><strong>送信先</strong></dt>
<dd class="msgAdd"><a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$target_c_commu_id})" target="_blank">({$c_commu.name|t_truncate:60})</a>&nbsp;({$WORD_COMMUNITY})メンバー全員</dd>
</dl>
<dl>
<dt class="msgTtl"><strong>タイトル</strong></dt>
<dd class="msgTtl"><input class="basic" type="text" name="subject" size="50" value="({$requests.subject})" /></dd>
<dt class="msgTxt"><strong>本文</strong></dt>
<dd class="msgTxt"><textarea name="body" cols="50" rows="10">({$requests.body})</textarea></dd>
</dl>
<p class="textBtn"><input type="submit" value="メッセージ送信" /></p>
</form>
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_commu_member_list')})&amp;target_c_commu_id=({$target_c_commu_id})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">({$WORD_COMMUNITY})メンバーリストに戻る</a></p>

({$inc_footer|smarty:nodefaults})
