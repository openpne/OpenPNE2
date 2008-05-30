({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_DIARY_HALF})公開範囲の一括変更</font><br>
</td></tr></table>

これまでに書かれた({$WORD_DIARY_HALF})の公開設定を以下の通りに一括で変更します。よろしいですか?<br>
<br>
<font color="#({$ktai_color_config.font_06})">変更内容：</font><br>
({if $public_flag_diary_all == 'private'})
公開しない
({elseif $public_flag_diary_all == 'friend'})
({$WORD_MY_FRIEND_HALF})まで公開
({else})
全員に公開
({/if})<br>

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=do_h_set_public_flag_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="public_flag_diary_all" value="({$public_flag_diary_all})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai a=page_h_config_public_flag_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="submit" value="　いいえ　">
</form>
</center>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
