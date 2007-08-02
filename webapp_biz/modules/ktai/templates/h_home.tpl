({$inc_ktai_header|smarty:nodefaults})

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})

<center>
<a name="top"><font color="orange">({$c_member.nickname})さんのﾎｰﾑ</font></a>
({if $smarty.const.OPENPNE_IS_POINT_ADMIN || $c_member.c_member_id != 1})
({if $smarty.const.OPENPNE_DISP_RANK && $rank})
<br>
<img src="({t_img_url filename=$rank.image_filename})" alt="({$rank.name})">
({/if})
({if $smarty.const.OPENPNE_DISP_POINT && $point})
<br>
({$point}) Point
({/if})
({/if})
</center>

<hr>
({if $birthday_flag})
☆Happy Birthday☆<br>
お誕生日おめでとうございます
<hr>
({/if})

({if $c_siteadmin})
({$c_siteadmin|smarty:nodefaults})
<hr>
({/if})

({if $inc_ktai_entry_point[2]})
({$inc_ktai_entry_point[2]|smarty:nodefaults})
({/if})

({if $num_f_confirm_list})
<a href="({t_url m=ktai a=page_h_confirm_list})&amp;({$tail})"><font color="red">★承認待ちのﾒﾝﾊﾞｰ({$num_f_confirm_list})名</font></a><br>
({/if})

({if $num_message_not_is_read})
<a href="({t_url m=ktai a=page_h_message_box})&amp;({$tail})"><font color="red">★新着ﾒｯｾｰｼﾞ({$num_message_not_is_read})件</font></a></font><br>
({/if})

({if $num_diary_not_is_read})
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$first_diary_read})&amp;({$tail})"><font color="red">★({$num_diary_not_is_read})件日記に新着ｺﾒﾝﾄ</font></a><br>
({/if})

({if $num_h_confirm_list })
<a href="({t_url m=ktai a=page_h_confirm_list})&amp;({$tail})"><font color="red">★ｺﾐｭﾆﾃｨ参加承認待ち({$num_h_confirm_list})名</font></a><br>
({/if})

({if $anatani_c_commu_admin_confirm_list})
<a href="({t_url m=ktai a=page_h_confirm_list})&amp;({$tail})"><font color="red">★ｺﾐｭﾆﾃｨ管理者交代依頼({$num_anatani_c_commu_admin_confirm_list})件</font></a><br>
({/if})

({if $anatani_c_commu_sub_admin_confirm_list})
<a href="({t_url m=ktai a=page_h_confirm_list})&amp;({$tail})"><font color="red">★ｺﾐｭﾆﾃｨ副管理者依頼({$num_anatani_c_commu_sub_admin_confirm_list})件</font></a><br>
({/if})

({if $anatani_c_commu_admin_confirm_list||$num_f_confirm_list||$num_message_not_is_read||$num_diary_not_is_read||$num_h_confirm_list||$anatani_c_commu_admin_confirm_list||$anatani_c_commu_sub_admin_confirm_list})
<br>
({/if})

