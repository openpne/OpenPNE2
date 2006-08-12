({$inc_header|smarty:nodefaults})

<p>本当にこのユーザーを強制退会させてもよろしいですか？</p>
<p class="caution">※強制退会させると、このユーザーに関する情報は削除され元に戻すことはできません。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_member','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_member_id" value="({$c_member.c_member_id})">
<input type="submit" class="submit" value="強制退会させる">
</form>

<p><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">ユーザーリストにもどる</a></p>

({if $c_member.image_filename_1})<a href="({t_img_url filename=$c_member.image_filename_1})" target="_blank"><img src="({t_img_url filename=$c_member.image_filename_1 w=120 h=120})"></a>({/if})
({if $c_member.image_filename_2})<a href="({t_img_url filename=$c_member.image_filename_2})" target="_blank"><img src="({t_img_url filename=$c_member.image_filename_2 w=120 h=120})"></a>({/if})
({if $c_member.image_filename_3})<a href="({t_img_url filename=$c_member.image_filename_3})" target="_blank"><img src="({t_img_url filename=$c_member.image_filename_3 w=120 h=120})"></a>({/if})

<table>
<tr>
<th>ID</th>
<td>({$c_member.c_member_id})</td>
</tr>
<tr>
<th>ニックネーム</th>
<td><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})" target="_blank">({$c_member.nickname})</a></td>
</tr>
<tr>
<th>最終ログイン</th>
<td>({$c_member.access_date|date_format:"%y-%m-%d %H:%M"})</td>
</tr>
<tr>
<th>登録日</th>
<td>({$c_member.r_date|date_format:"%y-%m-%d"})</td>
</tr>
<tr>
<th>生年月日</th>
<td>({if $c_member.birth_year})({$c_member.birth_year})年({else})&nbsp;({/if})
({if $c_member.birth_month})({$c_member.birth_month})月({else})&nbsp;({/if})
({if $c_member.birth_day})({$c_member.birth_day})日({else})&nbsp;({/if})</td>
</tr>
({foreach from=$c_profile_list item=prof})
<tr>
<th>({$prof.caption})</th>
<td>({$c_member.profile[$prof.name].value|t_truncate:60|nl2br})</td>
</tr>
({/foreach})
<tr>
<th>PCアドレス</th>
<td>({if $c_member.secure.pc_address})<a href="mailto:({$c_member.secure.pc_address|escape:"hexentity"})">({$c_member.secure.pc_address|t_truncate:"30"|escape:"hexentity"})</a>({else})&nbsp;({/if})</td>
</tr>
<tr>
<th>携帯アドレス</th>
<td>({if $c_member.secure.ktai_address})<a href="mailto:({$c_member.secure.ktai_address})">({$c_member.secure.ktai_address|t_truncate:"30"})</a>({else})&nbsp;({/if})</td>
</tr>
<tr>
<th>登録アドレス</th>
<td>({if $c_member.secure.regist_address})({$c_member.secure.regist_address})({else})&nbsp;({/if})</td>
</tr>
</table>

({$inc_footer|smarty:nodefaults})