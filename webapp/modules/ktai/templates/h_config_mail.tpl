({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">携帯ﾒｰﾙｱﾄﾞﾚｽ変更</font></center>
<hr>
◆登録ﾒｰﾙｱﾄﾞﾚｽ(携帯電話)の変更<br>
<br>
({if $msg})
<font color="red">({$msg})</font><br>
<br>
({/if})
新しい携帯ﾒｰﾙｱﾄﾞﾚｽを入力して送信ボタンを押してください。<br>
<br>
({t_form m=ktai a=do_h_config_mail_insert_c_ktai_address_pre})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<textarea name="ktai_address" rows="1" istyle="3" mode="alphabet" maxlength="100"></textarea><br>
<input type="submit" value="メール送信"><br>
</form>

<br>
届いたメールに記載してあるURLにアクセスして、パスワードを入力すると変更が完了します。

<hr>
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})