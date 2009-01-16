({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="携帯個体識別番号のブラックリスト編集確認"})
({assign var="parent_page_name" value="ブラックリスト管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})({/capture})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>携帯個体識別番号のブラックリスト編集確認</h2>
<div class="contents">

<p>以下の内容に編集します。よろしいですか？</p>
<p class="caution">※ブラックリストに追加されたメンバーは、ログイン・新規登録が制限されます。</p>

<table class="basicType2">
<tbody>
<tr>
<th>携帯個体識別番号(暗号化済)</th>
<td>({$easy_access_id})</td>
</tr>
<tr>
<th>該当するメンバー</th>
<td>({if $member})<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})" target="_blank">({$member.nickname})</a>({else})&nbsp;({/if})</td>
</tr>
<tr>
<th>備考</th>
<td width="250">({$info|nl2br})</td>
</tr>
</tbody>
</table>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_blacklist','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target_c_blacklist_id" value="({$target_c_blacklist_id})" />
<input type="hidden" name="easy_access_id" value="({$easy_access_id})" />
<input type="hidden" name="info" value="({$info})" />
<p class="textBtn"><input type="submit" class="submit" value="　は　い　" /></p>
</form>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('blacklist_edit')})" />
<input type="hidden" name="target_c_blacklist_id" value="({$target_c_blacklist_id})" />
<input type="hidden" name="easy_access_id" value="({$easy_access_id})" />
<input type="hidden" name="info" value="({$info})" />
<p class="textBtn"><input type="submit" class="submit" value="　いいえ　" /></p>
</form>

({$inc_footer|smarty:nodefaults})
