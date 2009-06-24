({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="`$WORD_COMMUNITY`詳細"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>({$WORD_COMMUNITY})詳細</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$commu.c_commu_id})
</td>
</tr>
({****})
<tr>
<th>({$WORD_COMMUNITY})名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$commu.c_commu_id})" target="_blank">({$commu.name})</a>
</td>
</tr>
({****})
<tr>
<th>管理者</th>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_member_detail')})&amp;target_c_member_id=({$commu.c_member_id_admin})">({$commu.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>参加者数</th>
<td>
({$commu.member_count})
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$commu.r_datetime})
</td>
</tr>
({****})
<tr>
<th>({$WORD_COMMUNITY})画像</th>
<td>
<p class="photo">
<img src="({t_img_url filename=$commu.image_filename w=180 h=180 noimg=no_logo})" class="pict" alt="({$WORD_COMMUNITY})写真" />
</p>
</td>
</tr>
({****})
<tr>
<th>({$WORD_COMMUNITY})説明文</th>
<td width="500">
({if $smarty.const.OPENPNE_ADMIN_CONVERT_URL})
({$commu.info|nl2br|t_url2cmd:'community':$commu.c_member_id_admin|t_cmd:'community'})
({else})
({$commu.info|nl2br})
({/if})
</td>
</tr>
({****})
</tbody>
</table>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_commu')})" />
<input type="hidden" name="target_c_commu_id" value="({$commu.c_commu_id})" />
<span class="textBtnS"><input type="submit" value="　削　除　" /></span>
</form>

({$inc_footer|smarty:nodefaults})
