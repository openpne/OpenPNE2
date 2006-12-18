({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;メンバー管理：メンバーリスト</div>
</div>

({*ここまで:navi*})

<h2 id="ttl01">メンバーリスト</h2>
<div class="contents">
<form action="./" method="get">
<p id="searchMail">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})" />
<strong>メールアドレス検索</strong>(完全一致)：
<input type="text" name="mail_address" value="({$requests.mail_address})" size="30" />
<span class="textBtnS"><input type="submit" value="検索" /></span>
</p>
</form>
<div class="userList">
({if $pager})
<form action="./" method="get">
<p id="numberDisplays">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})" />
<strong>表示件数</strong>：
<select name="page_size">
<option value="10"({if $pager.page_size==10}) selected="selected"({/if})>10件</option>
<option value="20"({if $pager.page_size==20}) selected="selected"({/if})>20件</option>
<option value="50"({if $pager.page_size==50}) selected="selected"({/if})>50件</option>
<option value="100"({if $pager.page_size==100}) selected="selected"({/if})>100件</option>
</select>
<span class="textBtnS"><input type="submit" value="変更" /></span><span class="btnCaution">※表示件数を多くすると処理が重くなり、サーバーに負荷がかかります。</span>
</p>
</form>
({/if})

({if $pager})
<div class="listControlTop">
<p class="display">({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています</p>
<p id="controlIcon"><img src="./modules/admin/img/icn_withdrawal.gif" alt="強制退会のアイコン" class="withdraw" />：強制退会　<img src="modules/admin/img/icn_rejected.gif" alt="ログイン停止のアイコン" />：ログイン停止　<img src="modules/admin/img/icn_permit.gif" alt="ログイン停止解除" />：ログイン停止解除　<img src="modules/admin/img/icn_passwd.gif" alt="パスワード再発行のアイコン" />：パスワード再発行</p>
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$i})&amp;page_size=({$pager.page_size})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})">次へ</a>
({/if})
</p>
</div>({*/div class="listControlTop"*})
({/if})

