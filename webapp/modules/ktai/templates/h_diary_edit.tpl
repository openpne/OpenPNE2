({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">
({if !$target_c_diary.c_diary_id})
日記の作成</a></font><br>
({else})
日記の編集</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
({$target_c_diary.subject})<br>
({/if})
</td></tr></table>

%%i106%%<a href="mailto:({$blog_address})">ﾒｰﾙで投稿</a><br>
画像を添付すると写真付き日記になります。

<hr color="#0d6ddf">
({if $msg})
<font color="#ff0000">({$msg})</font><br>
<br>
({/if})

({t_form m=ktai a=do_h_diary_edit_insert_c_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
({if $target_c_diary.c_diary_id})<input type="hidden" name="target_c_diary_id" value="({$target_c_diary.c_diary_id})">({/if})
<font color="#999966">ﾀｲﾄﾙ：</font><br>
<input size="14" name="subject" value="({$target_c_diary.subject})"><br>
<br>
<font color="#999966">本文：</font><br>
<textarea name="body" rows="6" cols="14">({$target_c_diary.body})</textarea><br>
<br>
<font color="#999966">公開範囲：</font><br>
<input type="radio" name="public_flag" value="public"({if $target_c_diary.public_flag == "public"}) checked="checked"({/if})>全員に公開<br>
<input type="radio" name="public_flag" value="friend"({if $target_c_diary.public_flag == "friend"}) checked="checked"({/if})>({$WORD_MY_FRIEND_HALF})まで公開<br>
<input type="radio" name="public_flag" value="private"({if $target_c_diary.public_flag == "private"}) checked="checked"({/if})>公開しない<br>
<br>

<center>
<input type="submit" value="日記を({if !$target_c_diary.c_diary_id})作成({else})編集({/if})する"><br>
</center>
</form>
<br>

({if $target_c_diary.c_diary_id})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee">日記の削除</font><br>
</td></tr></table>
この日記とｺﾒﾝﾄをすべて削除します。
<hr color="#0d6ddf">
({t_form m=ktai a=page_fh_diary_delete_c_diary_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary.c_diary_id})">
<center>
<input type="submit" value="日記を削除する">
</center>
({/if})

<hr color="#0d6ddf">
%%i90%%<a href="({t_url m=ktai a=page_fh_diary_list})&amp;({$tail})">日記ﾘｽﾄ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
