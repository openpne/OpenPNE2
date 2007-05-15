({$inc_ktai_header|smarty:nodefaults})

<center>PCアドレス登録</center>
<hr>
以下の欄にPCメールアドレスを入力してください<br>
({t_form m=ktai a=do_h_pc_send_insert_c_pc_address_pre})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
PCﾒｰﾙｱﾄﾞﾚｽ<br>
<input type="text" name="pc_address" istyle="3" mode="alphabet" maxlength="100"><br>
<input type="submit" value="送信"><br>
</form>

<br>
届いたメールに記載してあるURLにアクセスして、パスワードを入力すると登録が完了します。

<hr>
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})