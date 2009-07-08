({$inc_ktai_header|smarty:nodefaults})

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_c_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">最終ﾛｸﾞｲﾝは({$target_c_member.last_login})</font><br>
</td></tr></table>
({if $c_siteadmin})
({$c_siteadmin|smarty:nodefaults})<br>
({/if})
({if $inc_ktai_entry_point[2]})
({$inc_ktai_entry_point[2]|smarty:nodefaults})
({/if})

({if $relation.wait==1})
<font color="#({$ktai_color_config.font_09})">※現在、({$WORD_FRIEND_HALF})承認待ちです</font><br>
({/if})

({if $is_h_prof == 1})
<font color="#({$ktai_color_config.font_09})">※他のﾒﾝﾊﾞｰから見たあなたのﾍﾟｰｼﾞはこのようになります。<br>ﾌﾟﾛﾌｨｰﾙを変更する場合は <a href="({t_url m=ktai a=page_h_config_prof})&amp;({$tail})">「ﾌﾟﾛﾌｨｰﾙ変更」 </a>よりおこなえます。</font><br>
({/if})

<table width="100%" bgcolor="#({$ktai_color_config.bg_04})">
({if !$is_h_prof})
({if ($is_friend || $friend_path)})
<tr><td colspan="2" align="center">
({if $friend_path})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$friend_path.c_member_id})&amp;({$tail})">({$friend_path.nickname})</a>さんの({$WORD_FRIEND_HALF})({/if})
({if $is_friend})({$WORD_MY_FRIEND_HALF})({/if})
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/if})
({if $target_c_member.public_flag_birth_month_day == 'public' || ($target_c_member.public_flag_birth_month_day == 'friend' && $is_friend)})
({if $days_birthday == 0})({* 誕生日当日　*})
<tr><td colspan="2" align="center">
<a href="({t_url m=ktai a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">☆Happy Birthday☆<br>
お誕生日にﾒｯｾｰｼﾞを送りましょう</a><br>
</td></tr>
({elseif $days_birthday > 0 && $days_birthday <= 3})({* 誕生日3日以内 *})
<tr><td colspan="2" align="center">
<a href="({t_url m=ktai a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">☆もうすぐ誕生日です!☆<br>
お誕生日にはﾒｯｾｰｼﾞを送りましょう</a><br>
</td></tr>
({/if})
({/if})
({/if})

<tr><td align="center" width="50%" valign="top">
<img src="({t_img_url filename=$target_c_member.image_filename w=120 h=120 f=jpg noimg=no_image})" alt="({$target_c_member.nickname})さん"><br>
({if $is_h_prof == 1})
<a href="({t_url m=ktai a=page_h_config_image})&amp;({$tail})">写真を編集</a><br>
({else})
({if $target_c_member.image_filename})
<a href="({t_url m=ktai a=page_f_show_image})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">写真を見る</a><br>
({/if})
({/if})
</td>
<td valign="top">
({strip})
<font color="#({$ktai_color_config.font_06})">ID：</font><br>
({$target_c_member.c_member_id})<br>

({capture name="birth"})
({if $target_c_member.age !== NULL && ($target_c_member.public_flag_birth_year == 'public' || ($target_c_member.public_flag_birth_year == 'friend' && ($is_friend || $is_h_prof)))})<font color="#({$ktai_color_config.font_06})">年齢：</font><br>({$target_c_member.age})歳<br>
({if $is_h_prof && $target_c_member.public_flag_birth_year == 'friend'})<font color="#({$ktai_color_config.font_09})">※({$WORD_MY_FRIEND_HALF})まで公開</font><br>({/if})
({/if})
({if $target_c_member.birth_month && $target_c_member.birth_day && ($target_c_member.public_flag_birth_month_day == 'public' || ($target_c_member.public_flag_birth_month_day == 'friend' && ($is_friend || $is_h_prof)))})
<font color="#({$ktai_color_config.font_06})">誕生日：</font><br>
({$target_c_member.birth_month})月({$target_c_member.birth_day})日<br>
({if $is_h_prof && $target_c_member.public_flag_birth_month_day == 'friend'})<font color="#({$ktai_color_config.font_09})">※({$WORD_MY_FRIEND_HALF})まで公開</font><br>({/if})
({/if})
({/capture})

({foreach from=$target_c_member.profile key=key item=item})
({if $item.public_flag != "private" && ($item.public_flag == "public" || ($item.public_flag == "friend" && ($is_friend || $is_h_prof)))})
({if $item.form_type != 'textarea'})

