({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="コミュニティ削除"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>コミュニティ削除</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

このコミュニティを削除します。削除後に復元させることはできないので注意してください。

<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_commu')})" />
<input type="hidden" name="target_c_commu_id" value="({$commu.c_commu_id})" />
<span class="textBtnS"><input type="submit" value="削除" /></span>
</form>

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
<th>コミュニティ名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_commu_id=({$commu.c_commu_id})" target="_blank">({$commu.name})</a>
</td>
</tr>
({****})
<tr>
<th>作成者</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$commu.c_member_id_admin})" target="_blank">({$commu.c_member.nickname})</a>
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
<th>コミュニティ説明文</th>
<td width="500">
({$commu.info|t_truncate:"120"|nl2br})
</td>
</tr>
({****})
</tbody>
</table>

({$inc_footer|smarty:nodefaults})
