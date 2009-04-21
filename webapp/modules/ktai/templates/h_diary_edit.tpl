({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">
({if !$target_c_diary.c_diary_id})
({$WORD_DIARY_HALF})の作成</a></font><br>
({else})
({$WORD_DIARY_HALF})の編集</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$target_c_diary.subject})</font><br>
({/if})
</td></tr></table>

({if !$target_c_diary.c_diary_id && !$target_c_diary.body})
[i:106]<a href="mailto:({$blog_address})">ﾒｰﾙで投稿</a><br>
写真を添付すると写真付き({$WORD_DIARY_HALF})になります。<br>
<font color="#({$ktai_color_config.font_09})">※ﾒｰﾙ投稿では絵文字が反映されません</font>
<hr color="#({$ktai_color_config.border_01})">
({/if})

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})

({t_form m=ktai a=do_h_diary_edit_insert_c_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
({if $target_c_diary.c_diary_id})<input type="hidden" name="target_c_diary_id" value="({$target_c_diary.c_diary_id})">({/if})
<font color="#({$ktai_color_config.font_06})">ﾀｲﾄﾙ：</font><br>
<input name="subject" value="({$target_c_diary.subject})"><br>
<br>
<font color="#({$ktai_color_config.font_06})">本文：</font><br>
<textarea name="body" rows="6">({$target_c_diary.body})</textarea><br>
<br>
({if $target_c_diary.c_diary_id})
<font color="#({$ktai_color_config.font_06})">写真：</font><br>
[i:68]<a href="({t_url m=ktai a=page_h_diary_edit_image})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;({$tail})">写真を編集する</a><br>
<br>
({/if})
<font color="#({$ktai_color_config.font_06})">公開範囲：</font><br>
<input type="radio" name="public_flag" value="public"({if $target_c_diary.public_flag == "public"}) checked="checked"({/if})>全員に公開<br>
<input type="radio" name="public_flag" value="friend"({if $target_c_diary.public_flag == "friend"}) checked="checked"({/if})>({$WORD_MY_FRIEND_HALF})まで公開<br>
<input type="radio" name="public_flag" value="private"({if $target_c_diary.public_flag == "private"}) checked="checked"({/if})>公開しない<br>
<br>

({if $smarty.const.OPENPNE_USE_DIARY_COMMENT})
<font color="#({$ktai_color_config.font_06})">ｺﾒﾝﾄ許可：</font><br>
<input type="checkbox" name="is_comment_input" value="1"({if $target_c_diary.is_comment_input}) checked="checked"({/if})>許可する<br>
<br>
({/if})

<center>
<input type="submit" value="({$WORD_DIARY_HALF})を({if !$target_c_diary.c_diary_id})作成({else})編集({/if})する"><br>
</center>
</form>
<br>

({if $target_c_diary.c_diary_id})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">({$WORD_DIARY_HALF})の削除</font><br>
</td></tr></table>
この({$WORD_DIARY_HALF})とｺﾒﾝﾄをすべて削除します。
<hr color="#({$ktai_color_config.border_01})">
({t_form m=ktai a=page_fh_diary_delete_c_diary_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary.c_diary_id})">
<center>
<input type="submit" value="({$WORD_DIARY_HALF})を削除する">
</center>
</form>
({/if})

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_fh_diary_list})&amp;({$tail})">({$WORD_DIARY_HALF})ﾘｽﾄ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
