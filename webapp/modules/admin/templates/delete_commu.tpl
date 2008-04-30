({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="`$WORD_COMMUNITY`削除の確認"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>({$WORD_COMMUNITY})削除の確認</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>本当に削除しますか？</p>

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
<a href="({t_url _absolute=1 m=pc a=page_fh_diary})&amp;target_c_commu_id=({$commu.c_commu_id})" target="_blank">({$commu.name})</a>
</td>
</tr>
({****})
<tr>
<th>管理者</th>
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
<th>({$WORD_COMMUNITY})説明文</th>
<td width="500">
({if $commu.image_filename})
<div>
({if $commu.image_filename})<span class="padding_s"><a href="({t_img_url filename=$commu.image_filename})" target="_blank"><img src="({t_img_url filename=$commu.image_filename w=120 h=120})"></a></span>({/if})
</div>
({/if})
({if $smarty.const.OPENPNE_ADMIN_CONVERT_URL})
({$commu.info|nl2br|t_url2cmd:'community'|t_cmd:'community'})
({else})
({$commu.info|nl2br})
({/if})
</td>
</tr>
({****})
</tbody>
</table>

<form action="./" method="post">
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_kakikomi_c_commu','do')})" />
<input type="hidden" name="target_c_commu_id" value="({$commu.c_commu_id})" />
<span class="textBtnS"><input type="submit" value="削除する" /></span>
</form>

({$inc_footer|smarty:nodefaults})
