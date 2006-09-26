({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">日記の公開範囲設定</font></center>
<hr>
日記を公開する範囲を設定することができます。<br>
<br>
({t_form m=ktai a=do_h_config_public_flag_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="radio" name="public_flag_diary" value="public"({if $c_member.public_flag_diary=="public"}) checked="checked"({/if})>
全体に公開<br>
<input type="radio" name="public_flag_diary" value="friend"({if $c_member.public_flag_diary=="friend"}) checked="checked"({/if})>
({$WORD_MY_FRIEND_HALF})まで公開<br>
<input type="radio" name="public_flag_diary" value="close"({if $c_member.public_flag_diary == "close"}) checked="checked"({/if})>
公開しない<br>
<input type="submit" value="変更"><br>
</form>

<hr>
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