({if !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({if $item.value !== ''})
<font color="#({$ktai_color_config.font_06})">({$item.caption})：</font><br>
({if $item.form_type == 'checkbox'})
    ({$item.value|@t_implode:", "})
({elseif $item.form_type == 'text' || $item.form_type == 'textlong'})
    ({$item.value|t_truncate:30:""})
({else})
    ({$item.value})
({/if})
<br>
({if $is_h_prof && $item.public_flag == 'friend'})<font color="#({$ktai_color_config.font_09})">※({$WORD_MY_FRIEND_HALF})まで公開</font><br>({/if})
({/if})
({/if})
({/if})
({/foreach})

({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/strip})
</td></tr>
<tr><td colspan="2">
({foreach from=$target_c_member.profile key=key item=item})
({if $item.public_flag != "private" && ($item.public_flag == "public" || ($item.public_flag == "friend" && ($is_friend || $is_h_prof)))})
({if $item.value !== ''})
({if $item.form_type == 'textarea'})
<font color="#({$ktai_color_config.font_06})">({$item.caption})：</font><br>
({$item.value|t_truncate:108:""})<br>
({if $is_h_prof && $item.public_flag == 'friend'})<font color="#({$ktai_color_config.font_09})">※({$WORD_MY_FRIEND_HALF})まで公開</font><br>({/if})
({/if})
({/if})
({/if})
({/foreach})
</td></tr>
<tr><td align="right" colspan="2">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_fh_profile_detail})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">もっと見る</a>
<hr color="#({$ktai_color_config.border_01})"></td></tr></table>
({if $is_h_prof})
[i:76]<a href="({t_url m=ktai a=page_fh_intro})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">紹介文を読む</a>
({else})
[i:110]<a href="({t_url m=ktai a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">ﾒｯｾｰｼﾞを送る</a><br>
({if $relation.friend==0})
({if $relation.wait==0})
[i:140]<a href="({t_url m=ktai a=page_f_link_request})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})に加える</a><br>
({/if})
({/if})
[i:136]<a href="({t_url m=ktai a=do_f_bookmark_add_insert_c_bookmark})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">お気に入りに追加</a><br>
[i:76]<a href="({t_url m=ktai a=page_fh_intro})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">紹介文を読む</a>
({if $relation.friend})
 / <a href="({t_url m=ktai a=page_f_intro_edit})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">書く</a>
({/if})
({/if})
<br>
[i:68]<a href="({t_url m=ktai a=page_fh_album_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">ｱﾙﾊﾞﾑを見る</a><br>
({if $inc_ktai_entry_point[3]})
({$inc_ktai_entry_point[3]|smarty:nodefaults})
({/if})
<br>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
<a accesskey="1" name="a1" href="#a1">[i:125]</a><font color="#({$ktai_color_config.color_25})">新着({$WORD_DIARY_HALF})</font><br>
</td></tr>
({if $c_diary_list})
({foreach from=$c_diary_list item=c_diary})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">[({$c_diary.r_date|date_format:"%m/%d"})]</font><a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$c_diary.c_diary_id})&amp;({$tail})">({$c_diary.subject|t_truncate:22:""})(({$c_diary.comment_count}))</a>
({if $c_diary.image_filename_1 || $c_diary.image_filename_2 || $c_diary.image_filename_3})
[i:68]
({/if})
<br>
({if $is_h_prof && $c_diary.public_flag == 'friend'})<font color="#({$ktai_color_config.font_09})">※({$WORD_MY_FRIEND_HALF})まで公開</font><br>({/if})
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
<tr><td align="right">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">もっと見る</a><br>
</td></tr>
({/if})
</table>
<br>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_08})">
<a accesskey="2" name="a2" href="#a2">[i:126]</a><font color="#({$ktai_color_config.color_26})">({$WORD_FRIEND_HALF})ﾘｽﾄ</font><br>
</td></tr>
({foreach from=$c_friend_list item=c_friend})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_friend.c_member_id_to})&amp;({$tail})">({$c_friend.nickname|t_truncate:30:""})(({$c_friend.count_friend}))</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_10})">
<hr color="#({$ktai_color_config.border_03})">
</td></tr>
({/foreach})
<tr><td align="right">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_fh_friend_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">もっと見る</a><br>
</td></tr></table>

<br>

<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_05})"><a accesskey="3" name="a3" href="#a3">[i:127]</a><font color="#({$ktai_color_config.color_25})">参加({$WORD_COMMUNITY_HALF})</font><br>
</td></tr>
({foreach from=$c_commu_list item=c_commu})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$c_commu.name|t_truncate:30:""})(({$c_commu.count_members}))</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
<tr><td align="right">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_fh_com_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">もっと見る</a><br>
({if $common_commu_count})
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_f_com_list_common})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">共通({$WORD_COMMUNITY_HALF})</a><br>
({/if})
</td></tr></table>

({$inc_ktai_footer|smarty:nodefaults})
