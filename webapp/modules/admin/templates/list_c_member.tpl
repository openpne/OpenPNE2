({$inc_header|smarty:nodefaults})

({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メンバーリスト"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">メンバーリスト</h2>
<div class="contents">

<form action="./" method="get">
<p id="searchMail">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})" />
<strong>メールアドレス検索</strong>(完全一致)：
<input type="text" class="basic" name="mail_address" value="({$requests.mail_address})" size="30" />
<span class="textBtnS"><input type="submit" value="　検　索　" /></span>
</p>
</form>
({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
<form action="./" method="get">
<p id="searchUsername">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})" />
<strong>ログインID検索</strong>(完全一致)：
<input type="text" class="basic" name="username" value="({$requests.username})" size="30" />
<span class="textBtnS"><input type="submit" value="　検　索　" /></span>
</p>
</form>
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('find_c_member')})({$cond})">詳細に条件を指定して検索する</a>

({if $cond_name_data})
<div class="cond_list">
<table class="basicType2">
({foreach from=$cond_name_data key=key item=item})
    ({if $key == 'profile'})
        ({foreach from=$item item=profile})
            <tr>
            <th>({$profile.name})</th>
            ({if is_array($profile.value)})
                <td>({$profile.value|@t_implode:", "})</td>
            ({else})
                <td>({$profile.value})</td>
            ({/if})
            </tr>
        ({/foreach})
    ({else})
        <tr>
        <th>({$item.name})</th>
        <td>({$item.value})</td>
        </tr>
    ({/if})
({/foreach})
</table>
</div>
({/if})


<div class="userList">
({if $pager})
<form action="./" method="get">
<p id="numberDisplays">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_member')})" />
<input type="hidden" name="order" value="({$requests.order})" />
({foreach from=$cond_list key=key item=item})
({if is_array($item)})
({foreach from=$item key=profile_key item=profile})
    ({if is_array($profile)})
        ({foreach from=$profile item=check})
            <input type="hidden" name="profile[({$profile_key})][]" value="({$check})" />
        ({/foreach})
    ({else})
        <input type="hidden" name="profile[({$profile_key})]" value="({$profile})" />
    ({/if})
({/foreach})
({else})
<input type="hidden" name="({$key})" value="({$item})" />
({/if})
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
<p class="display">({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています</p>
<p id="controlIcon"><img src="./modules/admin/img/icn_withdrawal.gif" alt="強制退会のアイコン" class="withdraw" />：強制退会　<img src="modules/admin/img/icn_rejected.gif" alt="ログイン停止のアイコン" />：ログイン停止　<img src="modules/admin/img/icn_permit.gif" alt="ログイン停止解除" />：ログイン停止解除　<img src="modules/admin/img/icn_passwd.gif" alt="パスワード再発行のアイコン" />：パスワード再発行 <img src="modules/admin/img/icn_blacklist.gif" alt="ブラックリストに追加" />：携帯個体識別番号をブラックリストに追加 <img src="modules/admin/img/icn_stop_receive_mail.gif" alt="メール受信の停止のアイコン" />：メール受信の停止 <img src="./modules/admin/img/icn_delete_all.gif" alt="書き込み一括削除のアイコン" class="widthraw" />：書き込み一括削除</p>
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$i})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">次へ</a>
({/if})
</p>
</div>({*/div class="listControlTop"*})
({/if})

