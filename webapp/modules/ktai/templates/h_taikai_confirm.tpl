({$inc_ktai_header|smarty:nodefaults})

<center>退会手続き</center>
<hr>
本当に退会してもよろしいですか？<br>
<br>
退会する場合は、確認のためパスワードを入力してください。<br>
({if $msg})<font color="red">({$msg})</font><br>({/if})

({t_form m=ktai a=do_h_taikai})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
パスワード<br>
<input type="text" name="password" istyle="3" mode="alphabet" maxlength="12"><br>
<textarea name="reason"></textarea><br>

<input type="submit" value="退会する"><br>
</form>

<hr>
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})