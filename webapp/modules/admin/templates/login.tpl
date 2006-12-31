({$inc_header|smarty:nodefaults})
({if $msg})<p class="actionMsg">({$msg})</p>({/if})

<div class="contents">

<p class="caution" id="c01">管理用のアカウント名とパスワードを入力してください。</p>

<form  action="./" method="post">
<dl>
<dt>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('login','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<strong class="item"><label for="username">管理者名</label></strong></dt>
<dd><input tabindex="1" name="username" id="username" type="text" size="20" /></dd>
<dt><strong class="item"><label for="password">パスワード</label></strong></dt>
<dd><input tabindex="2" name="password" id="password" type="password" size="20" /></dd>
<dd id="auto"><input tabindex="3" name="is_save" id="is_save" type="checkbox" value="1" /><label for="is_save">次回から自動的にログイン</label></dd>
<dd id="btn"><p class="textBtn"><input tabindex="4" type="submit" value="ログイン" /></p></dd>
</dl>
</form>
({$inc_footer|smarty:nodefaults})