({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$target_diary_writer.nickname})さんの日記</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
({$target_c_diary.subject})<br>
</td></tr></table>

({if $c_siteadmin})
({$c_siteadmin|smarty:nodefaults})
({/if})
<a href="#({if $c_diary_comment})dc1({else})menu({/if})"><font color="#c49fff">▼</font></a>({$target_c_diary.r_datetime|date_format:"%y/%m/%d %H:%M"})({if $target_diary_writer.c_member_id==$u}) [<a href="({t_url m=ktai a=page_h_diary_edit})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;({$tail})">編集</a>][<a href="({t_url m=ktai a=page_fh_diary_delete_c_diary_confirm})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;({$tail})">削除</a>]({/if})<br>
({$target_c_diary.body|t_url2a_ktai|nl2br})
<br>
({if $target_c_diary.image_filename_1})
画像1を見る:[<a href="({t_img_url filename=$target_c_diary.image_filename_1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$target_c_diary.image_filename_1 f=jpg})">大</a>]<br>
({/if})
({if $target_c_diary.image_filename_2})
画像2を見る:[<a href="({t_img_url filename=$target_c_diary.image_filename_2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$target_c_diary.image_filename_2 f=jpg})">大</a>]<br>
({/if})
({if $target_c_diary.image_filename_3})
画像3を見る:[<a href="({t_img_url filename=$target_c_diary.image_filename_3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$target_c_diary.image_filename_3 f=jpg})">大</a>]<br>
({/if})

({if $type == "h"})
(({if $target_c_diary.public_flag == "public"})全員に公開({elseif $target_c_diary.public_flag == "friend"})({$WORD_MY_FRIEND_HALF})まで公開({elseif $target_c_diary.public_flag == "private"})公開しない({/if}))
({/if})

({if $c_diary_comment})
<hr color="#0d6ddf">
<center>
ｺﾒﾝﾄ（全({$total_num})件）<br>
({$pager.start})～({$pager.end})件目を表示
</center>

<table width="100%">
({foreach from=$c_diary_comment name=c_diary_comment item=c_diary_comment_})
<tr><td>
<hr color="#b3ceef">
</td></tr>
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<a href="#({if $smarty.foreach.c_diary_comment.last})menu({else})dc({$smarty.foreach.c_diary_comment.iteration+1})({/if})" name="dc({$smarty.foreach.c_diary_comment.iteration})"><font color="#c49fff">▼</font></a><font color="#999966">[({$c_diary_comment_.number|string_format:"%03d"})]</font>　({$c_diary_comment_.r_datetime|date_format:"%m/%d %H:%M"})
({if $c_diary_comment_.c_member_id == $u || $target_diary_writer.c_member_id==$u})
[<a href="({t_url m=ktai a=page_fh_diary_delete_c_diary_comment_confirm})&amp;target_c_diary_comment_id=({$c_diary_comment_.c_diary_comment_id})&amp;({$tail})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})">削除</a>]
({/if})<br>
({if $c_diary_comment_.nickname})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_diary_comment_.c_member_id})&amp;({$tail})">({$c_diary_comment_.nickname})</a>({/if})
<br>
({$c_diary_comment_.body|t_url2a_ktai|nl2br})
<br>
({if $c_diary_comment_.image_filename_1})
画像1を見る:[<a href="({t_img_url filename=$c_diary_comment_.image_filename_1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_diary_comment_.image_filename_1 f=jpg})">大</a>]<br>
({/if})
({if $c_diary_comment_.image_filename_2})
画像2を見る:[<a href="({t_img_url filename=$c_diary_comment_.image_filename_2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_diary_comment_.image_filename_2 f=jpg})">大</a>]<br>
({/if})
({if $c_diary_comment_.image_filename_3})
画像3を見る:[<a href="({t_img_url filename=$c_diary_comment_.image_filename_3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_diary_comment_.image_filename_3 f=jpg})">大</a>]<br>
({/if})
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">%%i128%%前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">%%i130%%次を表示</a>({/if})
<br>
</center>
({/if})
({/if})
<hr color="#0d6ddf">
<font color="#999966">ｺﾒﾝﾄを書く：</font>
({t_form m=ktai a=do_fh_diary_insert_c_diary_comment})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary.c_diary_id})">
<font color=red>({if $msg})({$msg})<br>({/if})</font>
<textarea name="body" rows="3"></textarea><br>
<input type="submit" value="書き込む">
</form>

<hr color="#0d6ddf">
<a name="menu">
%%i1014%%<a href="({t_url m=ktai a=page_fh_diary_list})&amp;target_c_member_id=({$target_diary_writer.c_member_id})&amp;({$tail})">({$target_diary_writer.nickname})さんの日記ﾘｽﾄ</a><br>
</a>
({if $INC_NAVI_type=="f"})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_diary_writer.c_member_id})&amp;({$tail})">({$target_diary_writer.nickname})さんのﾄｯﾌﾟ</a><br>
({/if})
({if $target_diary_writer.c_member_id==$u})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee">日記検索</font><br>
</td></tr>
</table>
({t_form _method=get m=ktai a=page_fh_diary_list})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#999966">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="keyword" value="({$keyword})"><br>
<center><input type="submit" value="検索する"></center>
</form>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
