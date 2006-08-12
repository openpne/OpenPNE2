({$inc_ktai_header|smarty:nodefaults})

<center>メールアドレス登録</center>
<hr>

({if $msg})
<font color="red">({$msg})</font><br>
<br>
({/if})

パスワードを入力してください。<br>
<br>

({t_form m=ktai a=do_o_update_ktai_address})
<input type="hidden" name="ses" value="({$ses})">
携帯ﾒｰﾙｱﾄﾞﾚｽ<br>
({$pre.ktai_address})<br>
ﾊﾟｽﾜｰﾄﾞ<br>
<input name="password" type="text" istyle="3" mode="alphabet" value=""><br>
<input name="submit" value="送信" type="submit"><br>
</form>

<hr>

({$inc_ktai_footer|smarty:nodefaults})