<form action="./" method="post" id="formSendMessages" name="formSendMessages">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<table class="userListTable">
	<thead>
		<tr>
			<th class="cell01" rowspan="3">&nbsp;</th>
			<th class="cell02" colspan="6" rowspan="3">操作パネル</th>
			<th class="cell03" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id-1({$cond})">▲</a>ID<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id-2({$cond})">▼</a></th>
			({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
			<th class="cell19" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=username-1({$cond})">▲</a>ログインID<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=username-2({$cond})">▼</a></th>
			({/if})
			<th class="cell04" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=nickname-1({$cond})">▲</a>({$WORD_NICKNAME})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=nickname-2({$cond})">▼</a></th>
			({if $smarty.const.OPENPNE_USE_POINT_RANK})
			<th class="cell10" colspan="2" rowspan="2"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=PNE_POINT-1-p({$cond})">▲</a>ポイント・ランク<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=PNE_POINT-2-p({$cond})">▼</a></th>
			({/if})
			<th class="cell05" rowspan="2"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=access_date-1({$cond})">▲</a>最終ログイン<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=access_date-2({$cond})">▼</a></th>
			<th class="cell06" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=r_date-1({$cond})">▲</a>登録日<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=r_date-2({$cond})">▼</a></th>
			<th class="cell07" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id_invite-1({$cond})">▲</a>招待者<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=c_member_id_invite-2({$cond})">▼</a></th>
			<th class="cell08" colspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=image_filename-1({$cond})">▲</a>画像<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=image_filename-2({$cond})">▼</a></th>
			<th class="cell09" colspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=birth-1({$cond})">▲</a>生年月日<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=birth-2({$cond})">▼</a></th>
			({foreach from=$c_profile_list item=prof})
			({if $prof.name !== 'PNE_POINT'})
			<th rowspan="2"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$prof.name})-1({$cond})">▲</a>({$prof.caption})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$prof.name})-2({$cond})">▼</a></th>
			({/if})
			({/foreach})
			<th class="cell16" rowspan="2">PCメールアドレス</th>
			<th class="cell17" rowspan="2">携帯メールアドレス</th>
			<th class="cell18" rowspan="3">登録時メールアドレス</th>
			<th class="cell18" rowspan="3">携帯個体識別番号(暗号化済)</th>
			<th class="cell15" rowspan="3"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;order=c_member_id-1({$cond})">▲</a>ID<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;order=c_member_id-2({$cond})">▼</a></th>
		</tr>
		<tr>
			<th class="cell08A" rowspan="2">1</th>
			<th class="cell08B" rowspan="2">2</th>
			<th class="cell08C" rowspan="2">3</th>
			<th class="cell09A">年</th>
			<th class="cell09B">月</th>
			<th class="cell09C">日</th>
		</tr>
		<tr class="min_width">
			({if $smarty.const.OPENPNE_USE_POINT_RANK})
			<th class="cell10" colspan="2">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;s_rank='+this.options[this.selectedIndex].value);">
			<option value="">▼選択</option>
			({foreach from=$rank_data item=item})
			<option({if $cond_list.s_rank == $item.c_rank_id}) selected({/if}) value="({$item.c_rank_id})">({$item.name})</option>
			({/foreach})
			</select>
			～
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;e_rank='+this.options[this.selectedIndex].value);">
			<option value="">▼選択</option>
			({foreach from=$rank_data item=item})
			<option({if $cond_list.e_rank == $item.c_rank_id}) selected({/if}) value="({$item.c_rank_id})">({$item.name})</option>
			({/foreach})
			</select>
			</th>
			({/if})
			<th class="cell05">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;last_login='+this.options[this.selectedIndex].value);">
            <option value="">▼選択</option>
            ({foreach from=$select_last_login item=item key=key})
            <option ({if $cond_list.last_login==$key})selected({/if}) value="({$key})">({$item})</option>
            ({/foreach})
            </select>
            </th>
			<th class="cell09A" colspan="3">
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;s_year='+this.options[this.selectedIndex].value);">
			<option value="">▼選択</option>
			({foreach from=$years item=item})
			<option ({if $cond_list.s_year==$item})selected({/if}) value="({$item})">({$item})</option>
			({/foreach})
			</select>
			～
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;e_year='+this.options[this.selectedIndex].value);">
			<option value="">▼選択</option>
			({foreach from=$years item=item})
			<option ({if $cond_list.e_year==$item})selected({/if}) value="({$item})">({$item})</option>
			({/foreach})
			</select>
			</th>
			({foreach from=$profile_list item=prof})
			({if $prof.name !== 'PNE_POINT'})
			<th>
			({if $prof.form_type == 'radio' || $prof.form_type == 'select'})
			<select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;profile[({$prof.name})]='+this.options[this.selectedIndex].value);">
			<option value="">▼選択</option>
			({foreach item=item from=$prof.options})
			<option ({if $cond_list.profile[$prof.name]==$item.c_profile_option_id})selected({/if}) value="({$item.c_profile_option_id})"({if $c_member.profile[$profile.name].value == $item.value}) selected="selected"({/if})>({$item.value|default:"--"})</option>
			({/foreach})
			</select>
			({/if})

			<img src="./modules/admin/img/dummy.gif" />
			</th>
			({/if})
			({/foreach})
			<th class="cell05">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;is_pc_address='+this.options[this.selectedIndex].value);">
            <option value="">▼選択</option>
			<option value="1"({if $cond_list.is_pc_address == 1}) selected="selected"({/if})>登録している</option>
			<option value="2"({if $cond_list.is_pc_address == 2}) selected="selected"({/if})>登録していない</option>
            </select>
            </th>
			<th class="cell05">
            <select class="basic" onChange="Link('?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})&amp;is_ktai_address='+this.options[this.selectedIndex].value);">
            <option value="">▼選択</option>
			<option value="1"({if $cond_list.is_ktai_address == 1}) selected="selected"({/if})>登録している</option>
			<option value="2"({if $cond_list.is_ktai_address == 2}) selected="selected"({/if})>登録していない</option>
            </select>
            </th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th class="cell01" rowspan="3">&nbsp;</th>
			<th class="cell02" colspan="6" rowspan="2">操作パネル</th>
			<th class="cell03" rowspan="2">ID</th>
			({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
			<th class="cell19" rowspan="2">ログインID</th>
			({/if})
			<th class="cell04" rowspan="2">({$WORD_NICKNAME})</th>
			({if $smarty.const.OPENPNE_USE_POINT_RANK})
			<th class="cell10" rowspan="2">ランク</th>
			<th class="cell11" rowspan="2">ポイント</th>
			({/if})
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
			({if $prof.name !== 'PNE_POINT'})
			<th rowspan="2">({$prof.caption})</th>
			({/if})
			({/foreach})
			<th class="cell16" rowspan="2">PCメールアドレス</th>
			<th class="cell17" rowspan="2">携帯メールアドレス</th>
			<th class="cell18" rowspan="2">登録時メールアドレス</th>
			<th class="cell18" rowspan="2">携帯個体識別番号(暗号化済)</th>
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
			<td class="cell02D"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist_add')})&amp;easy_access_id=({$item.secure.easy_access_id})"><img src="modules/admin/img/icn_blacklist.gif" alt="ブラックリストに追加" /></a></td>
			<td class="cell02E">({if $item.is_receive_any_mail})<a href="?m=({$module_name})&amp;a=do_stop_receive_mail&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})"><img src="modules/admin/img/icn_stop_receive_mail.gif" alt="メール受信停止" /></a>({/if})</td>
            <td class="cell02A"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_member_write_all_confirm')})&amp;target_c_member_id=({$item.c_member_id})"><img src="modules/admin/img/icn_delete_all.gif" alt="書き込み一括削除" /></a></td>
			<td class="cell03">({$item.c_member_id})</td>
			({if $smarty.const.OPENPNE_AUTH_MODE != 'email'})
			<td class="cell19">({$item.username})</td>
			({/if})
			<td class="cell04"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_member_detail')})&amp;target_c_member_id=({$item.c_member_id})">({$item.nickname})</a></td>
			({if $smarty.const.OPENPNE_USE_POINT_RANK})
			<td class="cell10">({if !$smarty.const.OPENPNE_IS_POINT_ADMIN && $item.c_member_id == 1})-({else})({$item.c_rank.name})({/if})</td>
			<td class="cell11">({if !$smarty.const.OPENPNE_IS_POINT_ADMIN && $item.c_member_id == 1})-({else})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_point')})&amp;target_c_member_id=({$item.c_member_id})">({$item.profile.PNE_POINT.value|default:0})</a>({/if})</td>
			({/if})
			<td class="cell05">({if $item.access_date != '0000-00-00 00:00:00'})({$item.access_date|date_format:"%y-%m-%d %H:%M"})({else})未ログイン({/if})</td>
			<td class="cell06">({if $item.r_date != '0000-00-00 00:00:00'})({$item.r_date|date_format:"%y-%m-%d"})({else})&nbsp;({/if})</td>
			<td class="cell07">({if $item.c_member_id_invite})({$item.c_member_id_invite}):<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_member_detail')})&amp;target_c_member_id=({$item.c_member_id_invite})">({$item.c_member_invite.nickname})</a>({else})&nbsp;({/if})</td>
			<td class="cell08A">({if $item.image_filename_1})<a href="({t_img_url filename=$item.image_filename_1})" target="_blank"><img src="modules/admin/img/icn_image_on.gif" alt="画像有り" /></a>({else})<img src="modules/admin/img/icn_image_off.gif" alt="画像無し" />({/if})</td>
			<td class="cell08B">({if $item.image_filename_2})<a href="({t_img_url filename=$item.image_filename_2})" target="_blank"><img src="modules/admin/img/icn_image_on.gif" alt="画像有り" /></a>({else})<img src="modules/admin/img/icn_image_off.gif" alt="画像無し" />({/if})</td>
			<td class="cell08C">({if $item.image_filename_3})<a href="({t_img_url filename=$item.image_filename_3})" target="_blank"><img src="modules/admin/img/icn_image_on.gif" alt="画像有り" /></a>({else})<img src="modules/admin/img/icn_image_off.gif" alt="画像無し" />({/if})</td>
			<td class="cell09A">({if $item.birth_year})({$item.birth_year})({else})&nbsp;({/if})</td>
			<td class="cell09B">({if $item.birth_month})({$item.birth_month})({else})&nbsp;({/if})</td>
			<td class="cell09C">({if $item.birth_day})({$item.birth_day})({else})&nbsp;({/if})</td>
			({foreach from=$c_profile_list item=prof})
			({if $prof.name !== 'PNE_POINT'})
			<td>({strip})
			({if $prof.form_type == "checkbox"})
				({$item.profile[$prof.name].value|@t_implode:","|t_truncate:30})
			({else})
				({$item.profile[$prof.name].value|t_truncate:30})
			({/if})
			({/strip})</td>
			({/if})
			({/foreach})
			<td class="cell16">({if $item.secure.pc_address})<a href="mailto:({$item.secure.pc_address|escape:"hexentity"})">({$item.secure.pc_address|t_truncate:"30"|escape:"hexentity"})</a>({else})&nbsp;({/if})</td>
			<td class="cell17">({if $item.secure.ktai_address})<a href="mailto:({$item.secure.ktai_address})">({$item.secure.ktai_address|t_truncate:"30"})</a>({else})&nbsp;({/if})</td>
			<td class="cell18">({if $item.secure.regist_address})({$item.secure.regist_address})({else})&nbsp;({/if})</td>
			<td class="cell18">({if $item.secure.easy_access_id})({$item.secure.easy_access_id})({else})&nbsp;({/if})</td>
			<td class="cell15">({$item.c_member_id})</td>
		</tr>
		({/foreach})
	</tbody>
</table>
<div class="listControlBtm">
<div class="msgTransmit">
<p class="msgCheck"><img src="modules/admin/img/icn_msgtransmit.gif" alt="dummy" /><a href="#" onClick="return checkAll('formSendMessages');" onKeyPress="return checkAll('formSendMessages');">全てをチェック</a>&nbsp;|&nbsp;<a href="#" onClick="return clearAll('formSendMessages');" onKeyPress="return clearAll('formSendMessages');">全てのチェックをはずす</a></p>

<div class="msgTransmitBtn">
<input type="submit" id="btnSelTransmit" value="選択したメンバーにメッセージ／Eメールを送る" />
</form>

<form action="./" method="post" name="formSendMessagesSearch">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
({if $cond})
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_search')})" />
({foreach from=$cond_list key=key item=item})
({if is_array($item)})
({foreach from=$item key=profile_key item=profile})
    ({if is_array($profile)})
        ({foreach from=$profile item=check})
            <input type="hidden" name="profile[({$profile_key})][]" value="({$check})" />
        ({/foreach})
    ({else})
        <input type="hidden" name="profile[({$profile_key})]" value="({$profile})" />
    ({/if})
({/foreach})
({else})
<input type="hidden" name="cond[({$key})]" value="({$item})" />
({/if})
({/foreach})
({else})
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_all')})" />
({/if})
<input type="submit" id="btnNarrowTransmit" value="絞り込んだメンバーにメッセージ／Eメールを送る" />
</form>

<form action="./" method="post" name="formSendMessagesAll">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_all')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="submit" id="btnAllTransmit" value="すべてのメンバーにメッセージ／Eメールを送る" />
</form>

<form action="./" method="get" name="formSendMessagesIDList">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_id_list')})">
<input type="submit" id="btnSelectUser" value="メンバーを指定してメッセージ／Eメールを送る">
</form>

<form action="./" method="post" name="formSendMessagesHistory">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('send_messages_history_list')})">
<input type="submit" id="btnHistoryMessage" value="メッセージ／Eメール送信履歴">
</form>

</div>({*/div class="msgTransmitBtn"*})
</div>({*/div class="msgTransmit"*})


({if $pager})
<div class="listNavi">
<p class="listMove">
({if $pager.prev_page})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">前へ</a>({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})&nbsp;|&nbsp;<strong>({$i})</strong>({else})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$i})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">({$i})</a>({/if})
({/foreach})
({if $pager.next_page})&nbsp;|&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})&amp;order=({$requests.order})({$cond})">次へ</a>
({/if})
</p>
<p class="display">({$pager.total_num}) 人中 ({$pager.start_num}) - ({$pager.end_num})人目を表示しています</p>
</div>({*/div class="listNaviBtm"*})

({/if})
</div>({*/div class="listControlBtm"*})

</div>({*/div class="userList"*})

<p class="caution">※パスワード、秘密の質問の答えは不可逆な暗号化を施してデータベースへ保存しているため、元の文字列を知ることができません。</p>
({$inc_footer|smarty:nodefaults})
