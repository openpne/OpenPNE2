({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
({$c_commu_topic.name})<br>
</td></tr></table>

({if $c_commu_topic.event_flag != 1})

<a href="#({if $c_commu_topic_comment_list})tc1({else})menu({/if})"><font color="#c49fff">▼</font></a>({$c_commu_topic.r_datetime|date_format:"%m/%d %H:%M"})<br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu_topic.c_member_id})&amp;({$tail})">({$c_commu_topic.nickname|default:"&nbsp;"})</a>
({if $c_commu_topic.c_member_id==$u || $is_admin})
[<a href="({t_url m=ktai a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">編集</a>]
({/if})
<br>
({$c_commu_topic.body|t_url2a_ktai|nl2br})<br>
({if $c_commu_topic.image_filename1})&#xE681;画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename1 f=jpg})">大</a>]<br>({/if})
({if $c_commu_topic.image_filename2})&#xE681;画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename2 f=jpg})">大</a>]<br>({/if})
({if $c_commu_topic.image_filename3})&#xE681;画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename3 f=jpg})">大</a>]<br>({/if})
<br>

({else})
このｲﾍﾞﾝﾄを({$WORD_MY_FRIEND_HALF})に教えよう!<br>
<font color="#0c5f0f">⇒</font><a href="">このｲﾍﾞﾝﾄを友人に教える</a>

<hr color="#0d6ddf">
<a href="#({if $c_commu_topic_comment_list})tc1({else})menu({/if})"><font color="#c49fff">▼</font></a><br>
企画者：<br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu_topic.c_member_id})&amp;({$tail})">({$c_commu_topic.nickname|default:"&nbsp;"})</a> <br>
<br>
開催日時：<br>
({$c_commu_topic.open_date|date_format:"%Y年%m月%d日"})({if $c_commu_topic.open_date_comment})<br>({$c_commu_topic.open_date_comment})({/if})<br>
<br>
開催場所：<br>
({$c_commu_topic.pref})({if $c_commu_topic.open_pref_comment})<br>({$c_commu_topic.open_pref_comment})({/if})<br>
<br>
募集人数：<br>
({if $c_commu_topic.capacity})
({$c_commu_topic.capacity})人
({else})
無制限
({/if})
<br>
<br>
参加者：<br>
({$c_commu_topic.member_num})人<br>
({if $c_commu_topic.member_num})
<a href="({t_url m=ktai a=page_c_event_member_list})&amp;target_c_commu_topic_id=({$c_commu_topic.c_commu_topic_id})&amp;({$tail})">参加者ﾘｽﾄを見る</a><br>
({/if})
<br>
({if $c_commu_topic.invite_period != '0000-00-00'})
募集期限：<br>
({$c_commu_topic.invite_period|date_format:"%Y年%m月%d日"})<br>
<br>
({/if})
詳細：<br>
({$c_commu_topic.body|t_url2a_ktai|nl2br})<br>
({if $c_commu_topic.image_filename1})&#xE681;画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename1 f=jpg})">大</a>]<br>({/if})
({if $c_commu_topic.image_filename2})&#xE681;画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename2 f=jpg})">大</a>]<br>({/if})
({if $c_commu_topic.image_filename3})&#xE681;画像：[<a href="({t_img_url filename=$c_commu_topic.image_filename3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_commu_topic.image_filename3 f=jpg})">大</a>]<br>({/if})
({$c_commu_topic.r_datetime|date_format:"%m/%d %H:%M"})<br>

({if $is_c_event_admin})
<br>
一括ﾒｯｾｰｼﾞ：<br>
参加者に一括でﾒｯｾｰｼﾞを送ります。<br>
<a href="({t_url m=ktai a=page_c_event_mail})&amp;target_c_commu_topic_id=({$c_commu_topic.c_commu_topic_id})&amp;({$tail})">一括ﾒｯｾｰｼﾞを送る</a><br>
({/if})

