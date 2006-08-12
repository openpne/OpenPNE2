({$inc_header|smarty:nodefaults})

<h2>プロフィール項目削除</h2>

<p>本当に削除してもよろしいですか？</p>
<p class="caution">※この項目に対するユーザーの入力値も失われます。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_profile','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="c_profile_id" value="({$requests.c_profile_id})">
<input type="submit" class="submit" value="削除">
</form>

({$inc_footer|smarty:nodefaults})