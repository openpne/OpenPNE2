({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})
({assign var="page_name" value="ブラックリストメンバー編集確認"})
({assign var="parent_page_name" value="ブラックリストメンバー管理"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})({/capture})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>ブラックリストメンバー編集確認</h2>
<div class="contents">
<p>ブラックリストメンバーを以下のデータに編集します。よろしいですか？</p>
<p class="caution">ブラックリストに追加された個体識別番号を持つユーザは、ログイン・新規登録が制限されます。</p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_blacklist','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input name="target_c_blacklist_id" type="hidden" value="({$target_c_blacklist_id})"/>
<input name="easy_access_id" type="hidden" value="({$easy_access_id})"/>
<input name="info" type="hidden" value="({$info})"/>

<table class="basicType2">
<tbody>
<tr>
<th>個体識別番号</th>
<td>({$easy_access_id})</td>
</tr>
<tr>
<th>該当するメンバー</th>
<td><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$member.c_member_id})" target="_blank">({$member.nickname})</a></td>
</tr>
<tr>
<th>メモ</th>
<td width="250">({$info|nl2br})</td>
</tr>
<tr>
<th>&nbsp;</th>
<td><p class="textBtn"><input type="submit" class="submit" value=" 編　集 " /></p></td>
</tr>
</tbody>
</table>
</form>

({$inc_footer|smarty:nodefaults})
