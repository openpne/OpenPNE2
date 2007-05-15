({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">携帯ﾒｰﾙｱﾄﾞﾚｽ登録</font></center>
<hr>
◆登録ﾒｰﾙｱﾄﾞﾚｽ(携帯電話)の登録<br>
<br>
({if $msg})
<font color="red">({$msg})</font><br>
<br>
({/if})
携帯ﾒｰﾙｱﾄﾞﾚｽを入力して送信ボタンを押してください。<br>
<br>
({t_form m=ktai a=do_h_regist_address})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<textarea name="ktai_address" rows="1" istyle="3" mode="alphabet" maxlength="100"></textarea><br>
<input type="submit" value="メール送信"><br>
</form>

<br>
届いたメールに記載してあるURLにアクセスして、パスワードを入力すると登録が完了します。

<hr>

({$inc_ktai_footer|smarty:nodefaults})