({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">日記の公開範囲設定</font></center>
<hr>
日記作成画面であらかじめ選択されている値となります。<br>
また、メール投稿で書かれた日記はここで設定した公開範囲になります。<br>
<br>
※これまでに書かれた日記の公開範囲は変更されません。<br>
<br>
({t_form m=ktai a=do_h_config_public_flag_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="radio" name="public_flag_diary" value="public"({if $c_member.public_flag_diary=="public"}) checked="checked"({/if})>
全体に公開<br>
<input type="radio" name="public_flag_diary" value="friend"({if $c_member.public_flag_diary=="friend"}) checked="checked"({/if})>
({$WORD_MY_FRIEND_HALF})まで公開<br>
<input type="radio" name="public_flag_diary" value="private"({if $c_member.public_flag_diary == "private"}) checked="checked"({/if})>
公開しない<br>
<input type="submit" value="変更"><br>
</form>

<hr>

これまでに書かれた日記の公開設定を一括で変更します。<br>
<br>
({t_form m=ktai a=page_h_set_public_flag_all_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="radio" name="public_flag_diary_all" value="public" checked="checked">
全体に公開<br>
<input type="radio" name="public_flag_diary_all" value="friend">
({$WORD_MY_FRIEND_HALF})まで公開<br>
<input type="radio" name="public_flag_diary_all" value="private">
公開しない<br>
<input type="submit" value="一括変更"><br>
</form>

<hr>
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
