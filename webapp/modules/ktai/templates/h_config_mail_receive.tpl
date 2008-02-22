({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">メール受信設定</font></center>
<hr>
新着ﾒｯｾｰｼﾞの通知などを登録携帯メールアドレスにお知らせします。 <br>
※PCメールアドレスの受信設定はここでは変更されません。PC版で設定をおこなってください。<br>
<br>
({t_form m=ktai a=do_h_config_mail_receive_update_mail_receive})
<input type="hidden" name="ksid" value="({$PHPSESSID})">

<input type="radio" name="is_receive_ktai_mail" value="1"({if $c_member.is_receive_ktai_mail}) checked="checked"({/if})>
受け取る<br>
<input type="radio" name="is_receive_ktai_mail" value="0"({if !$c_member.is_receive_ktai_mail}) checked="checked"({/if})>
受け取らない<br>

<input type="submit" value="変更"><br>
</form>

<hr>
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
