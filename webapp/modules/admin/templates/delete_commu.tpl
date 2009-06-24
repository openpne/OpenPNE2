({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="$WORD_COMMUNITY削除の確認"})
({assign var="parent_page_name" value="$WORD_COMMUNITYリスト"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

<h2>({$WORD_COMMUNITY})削除の確認</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<p>本当に削除しますか？</p>

<form action="./" method="post">
({foreach from=$c_commu_list item=c_commu})
<input type="hidden" name="target_c_commu_ids[]" value="({$c_commu.c_commu_id})" />
<table class="basicType2">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
({$c_commu.c_commu_id})
</td>
</tr>
({****})
<tr>
<th>({$WORD_COMMUNITY})名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})" target="_blank">({$c_commu.name})</a>
</td>
</tr>
({****})
<tr>
<th>管理者</th>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_member_detail')})&amp;target_c_member_id=({$c_commu.c_member_id_admin})">({$c_commu.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$c_commu.r_datetime})
</td>
</tr>
({****})
<tr>
<th>({$WORD_COMMUNITY})説明文</th>
<td width="500">
({if $c_commu.image_filename})
<div>
({if $c_commu.image_filename})<span class="padding_s"><a href="({t_img_url filename=$c_commu.image_filename})" target="_blank"><img src="({t_img_url filename=$c_commu.image_filename w=120 h=120})"></a></span>({/if})
</div>
({/if})
({if $smarty.const.OPENPNE_ADMIN_CONVERT_URL})
({$c_commu.info|nl2br|t_url2cmd:'community':$c_commu.c_member_id_admin|t_cmd:'community'})
({else})
({$c_commu.info|nl2br})
({/if})
</td>
</tr>
({****})
</tbody>
</table>
({/foreach})

<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_commu','do')})" />
<span class="textBtnS"><input type="submit" value="削除する" /></span>
</form>

({$inc_footer|smarty:nodefaults})
