({$inc_header|smarty:nodefaults})

({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="承認待ちリスト"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">承認待ちリスト</h2>
<div class="contents">

<form action="./" method="get">
<p id="searchMail">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_sns_entry')})" />
<input type="hidden" name="page_size" value="({$pager.page_size})">
<strong>メールアドレス検索</strong>(完全一致)：
<input type="text" class="basic" name="mail_address" value="({$requests.mail_address})" size="30" />
<span class="textBtnS"><input type="submit" value="　検　索　" /></span>
</p>
</form>

<div class="userList">
({if $pager})
<form action="./" method="get">
<p id="numberDisplays">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_sns_entry')})" />
<input type="hidden" name="order" value="({$requests.order})" />
({foreach from=$cond_list key=key item=item})
<input type="hidden" name="cond[({$key})]" value="({$item})" />
({/foreach})
({foreach from=$profile_cond_list key=key item=item})
<input type="hidden" name="profile[({$key})]" value="({$item})" />
({/foreach})
<strong>表示件数</strong>：
<select class="basic" name="page_size">
<option value="10"({if $pager.page_size==10}) selected="selected"({/if})>10件</option>
<option value="20"({if $pager.page_size==20}) selected="selected"({/if})>20件</option>
<option value="50"({if $pager.page_size==50}) selected="selected"({/if})>50件</option>
<option value="100"({if $pager.page_size==100}) selected="selected"({/if})>100件</option>
</select>
<span class="textBtnS"><input type="submit" value="　変　更　" /></span><span class="btnCaution">※表示件数を多くすると処理が重くなり、サーバーに負荷がかかります。</span>
</p>
</form>
({/if})

({if $pager})
<div class="listControlTop">
({if $pager.total_num})
<p class="display">({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています</p>
({/if})
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page=({$i})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">次へ</a>
({/if})
</p>
</div>({*/div class="listControlTop"*})
({/if})

<form action="./" method="post" name="formSendMessages">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('admit_sns_entry')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table class="userListTable">
	<thead>
		<tr>
			<th class="cell01" rowspan="3">&nbsp;</th>
			<th class="cell03" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=c_member_pre_id-1({$cond})">▲</a>ID<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=c_member_pre_id-2({$cond})">▼</a></th>
			<th class="cell18" rowspan="3">申請メールアドレス</th>
			<th class="cell18" rowspan="2">PCメールアドレス</th>
			<th class="cell18" rowspan="2">携帯メールアドレス</th>
			({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
			<th class="cell19" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=login_id-1({$cond})">▲</a>ログインID<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=login_id-2({$cond})">▼</a></th>
			({/if})
			<th class="cell04" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=nickname-1({$cond})">▲</a>({$WORD_NICKNAME})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=nickname-2({$cond})">▼</a></th>
			<th class="cell06" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=r_date-1({$cond})">▲</a>申請日<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=r_date-2({$cond})">▼</a></th>
			<th class="cell07" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id_invite-1({$cond})">▲</a>招待者<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id_invite-2({$cond})">▼</a></th>
			<th class="cell09" colspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=birth-1({$cond})">▲</a>生年月日<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=birth-2({$cond})">▼</a></th>
			<th class="cell15" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;order=c_member_pre_id-1({$cond})">▲</a>ID<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;order=c_member_pre_id-2({$cond})">▼</a></th>
		</tr>
		<tr>
			<th class="cell09A">年</th>
			<th class="cell09B">月</th>
			<th class="cell09C">日</th>
		</tr>
		<tr class="min_width">
                        <th class="cell05">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;cond[is_pc_address]='+this.options[this.selectedIndex].value);">
            <option value="">▼選択</option>
                        <option value="1"({if $cond_list.is_pc_address == 1}) selected="selected"({/if})>登録している</option>
                        <option value="2"({if $cond_list.is_pc_address == 2}) selected="selected"({/if})>登録していない</option>
            </select>
            </th>
                        <th class="cell05">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;cond[is_ktai_address]='+this.options[this.selectedIndex].value);">
            <option value="">▼選択</optionn>
                        <option value="1"({if $cond_list.is_ktai_address == 1}) selected="selected"({/if})>登録している</option>
                        <option value="2"({if $cond_list.is_ktai_address == 2}) selected="selected"({/if})>登録していない</option>
            </select>
            </th>
			<th class="cell09A" colspan="3">
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;cond[s_year]='+this.options[this.selectedIndex].value);">
			<option value="">▼選択</option>
			({foreach from=$years item=item})
			<option ({if $cond_list.s_year==$item})selected({/if}) value="({$item})">({$item})</option>
			({/foreach})
			</select>
			～
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;cond[e_year]='+this.options[this.selectedIndex].value);">
			<option value="">▼選択</option>
			({foreach from=$years item=item})
			<option ({if $cond_list.e_year==$item})selected({/if}) value="({$item})">({$item})</option>
			({/foreach})
			</select>
			</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th class="cell01" rowspan="3">&nbsp;</th>
			<th class="cell03" rowspan="2">ID</th>
			<th class="cell18" rowspan="2">申請メールアドレス</th>
			<th class="cell18" rowspan="2">PCメールアドレス</th>
			<th class="cell18" rowspan="2">携帯メールアドレス</th>
			({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
			<th class="cell19" rowspan="2">ログインID</th>
			({/if})
			<th class="cell04" rowspan="2">({$WORD_NICKNAME})</th>
			<th class="cell06" rowspan="2">申請日</th>
			<th class="cell07" rowspan="2">招待者</th>
			<th class="cell09A">年</th>
			<th class="cell09B">月</th>
			<th class="cell09C">日</th>
			<th class="cell15" rowspan="2">ID</th>
		</tr>
		<tr>
			<th class="cell09" colspan="3">生年月日</th>
		</tr>
	</tfoot>
	<tbody>
		({foreach from=$c_member_pre_list item=item})
		<tr>
			<td class="cell01"><input type="checkbox" name="c_member_ids[]" value="({$item.c_member_pre_id})" /></td>
			<td class="cell03">({$item.c_member_pre_id})</td>
			<td class="cell18">({$item.regist_address})</td>
			<td class="cell18">({$item.pc_address})</td>
			<td class="cell18">({$item.ktai_address})</td>
                        ({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
                        <td class="cell19">({$item.login_id})</td>
                        ({/if})
			<td class="cell19">({$item.nickname})</td>
			<td class="cell05">({$item.r_date|date_format:"%y-%m-%d %H:%M"})</td>
			<td class="cell07">({if $item.c_member_id})({$item.c_member_id}):<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_member_detail')})&amp;target_c_member_id=({$item.c_member_id})&amp;from=list_sns_entry">({$item.invite_nickname})</a>({else})&nbsp;({/if})</td>
			<td class="cell09A">({if $item.birth_year})({$item.birth_year})({else})&nbsp;({/if})</td>
			<td class="cell09B">({if $item.birth_month})({$item.birth_month})({else})&nbsp;({/if})</td>
			<td class="cell09C">({if $item.birth_day})({$item.birth_day})({else})&nbsp;({/if})</td>
			<td class="cell15">({$item.c_member_pre_id})</td>
		</tr>
		({/foreach})
	</tbody>
</table>
<div class="listControlBtm">
<div class="entryTransmit">
<p class="entryCheck"><img src="modules/admin/img/icn_msgtransmit.gif" alt="dummy" /><a href="#" onClick="return checkAll();" onKeyPress="return checkAll();">全てをチェック</a>&nbsp;|&nbsp;<a href="#" onClick="return clearAll();" onKeyPress="return clearAll();">全てのチェックをはずす</a></p>
<input type=hidden name="EntryType" id="EntryType" value="">
<div class="entryTransmitBtn">
<input type="submit" id="btnEntryOK" value="承 認 す る" onClick="document.formSendMessages.EntryType.value=1;"/>
<br />
<input type="submit" id="btnEntryNG" value="否 認 す る" onClick="document.formSendMessages.EntryType.value=2;"/>
</form>

</div>({*/div class="entryTransmitBtn"*})
</div>({*/div class="entryTransmit"*})


({if $pager})
<div class="listNavi">
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page=({$i})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">次へ</a>
({/if})
</p>
({if $pager.total_num})
<p class="display">({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています</p>
</div>({*/div class="listNaviBtm"*})
({/if})
({/if})
</div>({*/div class="listControlBtm"*})

</div>({*/div class="userList"*})

<p class="newline"></p>
({$inc_footer|smarty:nodefaults})
