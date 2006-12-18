({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;メンバー管理：<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})">メンバーリスト</a>&nbsp;＞&nbsp;パスワード再発行</div>
</div>

({*ここまで:navi*})


({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>パスワード再発行</h2>
<div class="contents">

<p class="info"><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})" target="_blank">({$c_member.nickname})</a>さんのパスワードを変更します。</p>
<ul class="caution">
<li>パスワードは6～12文字の半角英数で入力してください。</li>
<li>パスワード変更ボタンを押すと、ユーザに新しいパスワードの書かれたメールが送信されます。</li>
</ul>

<form action="./" method="post">
<table>
<tr>
<th>
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('passwd','do')})" />
<input type="hidden" name="target_c_member_id" value="({$c_member.c_member_id})" />
新しいパスワード</th>
<td>：<input type="password" name="password" size="12" /></td>
</tr>
<tr>
<th>新しいパスワード(確認)</th>
<td>：<input type="password" name="password2" size="12" /></td>
</tr>
</table>
<p class="textBtn"><input type="submit" value="パスワード変更" /></p>
</form>

<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">前のページに戻る</a></p>
</div>
({$inc_footer|smarty:nodefaults})