<form action="./" method="post" name="formSendMessages">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table class="userListTable">
	<thead>
		<tr>
			<th class="cell01" rowspan="2">&nbsp;</th>
			<th class="cell02" colspan="3" rowspan="2">操作パネル</th>
			<th class="cell03" rowspan="2">ID</th>
			<th class="cell04" rowspan="2">ニックネーム</th>
			<th class="cell05" rowspan="2">最終ログイン</th>
			<th class="cell06" rowspan="2">登録日</th>
			<th class="cell07" rowspan="2">招待者</th>
			<th class="cell08" colspan="3">画像</th>
			<th class="cell09" colspan="3">生年月日</th>
			({foreach from=$c_profile_list item=prof})
			<th rowspan="2">({$prof.caption})</th>
			({/foreach})
			<th class="cell15" rowspan="2">ID</th>
		</tr>
		<tr>
			<th class="cell08A">1</th>
			<th class="cell08B">2</th>
			<th class="cell08C">3</th>
			<th class="cell09A">年</th>
			<th class="cell09B">月</th>
			<th class="cell09C">日</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th class="cell01" rowspan="2">&nbsp;</th>
			<th class="cell02" colspan="3" rowspan="2">操作パネル</th>
			<th class="cell03" rowspan="2">ID</th>
			<th class="cell04" rowspan="2">ニックネーム</th>
			<th class="cell05" rowspan="2">最終ログイン</th>
			<th class="cell06" rowspan="2">登録日</th>
			<th class="cell07" rowspan="2">招待者</th>
			<th class="cell08A">1</th>
			<th class="cell08B">2</th>
			<th class="cell08C">3</th>
			<th class="cell09A">年</th>
			<th class="cell09B">月</th>
			<th class="cell09C">日</th>
			({foreach from=$c_profile_list item=prof})
			<th rowspan="2">({$prof.caption})</th>
			({/foreach})
			<th class="cell15" rowspan="2">ID</th>
		</tr>
		<tr>
			<th class="cell08" colspan="3">画像</th>
			<th class="cell09" colspan="3">生年月日</th>
		</tr>
	</tfoot>
	<tbody>
		({foreach from=$c_member_list item=item})
		<tr id="userID({$item.c_member_id})">
			<td class="cell01">({if $item.c_member_id != 1})<input type="checkbox" name="c_member_ids[]" value="({$item.c_member_id})" />({else})&nbsp;({/if})</td>
			<td class="cell02A">({if $item.c_member_id != 1})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_member_confirm')})&amp;target_c_member_id=({$item.c_member_id})"><img src="modules/admin/img/icn_withdrawal.gif" alt="強制退会" /></a>({else})&nbsp;({/if})</td>
			<td class="cell02B"><a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('update_is_login_rejected','do')})&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})">({if $item.is_login_rejected})<img src="modules/admin/img/icn_permit.gif" alt="ログイン停止解除" />({else})<img src="modules/admin/img/icn_rejected.gif" alt="ログイン停止" />({/if})</a></td>
			<td class="cell02C"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('passwd')})&amp;target_c_member_id=({$item.c_member_id})"><img src="modules/admin/img/icn_passwd.gif" alt="パスワード再発行" /></a></td>
			<td class="cell03">({$item.c_member_id})</td>
			<td class="cell04"><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a></td>
			<td class="cell05">({if $item.access_date != '0000-00-00 00:00:00'})({$item.access_date|date_format:"%y-%m-%d %H:%M"})({else})未ログイン({/if})</td>
			<td class="cell06">({if $item.r_date != '0000-00-00 00:00:00'})({$item.r_date|date_format:"%y-%m-%d"})({else})&nbsp;({/if})</td>
			<td class="cell07">({if $item.c_member_id_invite})({$item.c_member_id_invite}):<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_invite})" target="_blank">({$item.c_member_invite.nickname})</a>({else})&nbsp;({/if})</td>
			<td class="cell08A">({if $item.image_filename_1})<a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="modules/admin/img/icn_image_on.gif" alt="画像有り" /></a>({else})<img src="modules/admin/img/icn_image_off.gif" alt="画像無し" />({/if})</td>
			<td class="cell08B">({if $item.image_filename_2})<a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="modules/admin/img/icn_image_on.gif" alt="画像有り" /></a>({else})<img src="modules/admin/img/icn_image_off.gif" alt="画像無し" />({/if})</td>
			<td class="cell08C">({if $item.image_filename_3})<a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="modules/admin/img/icn_image_on.gif" alt="画像有り" /></a>({else})<img src="modules/admin/img/icn_image_off.gif" alt="画像無し" />({/if})</td>
			<td class="cell09A">({if $item.birth_year})({$item.birth_year})({else})&nbsp;({/if})</td>
			<td class="cell09B">({if $item.birth_month})({$item.birth_month})({else})&nbsp;({/if})</td>
			<td class="cell09C">({if $item.birth_day})({$item.birth_day})({else})&nbsp;({/if})</td>
			({foreach from=$c_profile_list item=prof})
			<td>({strip})
			({if $prof.form_type == "checkbox"})
				({$item.profile[$prof.name].value|@t_implode:","|t_truncate:30})
			({else})
				({$item.profile[$prof.name].value|t_truncate:30})
			({/if})
			({/strip})</td>
			({/foreach})
			<td class="cell15">({$item.c_member_id})</td>
		</tr>
		({/foreach})
	</tbody>
</table>
<div class="listControlBtm">
<div class="msgTransmit">
<p class="msgCheck"><img src="modules/admin/img/icn_msgtransmit.gif" alt="" /><a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a>&nbsp;|&nbsp;<a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a></p>

<div class="msgTransmitBtn">
<input type="submit" id="btnSelTransmit" value="選択したメンバーにメッセージを送る" />
</form>

<form action="./" method="post" name="formSendMessagesSearch">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
({if $cond})
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_search')})" />
({foreach from=$cond_list key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="hidden" name="cond" value="({$cond})" />
({else})
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_all')})" />
({/if})
<input type="submit" id="btnNarrowTransmit" value="絞り込んだメンバー" />
</form>

<form action="./" method="post" name="formSendMessagesAll" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_all')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="submit" id="btnAllTransmit" value="すべてのメンバーにメッセージを送る" />
</form>

</div>({*/div class="msgTransmitBtn"*})
</div>({*/div class="msgTransmit"*})


({if $pager})
<div class="listNavi">
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$i})&amp;page_size=({$pager.page_size})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})">次へ</a>
({/if})
</p>
<p class="display">({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています</p>
</div>({*/div class="listNaviBtm"*})

({/if})
</div>({*/div class="listControlBtm"*})

</div>({*/div class="userList"*})

<p class="caution">※パスワード、秘密の質問の答えは不可逆な暗号化を施してデータベースへ保存しているため、元の文字列を知ることができません。</p>
</div>
({$inc_footer|smarty:nodefaults})
