({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">
({if !$target_c_album.c_album_id})
ｱﾙﾊﾞﾑの作成</a></font><br>
({else})
ｱﾙﾊﾞﾑの編集</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$target_c_album.subject})</font><br>
({/if})
</td></tr></table>

({if !$target_c_album.c_album_id})
[i:106]<a href="mailto:({$album_address})?subject=ここにﾀｲﾄﾙを書いてね&body=ここにｱﾙﾊﾞﾑの説明文を書いてね">ﾒｰﾙで投稿</a><br>
写真を添付すると表紙付きｱﾙﾊﾞﾑになります。<br>
<font color="#({$ktai_color_config.font_09})">※ﾒｰﾙ投稿では絵文字が反映されません</font>
<hr color="#({$ktai_color_config.border_01})">
({/if})

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})

({t_form m=ktai a=do_h_album_edit_insert_c_album})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
({if $target_c_album.c_album_id})<input type="hidden" name="target_c_album_id" value="({$target_c_album.c_album_id})">({/if})
<font color="#({$ktai_color_config.font_06})">ﾀｲﾄﾙ：</font><br>
<input name="subject" value="({$target_c_album.subject})"><br>
<br>
<font color="#({$ktai_color_config.font_06})">説明文：</font><br>
<textarea name="description" rows="6">({$target_c_album.description})</textarea><br>
<br>
({if $target_c_album.c_album_id})
<font color="#({$ktai_color_config.font_06})">表紙：</font><br>
[i:68]<a href="({t_url m=ktai a=page_h_album_cover_image_edit})&amp;target_c_album_id=({$target_c_album.c_album_id})&amp;({$tail})">表紙を編集する</a><br>
<br>
({/if})
<font color="#({$ktai_color_config.font_06})">公開範囲：</font><br>
<input type="radio" name="public_flag" value="public"({if $target_c_album.public_flag == "public"}) checked="checked"({/if})>全員に公開<br>
<input type="radio" name="public_flag" value="friend"({if $target_c_album.public_flag == "friend"}) checked="checked"({/if})>({$WORD_MY_FRIEND_HALF})まで公開<br>
<input type="radio" name="public_flag" value="private"({if $target_c_album.public_flag == "private"}) checked="checked"({/if})>公開しない<br>
<br>

<center>
<input type="submit" value="({if !$target_c_album.c_album_id})作成({else})登録({/if})する"><br>
</center>
</form>
<br>

({if $target_c_album.c_album_id})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">ｱﾙﾊﾞﾑの削除</font><br>
</td></tr></table>
このｱﾙﾊﾞﾑと写真をすべて削除します。
<hr color="#({$ktai_color_config.border_01})">
({t_form m=ktai a=page_h_album_delete_c_album_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_album_id" value="({$target_c_album.c_album_id})">
<center>
<input type="submit" value="ｱﾙﾊﾞﾑを削除する">
</center>
</form>
({/if})

<hr color="#({$ktai_color_config.border_01})">
({if $target_c_album.c_album_id})
[i:68]<a href="({t_url m=ktai a=page_fh_album})&amp;target_c_album_id=({$target_c_album.c_album_id})&amp;({$tail})">このｱﾙﾊﾞﾑを見る</a><br>
({/if})
[i:90]<a href="({t_url m=ktai a=page_fh_album_list})&amp;({$tail})">ｱﾙﾊﾞﾑﾘｽﾄ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
