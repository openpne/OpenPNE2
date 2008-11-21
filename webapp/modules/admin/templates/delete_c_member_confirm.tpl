({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="強制退会の確認"})
({assign var="parent_page_name" value="メンバーリスト"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2 id="ttl01">強制退会の確認</h2>
<div class="contents">
<p class="caution" id="c01">本当にこのメンバーを強制退会させてもよろしいですか？</p>
<ul class="cautionList">
    <li class="caution" ><strong>※強制退会させると、このメンバーに関する情報は削除され元に戻すことはできません。</strong></li>
    <li class="caution" ><strong>※このメンバーが管理者になっている({$WORD_COMMUNITY})があれば、副管理者に管理権限が移管されます。また、副管理者がいない場合は参加日時のもっとも早いメンバーに権限が移管されます。</strong></li>
</ul>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_member','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target_c_member_id" value="({$c_member.c_member_id})" />
<p class="textBtn"><input type="submit" value="強制退会させる" /></p>
</form>
<p id="userImg">({if $c_member.image_filename_1})<a href="({t_img_url filename=$c_member.image_filename_1})" target="_blank"><img src="({t_img_url filename=$c_member.image_filename_1 w=120 h=120})"></a>({/if})({if $c_member.image_filename_2})<a href="({t_img_url filename=$c_member.image_filename_2})" target="_blank"><img src="({t_img_url filename=$c_member.image_filename_2 w=120 h=120})"></a>({/if})({if $c_member.image_filename_3})<a href="({t_img_url filename=$c_member.image_filename_3})" target="_blank"><img src="({t_img_url filename=$c_member.image_filename_3 w=120 h=120})"></a>({/if})</p>
<table class="userDetailTable">
	<tbody>
	<tr>
		<th>ID</th>
		<td>({$c_member.c_member_id})</td>
	</tr>
	<tr>
		<th>({$WORD_NICKNAME})</th>
		<td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})" target="_blank">({$c_member.nickname})</a></td>
	</tr>
	<tr>
		<th>最終ログイン</th>
		<td>({if $c_member.access_date != '0000-00-00 00:00:00'})({$c_member.access_date|date_format:"%y-%m-%d %H:%M"})({else})未ログイン({/if})</td>
	</tr>
	<tr>
		<th>登録日</th>
		<td>({$c_member.r_date|date_format:"%y-%m-%d"})</td>
	</tr>
	<tr>
		<th>生年月日</th>
		<td>({if $c_member.birth_year})({$c_member.birth_year})年({else})&nbsp;({/if})({if $c_member.birth_month})({$c_member.birth_month})月({else})&nbsp;({/if})({if $c_member.birth_day})({$c_member.birth_day})日({else})&nbsp;({/if})</td>
	</tr>
	({foreach from=$c_profile_list item=prof})
	({if $item.value !== ''})
	<tr>
		<th>({$prof.caption})</th>
		<td>({if $prof.form_type == checkbox})({$c_member.profile[$prof.name].value|@t_implode:", "})({else})({$c_member.profile[$prof.name].value|t_truncate:60|nl2br})({/if})</td>
	</tr>
	({/if})
	({/foreach})
	<tr>
		<th>PCメールアドレス</th>
		<td>({if $c_member.secure.pc_address})<a href="mailto:({$c_member.secure.pc_address|escape:"hexentity"})">({$c_member.secure.pc_address|t_truncate:"30"|escape:"hexentity"})</a>({else})&nbsp;({/if})</td>
	</tr>
	<tr>
		<th>携帯メールアドレス</th>
		<td>({if $c_member.secure.ktai_address})<a href="mailto:({$c_member.secure.ktai_address})">({$c_member.secure.ktai_address|t_truncate:"30"})</a>({else})&nbsp;({/if})</td>
	</tr>
	<tr>
		<th>登録メールアドレス</th>
		<td>({if $c_member.secure.regist_address})({$c_member.secure.regist_address})({else})&nbsp;({/if})</td>
	</tr>
	</tbody>
</table>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">メンバーリストに戻る</a></p>
({$inc_footer|smarty:nodefaults})