<a href="#news" accesskey="1">1.新着ﾘｽﾄ</a>| <a href="#config" accesskey="2">2.設定変更</a>
<hr>
({if $inc_ktai_entry_point[3]})
({$inc_ktai_entry_point[3]|smarty:nodefaults})
({/if})
◆<a href="({t_url m=ktai_biz a=page_fh_biz_todo_list})&amp;({$tail})">Todoリスト</a><br>
◆<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>
◆日記<br>
├<a href="({t_url m=ktai a=page_h_diary_edit})&amp;({$tail})">書く</a>|<a href="mailto:({$blog_address})">ﾒｰﾙ投稿</a><br>
└読む[<a href="({t_url m=ktai a=page_fh_diary_list})&amp;({$tail})">自分</a>|<a href="({t_url m=ktai a=page_h_diary_list_friend})&amp;({$tail})">友達</a>|<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;({$tail})">全体</a>]<br>
◆<a ({if $c_friend_count})href="({t_url m=ktai a=page_fh_friend_list})&amp;({$tail})" ({/if})name="menu">({$WORD_FRIEND_HALF})</a>(({$c_friend_count}))[({if $smarty.const.IS_USER_INVITE && ($smarty.const.OPENPNE_REGIST_FROM != $smarty.const.OPENPNE_REGIST_FROM_NONE)})<a href="({t_url m=ktai a=page_h_invite})&amp;({$tail})">誘う</a>|({/if})<a href="({t_url m=ktai a=page_h_friend_find_all})&amp;({$tail})">探す</a>]<br>
◆<a ({if $fh_com_count_user})href="({t_url m=ktai a=page_fh_com_list})&amp;({$tail})"({/if})>ｺﾐｭﾆﾃｨ</a>(({$fh_com_count_user}))[<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">探す</a>|<a href="({t_url m=ktai a=page_h_com_add})&amp;({$tail})">作る</a>]<br>
◆<a href="({t_url m=ktai a=page_h_bookmark_list})&amp;({$tail})">お気に入り</a><br>
◆<a href="({t_url m=ktai a=page_h_ranking})&amp;({$tail})">ﾗﾝｷﾝｸﾞ</a><br>
◆<a href="({t_url m=ktai a=page_fh_intro})&amp;({$tail})">紹介文</a><br>
◆ﾒｯｾｰｼﾞ[<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;({$tail})">受信箱</a>|<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;({$tail})">送信箱</a>|<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;({$tail})">ごみ箱</a>]<br>
◆<a href="({t_url m=ktai a=page_h_ashiato})&amp;({$tail})">あしあと</a><br>
<hr>
<a name="news">新着ﾘｽﾄ</a>
<br>
({if $c_diary_friend_list})
<font color="green">[({$WORD_FRIEND_HALF})最新日記]</font><br>
({foreach from=$c_diary_friend_list item=item})
({$item.r_date|date_format:"%m/%d"})(({$item.nickname|t_truncate:17:""}))<br>
　<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;({$tail})">({$item.subject|t_truncate:20:".."})</a>(({$item.count_comments}))({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})({/if})<br>
({/foreach})
<a href="({t_url m=ktai a=page_h_diary_list_friend})&amp;({$tail})">→もっと見る</a><br>
<a href="#top">↑このﾍﾟｰｼﾞの先頭へ戻る</a>
<hr>
({/if})

({if $c_diary_my_comment_list})
<font color="green">[日記ｺﾒﾝﾄ記入履歴]</font><br>
({foreach from=$c_diary_my_comment_list item=item})
({$item.r_datetime|date_format:"%m/%d"})(({$item.nickname|t_truncate:17:""}))<br>
　<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;({$tail})">({$item.subject|t_truncate:20:".."})</a>(({$item.num_comment}))({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})({/if})<br>
({/foreach})
<a href="({t_url m=ktai a=page_h_diary_comment_list})&amp;({$tail})">→もっと見る</a><br>
<a href="#top">↑このﾍﾟｰｼﾞの先頭へ戻る</a>
<hr>
({/if})

({if $c_commu_topic_list})
<font color="green">[ｺﾐｭﾆﾃｨ最新書き込み]</font><br>
({foreach from=$c_commu_topic_list item=item})
({$item.r_datetime|date_format:"%m/%d"})(({$item.c_commu_name|t_truncate:17:""}))<br>
　<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.c_commu_topic_name|t_truncate:19:".."})</a>(({$item.number}))({if $item.image_filename})({/if})<br>
({/foreach})
<a href="({t_url m=ktai a=page_h_com_comment_list})&amp;({$tail})">→もっと見る</a><br>
<a href="#top">↑このﾍﾟｰｼﾞの先頭へ戻る</a>
<hr>
({/if})

({if $c_commu_list})
<font color="green">[参加ｺﾐｭﾆﾃｨ({if $count_commu})(({$count_commu}))({/if})]</font><br>
({foreach from=$c_commu_list item=commu})
　<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$commu.c_commu_id})&amp;({$tail})">({$commu.name})</a>(({$commu.count_members}))<br>
({/foreach})
<a href="({t_url m=ktai a=page_fh_com_list})&amp;({$tail})">→もっと見る</a><br>
<a href="#top">↑このﾍﾟｰｼﾞの先頭へ戻る</a>
<hr>
({/if})
({if $c_friend_list})
<font color="green">[({$WORD_MY_FRIEND_HALF})ﾘｽﾄ]</font><br>
({foreach from=$c_friend_list item=friend})
　<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$friend.c_member_id_to})&amp;({$tail})">({$friend.nickname})</a>（({$friend.count_friend})）<br>
({/foreach})
<a href="({t_url m=ktai a=page_fh_friend_list})&amp;({$tail})">→もっと見る</a><br>
<a href="({t_url m=ktai a=page_h_manage_friend})&amp;({$tail})">→({$WORD_MY_FRIEND_HALF})管理</a><br>
<a href="#top">↑このﾍﾟｰｼﾞの先頭へ戻る</a><br>
({/if})

<hr>
<a name="config">■設定変更</a>
<br>
├<a href="({t_url m=ktai a=page_h_config_prof})&amp;({$tail})">ﾌﾟﾛﾌｨｰﾙ</a><br>
├<a href="({t_url m=ktai a=page_h_config_image})&amp;({$tail})">写真</a><br>
└<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">その他</a><br>

<hr>
<a href="({t_url m=ktai a=page_o_sns_kiyaku})">利用規約</a><br>
<a href="({t_url m=ktai a=page_o_sns_privacy})">ﾌﾟﾗｲﾊﾞｼｰﾎﾟﾘｼｰ</a><br>
<hr>
<a href="#news" accesskey="1">1.新着ﾘｽﾄ</a>| <a href="#config" accesskey="2">2.設定変更</a>|

({$inc_ktai_footer|smarty:nodefaults})
