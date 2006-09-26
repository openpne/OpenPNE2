({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">({$target_diary_writer.nickname})さんの日記</font></center>
<hr>
({if $c_siteadmin})
({$c_siteadmin|smarty:nodefaults})
<hr>
({/if})
({$target_c_diary.r_datetime|date_format:"%y/%m/%d %H:%M"})<br>
({$target_c_diary.subject})

({if $type == "h"})
<span style="color: red">
(
({if $target_c_diary.public_flag == "default"})
日記全体の設定に従う(({if $target_diary_writer.public_flag_diary == "public"})全員に公開({elseif $target_diary_writer.public_flag_diary == "friend"})({$WORD_FRIEND_HALF})まで公開({elseif $target_diary_writer.public_flag_diary == "close"})公開しない({/if}))
({elseif $target_c_diary.public_flag == "public"})
全員に公開
({elseif $target_c_diary.public_flag == "friend"})
({$WORD_FRIEND_HALF})まで公開
({elseif $target_c_diary.public_flag == "close"})
公開しない
({/if})
)
</span>
({/if})
<br>
<br>
({$target_c_diary.body|nl2br})<br>
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
({if $target_diary_writer.c_member_id==$u})
[<a href="({t_url m=ktai a=page_h_diary_edit})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;({$tail})">日記を編集</a>]<br>
[<a href="({t_url m=ktai a=page_fh_diary_delete_c_diary_confirm})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;({$tail})">日記を削除</a>]<br>
({/if})

({if $c_diary_comment})
<hr>
■ｺﾒﾝﾄ<br>
全({$total_num})件中、({$pager.start})～({$pager.end})件目を表示しています<br>
({foreach from=$c_diary_comment item=c_diary_comment_})
({if $c_diary_comment_.nickname})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_diary_comment_.c_member_id})&amp;({$tail})">({$c_diary_comment_.nickname})</a>({/if}) ({if $c_diary_comment_.c_member_id == $u || $target_diary_writer.c_member_id==$u})
[<a href="({t_url m=ktai a=page_fh_diary_delete_c_diary_comment_confirm})&amp;target_c_diary_comment_id=({$c_diary_comment_.c_diary_comment_id})&amp;({$tail})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})">削除</a>]
({/if})<br>
({$c_diary_comment_.body|nl2br|default:"&nbsp;"})<br>
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
({$c_diary_comment_.r_datetime|date_format:"%m/%d %H:%M"})
<br><br>

({/foreach})

({if $is_prev || $is_next})
({if $is_prev})<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;page=({$page-1})&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$target_c_diary.c_diary_id})&amp;page=({$page+1})&amp;({$tail})">次へ</a>({/if})
({/if})
<br>
({/if})
<hr>
■ｺﾒﾝﾄを書く
({t_form m=ktai a=do_fh_diary_insert_c_diary_comment})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary.c_diary_id})">
<font color=red>({if $msg})({$msg})<br>({/if})</font>
<textarea name="body"></textarea><br>
<input type="submit" value="書き込む">
</form>

<hr>
<a href="({t_url m=ktai a=page_fh_diary_list})&amp;target_c_member_id=({$target_diary_writer.c_member_id})&amp;({$tail})">({$target_diary_writer.nickname})さんの日記ﾘｽﾄ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