({if $is_c_event_admin || $is_admin})
<br>
ｲﾍﾞﾝﾄ編集：<br>
<a href="({t_url m=ktai a=page_c_event_edit})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">ｲﾍﾞﾝﾄ編集画面を見る</a><br>
({/if})
({/if})


({if $is_c_commu_view})
({if $c_commu_topic_comment_list})
<hr color="#0d6ddf">
<center>
ｺﾒﾝﾄ(全({$total_num})件)<br>
({$pager.start})～({$pager.end})番を表示
</center>

<hr color="#b3ceef">
<table width="100%">
({foreach from=$c_commu_topic_comment_list name=c_commu_topic_comment item=item})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<a name="tc({$smarty.foreach.c_commu_topic_comment.iteration})" href="#({if $smarty.foreach.c_commu_topic_comment.last || $item.number == 1})menu({else})tc({$smarty.foreach.c_commu_topic_comment.iteration+1})({/if})">
<font color="#c49fff">▼</font>
</a><font color="#999966">[({$item.number|string_format:"%03d"})]</font>({$item.r_datetime|date_format:"%m/%d %H:%M"})
<br>
({if $item.nickname})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})&amp;({$tail})">({$item.nickname})</a>({/if})
({if $item.c_member_id == $u || $target_diary_writer==$u || $is_admin})
[<a href="({t_url m=ktai a=page_c_bbs_delete_c_commu_topic_comment_confirm})&amp;c_commu_topic_comment_id=({$item.c_commu_topic_comment_id})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;({$tail})">削除</a>]
({/if})
<br>
({$item.body|t_url2a_ktai|nl2br})<br>
({if $item.image_filename1})&#xE681;画像：[<a href="({t_img_url filename=$item.image_filename1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename1 f=jpg})">大</a>]<br>({/if})
({if $item.image_filename2})&#xE681;画像：[<a href="({t_img_url filename=$item.image_filename2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename2 f=jpg})">大</a>]<br>({/if})
({if $item.image_filename3})&#xE681;画像：[<a href="({t_img_url filename=$item.image_filename3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$item.image_filename3 f=jpg})">大</a>]<br>({/if})
</td></tr>
<tr><td>
<hr color="#b3ceef">
</td></tr>
({/foreach})
</table>
({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">&#xE6E5;前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$c_commu_topic_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">&#xE6E7;次を表示</a>({/if})
<br>
</center>
({/if})
({/if})

({if $is_c_commu_member})
<hr color="#0d6ddf">
({if $msg})
<a name="comment"><font color="#ff0000">({$msg})</font></a><br>
<br>
({/if})

<a name="menu">
({t_form m=ktai a=do_c_bbs_insert_c_commu_topic_comment})
</a>
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})">
<textarea name="body"></textarea><br>
({if $c_commu_topic.event_flag})
({if $is_event_join_date})
({if !$is_c_event_member})

({if !$c_commu_topic.capacity || ($c_commu_topic.capacity > $c_commu_topic.member_num)})
<input name="join_event" type="submit" value="ｲﾍﾞﾝﾄに参加する"><br>
({/if})

({else})
<input name="cancel_event" type="submit" value="参加をｷｬﾝｾﾙする"><br>
({/if})
({/if})
<input name="write_comment" type="submit" value="ｺﾒﾝﾄのみ書き込む">
({else})
<input type="submit" value="書き込む">
({/if})
</form>
<br>
&#xE6D3;<a href="mailto:({$mail_address})">ﾒｰﾙ投稿</a><br>
画像も添付できます。
({/if})
({/if})
<hr color="#0d6ddf">
({if $c_commu_topic.event_flag != 1})
&#xE6DA;<a href="({t_url m=ktai a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ﾄﾋﾟｯｸﾘｽﾄ</a><br>
({else})
&#xE6DA;<a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｲﾍﾞﾝﾄﾘｽﾄ</a><br>
({/if})
&#xE6DA;<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})