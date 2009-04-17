({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="参加申請の一括処理"})
({assign var="parent_page_name" value="参加申請の一括処理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<h2 id="ttl01">参加申請の一括({$entrytypestr})</h2>
<div class="contents">
<p class="info">選択した申請者を、一括<font style="color:red;font-weight:bold;">「({$entrytypestr})」</font>します。</p>
<br/>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('admit_sns_entry','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="EntryType" value="({$entrytype})" />
({foreach from=$c_member_pre_list item=item})
<input type="hidden" name="c_member_pre_ids[]" value="({$item.c_member_pre_id})" />
({/foreach})
<dl>
<dt class="msgAdd"><strong>({$entrytypestr})メンバー一覧</strong></dt>
<dd class="msgAdd">({foreach from=$c_member_pre_list item=item name=cml})<strong>
({$item.regist_address})</strong>({if !$smarty.foreach.cml.last})&nbsp;／&nbsp;({/if})({/foreach})</dd>
</dl>
<p class="textBtn"><input type="submit" value="({$entrytypestr})" /></p>
</form>
<br /> <br />
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('sns_entry_list')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">承認待ちリストに戻る</a></p>

({$inc_footer|smarty:nodefaults})
