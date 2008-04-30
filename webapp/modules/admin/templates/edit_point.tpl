({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="メンバーリスト：ポイント強制変更"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>ポイント強制変更</h2>

<div class="contents">

<p>選択したメンバーのポイントを強制的に変更します。</p>

<form action="./" method="post" enctype="multipart/form-data">
<table class="basicType2">
<tbody>
<tr>
<th>メンバーID</th>
<td>({$item.c_member_id})</td>
</tr>
<tr>
<th>({$WORD_NICKNAME})</th>
<td><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a></td>
</tr>
<tr>
<th>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_point','do')})" />
<input type="hidden" name="target_c_member_id" value="({$item.c_member_id})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
ポイント</th>
<td>
<input type="text" name="point" value="({$point})"></td>
</tr>
<tr>
<td colspan="3" align="right"><span class="textBtnS"><input type="submit" class="submit" value="　変　更　"></span></td>
</tr>
</tbody>
</table>
</form>

({$inc_footer|smarty:nodefaults})
