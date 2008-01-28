({$inc_ktai_header|smarty:nodefaults})

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})

<center>
<a name="top">
<font color="orange">({$target_c_member.nickname})さんのﾎｰﾑ(ID=({$target_c_member.c_member_id}))</font>
</a>
</center>

<hr>

({if $days_birthday == 0})({* 誕生日当日 *})
<a href="({t_url m=ktai a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">☆Happy Birthday☆
<br>お誕生日にﾒｯｾｰｼﾞを送りましょう</a>
<hr>
({elseif $days_birthday > 0 && $days_birthday <= 3})({* 誕生日3日以内 *})
<a href="({t_url m=ktai a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">☆もうすぐ誕生日です！☆
<br>お誕生日にはﾒｯｾｰｼﾞを送りましょう</a>
<hr>
({/if})

({if $c_siteadmin})
({$c_siteadmin|smarty:nodefaults})
<hr>
({/if})

({if $inc_ktai_entry_point[2]})
({$inc_ktai_entry_point[2]|smarty:nodefaults})
({/if})

({if $target_c_member.image_filename})
★<a href="({t_url m=ktai a=page_f_show_image})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">写真を見る</a><br>
<br>
({/if})

({if $relation.wait==1})
現在、({$WORD_FRIEND_HALF})承認待ちです<br>
<br>
({/if})
<a href="#menu" accesskey="1">1.ﾒﾆｭｰ</a>({if ($relation.friend||$target_c_member.public_flag_diary=="public")&&$c_diary_list})|<a href="#news" accesskey="2">2.新着ﾘｽﾄ</a>({/if})|<a href="#intro" accesskey="3">3.ﾌﾟﾛﾌｨｰﾙ</a>
<hr>
({if $inc_ktai_entry_point[3]})
({$inc_ktai_entry_point[3]|smarty:nodefaults})
({/if})
({strip})
({capture name="birth"})
({if $target_c_member.age !== NULL})年齢：({$target_c_member.age})歳<br>({/if})
誕生日：({$target_c_member.birth_month})月({$target_c_member.birth_day})日<br>
({/capture})

({foreach from=$target_c_member.profile key=key item=item})

({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_nick"})
({counter assign="_cnt_birth"})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})

({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})

({if !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({if $item.value && $item.form_type != 'textarea'})
({$item.caption})：

({if $item.form_type == 'checkbox'})
    ({$item.value|@t_implode:", "})
({else})
    ({$item.value})
({/if})
<br>
({/if})
({/foreach})

({if !$_cnt_nick && !$_cnt_birth})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/if})
({/strip})

<hr>
<a name="menu">ﾒﾆｭｰ</a>
<br>
◆<a href="({t_url m=ktai_biz a=page_fh_biz_todo_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">Todoリスト</a><br>
◆<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$target_c_member.c_member_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>
◆<a href="({t_url m=ktai a=page_f_message_send})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">ﾒｯｾｰｼﾞを送る</a><br>
◆<a href="({t_url m=ktai a=do_f_bookmark_add_insert_c_bookmark})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">お気に入りに追加</a><br>
◆紹介文<br>
({if $relation.friend})
├<a href="({t_url m=ktai a=page_f_intro_edit})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">書く</a><br>
({/if})
└<a href="({t_url m=ktai a=page_fh_intro})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">読む</a><br>
({if $relation.friend==0})
({if $relation.wait==0})
◆<a href="({t_url m=ktai a=page_f_link_request})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})に加える</a><br>
({/if})
({/if})

<hr>
<a name="news">新着ﾘｽﾄ</a>
<br>
({if $c_diary_list})
<font color="green">[日記]</font><br>
({foreach from=$c_diary_list item=c_diary})
　({$c_diary.r_date|date_format:"%y/%m/%d"})-<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$c_diary.c_diary_id})&amp;({$tail})">({$c_diary.subject})</a>(({$c_diary.comment_count}))<br>
({/foreach})
<a href="({t_url m=ktai a=page_fh_diary_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">→もっと読む</a><br>
<a href="#top">↑このﾍﾟｰｼﾞの先頭へ戻る</a>
<hr>
({/if})
<font color="green">[({$WORD_FRIEND_HALF})ﾘｽﾄ]</font><br>
({foreach from=$c_friend_list item=c_friend})
　<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_friend.c_member_id_to})&amp;({$tail})">({$c_friend.nickname})</a>(({$c_friend.count_friend}))<br>
({/foreach})
<a href="({t_url m=ktai a=page_fh_friend_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">→すべて表示</a><br>
<a href="({t_url m=ktai a=page_fh_intro})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">紹介文を見る</a><br>
<a href="#top">↑このﾍﾟｰｼﾞの先頭へ戻る</a>
<hr>
<font color="green">[参加ｺﾐｭﾆﾃｨ]</font><br>
({foreach from=$c_commu_list item=c_commu})
　<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$c_commu.name})</a>(({$c_commu.count_members}))<br>
({/foreach})
<a href="({t_url m=ktai a=page_fh_com_list})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">→すべて表示</a><br>
({if $common_commu_count})
<a href="({t_url m=ktai a=page_f_com_list_common})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">→共通コミュニティ</a><br>
({/if})
<a href="#top">↑このﾍﾟｰｼﾞの先頭へ戻る</a>

<hr>
<a name="intro">ﾌﾟﾛﾌｨｰﾙ</a>
<br>
({foreach from=$target_c_member.profile key=key item=item})
({if $item.form_type == 'textarea'})
<font color="green">[({$item.caption})]</font><br>
({$item.value|t_url2a_ktai|nl2br})
<br>
({/if})
({/foreach})
<hr>

({$inc_ktai_footer|smarty:nodefaults})