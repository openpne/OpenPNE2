({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">秘密の質問・答え設定</font></center>
<hr>
◆秘密の質問・答えの変更<br>
<br>
パスワードを忘れた場合に、パスワードを再発行するための秘密の質問とその答えを設定することができます。<br>
<br>
({if $msg})
<font color="red">({$msg})</font><br>
<br>
({/if})
({t_form m=ktai a=do_h_config_password_query_update_password_query})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
現在のパスワード：<br>
<input type="text" name="password" istyle="3" mode="alphabet" maxlength="12"><br>
<br>
秘密の質問：<br>
<select name="c_password_query_id">
<option value="0">選択してください
({foreach from=$password_query_list key=key item=item})
<option value="({$key})">({$item})
({/foreach})
</select><br>
秘密の質問の答え：<br>
<input type="text" name="password_query_answer"><br>
<input type="submit" value="設定"><br>
</form>

<hr>
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})