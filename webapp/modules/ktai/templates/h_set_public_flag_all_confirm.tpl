({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">日記公開範囲の一括変更</font></center>
<hr>

これまでに書かれた日記の公開設定を一括で変更します。よろしいですか。<br>
<br>

({t_form m=ktai a=do_h_set_public_flag_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="public_flag_diary_all" value="({$public_flag_diary_all})">
変更内容：<br>
({if $public_flag_diary_all == 'private'})
公開しない
({elseif $public_flag_diary_all == 'friend'})
({$smarty.const.WORD_MY_FRIEND_HALF})まで公開
({else})
全員に公開
({/if})<br>
<br>
<input type="submit" class="submit" value="一括変更">
</form>

<hr>
<a href="({t_url m=ktai a=page_h_config_public_flag_diary})&amp;({$tail})">日記の公開範囲設定へ戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
