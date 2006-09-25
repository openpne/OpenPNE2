({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">
ｺﾐｭﾆﾃｨ：({$c_commu.name})<br>
</font></center>
<hr>

({if $c_commu_topic})

<center>({$c_commu_topic.name})</center>
<hr>

({if $c_commu_topic.event_flag != 1})

<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu_topic.c_member_id})&amp;({$tail})">({$c_commu_topic.nickname|default:"&nbsp;"})</a>
<br>
({$c_commu_topic.body|nl2br|default:"&nbsp;"})<br>
({if $c_commu_topic.image_filename1})画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename1 f=jpg})">大</a>]<br>({/if})
({if $c_commu_topic.image_filename2})画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename2 f=jpg})">大</a>]<br>({/if})
({if $c_commu_topic.image_filename3})画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename3 f=jpg})">大</a>]<br>({/if})
({$c_commu_topic.r_datetime|date_format:"%m/%d %H:%M"})
<br>
({if $c_commu_topic.c_member_id==$u || $is_admin})
<a href="({t_url m=ktai a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">編集</a><br>
({/if})

({else})

<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu_topic.c_member_id})&amp;({$tail})">({$c_commu_topic.nickname|default:"&nbsp;"})</a> <br>
開催日時：<br>
({$c_commu_topic.open_date|date_format:"%Y年%m月%d日"}) ({$c_commu_topic.open_date_comment})<br>
開催場所：<br>
({$c_commu_topic.pref}) ({$c_commu_topic.open_pref_comment})<br>
({if $c_commu_topic.invite_period != '0000-00-00'})
募集期限：<br>
({$c_commu_topic.invite_period|date_format:"%Y年%m月%d日"})<br>
({/if})
詳細：<br>
({$c_commu_topic.body|nl2br|default:"&nbsp;"})<br>
({if $c_commu_topic.image_filename1})画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename1 f=jpg})">大</a>]<br>({/if})
({if $c_commu_topic.image_filename2})画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename2 f=jpg})">大</a>]<br>({/if})
({if $c_commu_topic.image_filename3})画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename3 f=jpg})">大</a>]<br>({/if})
({$c_commu_topic.r_datetime|date_format:"%m/%d %H:%M"})<br>

<a href="({t_url m=ktai a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_commu_topic.c_commu_topic_id})&amp;({$tail})">参加者リスト</a><br>
({if $is_c_event_admin})
<a href="({t_url m=ktai a=page_c_event_mail})&amp;target_c_commu_topic_id=({$c_commu_topic.c_commu_topic_id})&amp;({$tail})">一括メッセージを送る</a><br>
({/if})
({if $is_c_event_admin || $is_admin})
<a href="({t_url m=ktai a=page_c_event_edit})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">編集</a><br>
({/if})

({/if})

({/if})

({if $is_c_commu_view})

({if $c_commu_topic_comment_list[1]})
<hr>
({foreach from=$c_commu_topic_comment_list item=item})
({if $item.number != 0})
({$item.number}).({if $item.nickname})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.nickname})</a>({/if})
<br>
s({$item.body|nl2br|default:"&nbsp;"})<br>
({if $item.image_filename1})画像：[<a href="({t_img_url filename=$item.image_filename1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename1 f=jpg})">大</a>]<br>({/if})
({if $item.image_filename2})画像：[<a href="({t_img_url filename=$item.image_filename2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename2 f=jpg})">大</a>]<br>({/if})
({if $item.image_filename3})画像：[<a href="({t_img_url filename=$item.image_filename3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename3 f=jpg})">大</a>]<br>({/if})
({$item.r_datetime|date_format:"%m/%d %H:%M"})
<br>
({if ($item.c_member_id == $u || $target_diary_writer==$u || $is_admin) && $item.number != 0})
[<a href="({t_url m=ktai a=page_c_bbs_delete_c_commu_topic_comment_confirm})&amp;c_commu_topic_comment_id=({$item.c_commu_topic_comment_id})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">削除</a>]<br>
({/if})
<br>
({/if})
({/foreach})

({if $is_prev || $is_next})
({if $is_prev})<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page-1})&amp;({$tail})">前へ</a> ({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page+1})&amp;({$tail})">次へ</a>({/if})
<br>
({/if})
({/if})

({if $is_c_commu_member})
<hr>
({if $msg})
<a name="comment"><font color="red">({$msg})</font></a><br>
<br>
({/if})

({t_form m=ktai a=do_c_bbs_insert_c_commu_topic_comment})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<textarea name="body"></textarea><br>
({if $c_commu_topic.event_flag})
({if !$is_c_event_admin})
({if !$is_c_event_member})
<input name="join_event" type="submit" value="イベントに参加する"><br>
({else})
<input name="cancel_event" type="submit" value="参加をキャンセルする"><br>
({/if})
({/if})
<input name="write_comment" type="submit" value="コメントのみ書き込む">
({else})
<input type="submit" value="書き込む">
({/if})
</form>
<a href="mailto:({$mail_address})">メール投稿</a><br>
画像も添付できます。
({/if})
({/if})
<hr>

<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})