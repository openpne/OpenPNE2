({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_DIARY_HALF})の公開範囲設定</font><br>
</td></tr></table>
({$WORD_DIARY_HALF})作成画面であらかじめ選択されている値となります。<br>
また、ﾒｰﾙ投稿で書かれた({$WORD_DIARY_HALF})はここで設定した公開範囲になります。<br>
<br>
<font color="#({$ktai_color_config.font_06})">※これまでに書かれた({$WORD_DIARY_HALF})の公開範囲は変更されません。</font><br>
<hr color="#({$ktai_color_config.border_01})">
({t_form m=ktai a=do_h_config_public_flag_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="radio" name="public_flag_diary" value="public"({if $c_member.public_flag_diary=="public"}) checked="checked"({/if})>
全体に公開<br>
<input type="radio" name="public_flag_diary" value="friend"({if $c_member.public_flag_diary=="friend"}) checked="checked"({/if})>
({$WORD_MY_FRIEND_HALF})まで公開<br>
<input type="radio" name="public_flag_diary" value="private"({if $c_member.public_flag_diary == "private"}) checked="checked"({/if})>
公開しない<br>
<center>
<input type="submit" value="変更"><br>
</center>
</form>
<br>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
({$WORD_DIARY_HALF})公開範囲の一括設定<br>
</td></tr></table>
これまでに書かれた({$WORD_DIARY_HALF})の公開設定を一括で変更します。
<hr color="#({$ktai_color_config.border_01})">
({t_form m=ktai a=page_h_set_public_flag_all_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="radio" name="public_flag_diary_all" value="public" checked="checked">
全体に公開<br>
<input type="radio" name="public_flag_diary_all" value="friend">
({$WORD_MY_FRIEND_HALF})まで公開<br>
<input type="radio" name="public_flag_diary_all" value="private">
公開しない<br>
<center>
<input type="submit" value="一括変更"><br>
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
