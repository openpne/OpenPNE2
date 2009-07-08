({$inc_ktai_header|smarty:nodefaults})

({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})

<table width="100%">
({if $smarty.const.OPENPNE_USE_KTAI_LOGO})
	<tr><td align="center">
		<a name="top"><img src="({t_img_url_skin filename=skin_ktai_header f=jpg})" alt="({$smarty.const.SNS_NAME})"></a><br>
	</td></tr>
({else})
	<tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
		<font color="#({$ktai_color_config.font_05})"><a name="top">({$smarty.const.SNS_NAME})</a></font><br>
	</td></tr>
({/if})
</table>
({if $c_siteadmin})
({$c_siteadmin|smarty:nodefaults})<br>
({/if})
({if $inc_ktai_entry_point[2]})
({$inc_ktai_entry_point[2]|smarty:nodefaults})
({/if})
({if $num_f_confirm_list})
<a href="({t_url m=ktai a=page_h_anatani_c_friend_confirm_list})&amp;({$tail})"><font color="#({$ktai_color_config.font_09})">★承認待ちのﾒﾝﾊﾞｰ({$num_f_confirm_list})名</font></a><br>
({/if})
({if $num_message_not_is_read})
<a href="({t_url m=ktai a=page_h_message_box})&amp;({$tail})"><font color="#({$ktai_color_config.font_09})">★新着ﾒｯｾｰｼﾞ({$num_message_not_is_read})件</font></a><br>
({/if})
({if $num_diary_not_is_read})
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$first_diary_read})&amp;({$tail})"><font color="#({$ktai_color_config.font_09})">★({$num_diary_not_is_read})件({$WORD_DIARY_HALF})に新着ｺﾒﾝﾄ</font></a><br>
({/if})
({if $num_h_confirm_list })
<a href="({t_url m=ktai a=page_h_anatani_c_commu_member_confirm_list})&amp;({$tail})"><font color="#({$ktai_color_config.font_09})">★({$WORD_COMMUNITY_HALF})参加承認待ち({$num_h_confirm_list})名</font></a><br>
({/if})
({if $anatani_c_commu_admin_confirm_list})
<a href="({t_url m=ktai a=page_h_anatani_c_commu_admin_confirm_list})&amp;({$tail})"><font color="#({$ktai_color_config.font_09})">★({$WORD_COMMUNITY_HALF})管理者交代依頼({$num_anatani_c_commu_admin_confirm_list})件</font></a><br>
({/if})
({if $anatani_c_commu_sub_admin_confirm_list})
<a href="({t_url m=ktai a=page_h_anatani_c_commu_sub_admin_confirm_list})&amp;({$tail})"><font color="#({$ktai_color_config.font_09})">★({$WORD_COMMUNITY_HALF})副管理者依頼({$num_anatani_c_commu_sub_admin_confirm_list})件</font></a><br>
({/if})
({if $anatani_c_commu_admin_confirm_list||$num_f_confirm_list||$num_message_not_is_read||$num_diary_not_is_read||$num_h_confirm_list||$anatani_c_commu_admin_confirm_list||$anatani_c_commu_sub_admin_confirm_list})
<br>
({/if})
<table width="100%" bgcolor="#({$ktai_color_config.bg_04})">
<tr><td colspan="2" align="center">
<hr color="#({$ktai_color_config.border_01})" size="3">
({if $birthday_flag})
<font color="#({$ktai_color_config.font_09})">☆Happy Birthday☆<br>
お誕生日おめでとうございます</font>
({/if})<br>
</td></tr>
<tr><td align="center" width="50%" valign="top">
<img src="({t_img_url filename=$c_member.image_filename w=120 h=120 f=jpg})" alt="({$c_member.nickname})さん"><br>
({$c_member.nickname})さん<br>
({if $smarty.const.OPENPNE_IS_POINT_ADMIN || $c_member.c_member_id != 1})
({if $smarty.const.OPENPNE_DISP_RANK && $rank})
<img src="({t_img_url filename=$rank.image_filename w=120 h=120 f=jpg})" alt="({$rank.name})"><br>
({/if})
({if $smarty.const.OPENPNE_DISP_POINT && $point})
({$point}) Point<br>
({/if})
({/if})
</td>

<td valign="top">
[i:190]<a href="({t_url m=ktai a=page_h_diary_edit})&amp;({$tail})">({$WORD_DIARY_HALF})を書く</a><br>
[i:70]<a href="({t_url m=ktai a=page_fh_diary_list})&amp;({$tail})">({$WORD_DIARY_HALF})を読む</a><br>
[i:68]<a href="({t_url m=ktai a=page_fh_album_list})&amp;({$tail})">ｱﾙﾊﾞﾑ</a><br>
[i:110]<a href="({t_url m=ktai a=page_h_message_box})&amp;({$tail})">ﾒｯｾｰｼﾞ</a><br>
[i:91]<a href="({t_url m=ktai a=page_h_ashiato})&amp;({$tail})">あしあと</a><br>
({if $smarty.const.IS_USER_INVITE && ($smarty.const.OPENPNE_REGIST_FROM != $smarty.const.OPENPNE_REGIST_FROM_NONE)})[i:140]<a href="({t_url m=ktai a=page_h_invite})&amp;({$tail})">友人を誘う</a><br>({/if})
</td></tr>
<tr><td colspan="2" align="center">
[i:119]<a href="#search">検索</a>/[i:70]<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;({$tail})">最新({$WORD_DIARY_HALF})</a>({if $smarty.const.OPENPNE_USE_RANKING})/[i:191]<a href="({t_url m=ktai a=page_h_ranking})&amp;({$tail})">ﾗﾝｷﾝｸﾞ</a>({/if})
<hr color="#({$ktai_color_config.border_01})" size="3"></td></tr>

<tr>
<td colspan="2">
[i:140]<a href="({t_url m=ktai a=page_fh_friend_list})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})</a>(({$c_friend_count|default:'0'}))<br>
[i:155]<a href="({t_url m=ktai a=page_fh_com_list})&amp;({$tail})">参加({$WORD_COMMUNITY_HALF})</a>(({$fh_com_count_user|default:'0'}))<br>
[i:136]<a href="({t_url m=ktai a=page_h_bookmark_list})&amp;({$tail})">お気に入り</a><br>
[i:151]<a href="({t_url m=ktai a=page_h_confirm_list})&amp;({$tail})">承認待ちﾘｽﾄ</a>
<hr color="#({$ktai_color_config.border_01})" size="3"></td></tr>

<tr>
<td colspan="2"  align="center">
[i:140]<a href="({t_url m=ktai a=page_h_prof})&amp;({$tail})">ﾌﾟﾛﾌｨｰﾙ</a>/[i:68]<a href="({t_url m=ktai a=page_h_config_image})&amp;({$tail})">写真</a>/[i:76]<a href="({t_url m=ktai a=page_fh_intro})&amp;({$tail})">紹介文</a><br>
<hr color="#({$ktai_color_config.border_01})"></td></tr>
</table>
({if $inc_ktai_entry_point[3]})
({$inc_ktai_entry_point[3]|smarty:nodefaults})
({/if})
<br>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
<a accesskey="1" name="a1" href="#a1">[i:125]</a><font color="#({$ktai_color_config.color_25})">({$WORD_FRIEND_HALF})最新({$WORD_DIARY_HALF})</font><br>
</td></tr>
({if $c_diary_friend_list})
({foreach from=$c_diary_friend_list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">[({$item.r_date|date_format:"%m/%d"})]</font> ({$item.nickname|t_truncate:22:""})<br>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;({$tail})">({$item.subject|t_truncate:28:""})(({$item.count_comments}))</a>
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
<tr><td align="right">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_h_diary_list_friend})&amp;({$tail})">もっと見る</a><br>
</td></tr>
({/if})
</table>
<br>

<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_08})">
<a accesskey="2" name="a2" href="#a2">[i:126]</a><font color="#({$ktai_color_config.color_26})">({$WORD_DIARY_HALF})ｺﾒﾝﾄ記入履歴</font><br>
</td></tr>
({foreach from=$c_diary_my_comment_list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<font color="#({$ktai_color_config.font_06})">[({$item.r_datetime|date_format:"%m/%d"})]</font> ({$item.nickname|t_truncate:22:""})<br>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;({$tail})">({$item.subject|t_truncate:28:""})(({$item.num_comment}))</a>
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_10})">
<hr color="#({$ktai_color_config.border_03})">
</td></tr>
({/foreach})
({if $c_diary_my_comment_list})
<tr><td align="right">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_h_diary_comment_list})&amp;({$tail})">もっと見る</a><br>
</td></tr>
({/if})
</table>
<br>

<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
<a accesskey="3" name="a3" href="#a3">[i:127]</a><font color="#({$ktai_color_config.color_25})">参加({$WORD_COMMUNITY_HALF})最新書き込み</font><br>
</td></tr>
({if $c_commu_topic_list})
({foreach from=$c_commu_topic_list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">[({$item.r_datetime|date_format:"%m/%d"})]</font> ({$item.c_commu_name|t_truncate:22:""})<br>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.c_commu_topic_name|t_truncate:28:""})(({$item.number}))</a>
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
<tr><td align="right">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_h_com_comment_list})&amp;({$tail})">もっと見る</a><br>
</td></tr>
({/if})
</table>
<br>

({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME})
({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWDIARY_HOME_KTAI})
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_08})">
<a accesskey="4" name="a4" href="#a4">[i:128]</a><font color="#({$ktai_color_config.color_26})">全体の最新({$WORD_DIARY_HALF})</font><br>
</td></tr>
({if $c_diary_list_all})
({foreach from=$c_diary_list_all item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<font color="#({$ktai_color_config.font_06})">[({$item.r_date|date_format:"%m/%d"})]</font> ({$item.nickname|t_truncate:22:""})<br>
<a href="({t_url m=ktai a=page_fh_diary})&amp;target_c_diary_id=({$item.c_diary_id})&amp;({$tail})">({$item.subject|t_truncate:28:""})(({$item.count_comments}))</a>
({if $item.image_filename_1 || $item.image_filename_2 || $item.image_filename_3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_10})">
<hr color="#({$ktai_color_config.border_03})">
</td></tr>
({/foreach})
<tr><td align="right">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_h_diary_list_all})&amp;({$tail})">もっと見る</a><br>
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_h_member_config_display_home})&amp;({$tail})">表示設定変更</a><br>
</td></tr>
({/if})
</table>
<br>
({/if})

({if $C_MEMBER_CONFIG.IS_DISPLAY_NEWTOPIC_HOME_KTAI})
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
<a accesskey="5" name="a5" href="#a5">[i:129]</a><font color="#({$ktai_color_config.color_25})">全体の({$WORD_COMMUNITY_HALF})最新書き込み</font><br>
</td></tr>
({if $c_topic_list_all})
({foreach from=$c_topic_list_all item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">[({$item.u_datetime|date_format:"%m/%d"})]</font> ({$item.c_commu_name|t_truncate:22:""})<br>
<a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name|t_truncate:28:""})(({$item.number}))</a>
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
<tr><td align="right">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_h_com_topic_find_all})&amp;({$tail})">もっと見る</a><br>
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_h_member_config_display_home})&amp;({$tail})">表示設定変更</a><br>
</td></tr>
({/if})
</table>
<br>
({/if})
({/if})

<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_08})">
<a name="search">[i:119]<font color="#({$ktai_color_config.color_26})">検索</font></a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_09})">
<a href="({t_url m=ktai a=page_h_friend_find_all})&amp;({$tail})">ﾒﾝﾊﾞｰ検索</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_10})">
<a href="({t_url m=ktai a=page_h_diary_list_all})&amp;({$tail})">({$WORD_DIARY_HALF})検索</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_09})">
<a href="({t_url m=ktai a=page_h_com_find_all})&amp;({$tail})">({$WORD_COMMUNITY_HALF})検索</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_10})">
<hr color="#({$ktai_color_config.border_03})">
</td></tr></table>
<br>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
[i:140]<font color="#({$ktai_color_config.color_25})">ﾌﾟﾛﾌｨｰﾙ変更</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_06})">
<a href="({t_url m=ktai a=page_h_config_prof})&amp;({$tail})">ﾌﾟﾛﾌｨｰﾙ変更</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<a href="({t_url m=ktai a=page_h_config_image})&amp;({$tail})">ﾌﾟﾛﾌｨｰﾙ写真設定</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr></table>
<br>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_08})">
[i:75]<font color="#({$ktai_color_config.color_26})">設定変更</font><br>
</td></tr>
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_config_mail})&amp;({$tail})">携帯ﾒｰﾙｱﾄﾞﾚｽ変更</a><br>
</td></tr>
({if $smarty.const.OPENPNE_ENABLE_PC})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_pc_send})&amp;({$tail})">PCﾒｰﾙｱﾄﾞﾚｽ登録</a><br>
</td></tr>
({/if})
({if $smarty.const.OPENPNE_AUTH_MODE != 'slavepne'})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_config_password})&amp;({$tail})">ﾊﾟｽﾜｰﾄﾞ変更</a><br>
</td></tr>
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
({if $smarty.const.IS_PASSWORD_QUERY_ANSWER})
<a href="({t_url m=ktai a=page_h_config_password_query})&amp;({$tail})">秘密の質問・答え設定</a><br>
({/if})
</td></tr>
({/if})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_config_easy_login})&amp;({$tail})">かんたんﾛｸﾞｲﾝ設定</a><br>
</td></tr>
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<hr color="#({$ktai_color_config.border_03})">
</td></tr>
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_config_mail_receive})&amp;({$tail})">ﾒｰﾙ受信設定</a><br>
</td></tr>
({if !$is_unused_ashiato})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_config_mail_ashiato})&amp;({$tail})">あしあとお知らせﾒｰﾙ設定</a><br>
</td></tr>
({/if})
({if !$is_unused_diary_comment})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_member_config_diary_comment_mail})&amp;({$tail})">({$WORD_DIARY_HALF})ｺﾒﾝﾄﾒｰﾙ受信設定</a><br>
</td></tr>
({/if})
({if $smarty.const.OPENPNE_USE_POINT_RANK && !$is_unused_rank_up})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_member_config_rank_up_mail})&amp;({$tail})">ﾗﾝｸｱｯﾌﾟﾒｰﾙ受信設定</a><br>
</td></tr>
({/if})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_config_public_flag_diary})&amp;({$tail})">({$WORD_DIARY_HALF})の公開範囲設定</a><br>
</td></tr>
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_config_access_block})&amp;({$tail})">ｱｸｾｽﾌﾞﾛｯｸ設定</a><br>
</td></tr>
({if $smarty.const.USE_SHINOBIASHI})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_config_shinobiashi})&amp;({$tail})">忍び足設定</a><br>
</td></tr>
({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_member_config_display_home})&amp;({$tail})">ﾏｲﾎｰﾑ最新情報表示設定</a><br>
</td></tr>
({/if})
({elseif $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME})
<tr><td bgcolor="#({cycle name="bg" values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_member_config_display_home})&amp;({$tail})">ﾏｲﾎｰﾑ最新情報表示設定</a><br>
</td></tr>
({/if})
<tr><td bgcolor="#({$ktai_color_config.bg_10})">
<hr color="#({$ktai_color_config.border_03})">
</td></tr></table>
({if $OPENPNE_IMAGE_USER_LIMIT || $smarty.const.OPENPNE_ALBUM_LIMIT || $smarty.const.OPENPNE_IMAGE_DIARY_LIMIT || $smarty.const.OPENPNE_IMAGE_COMMU_LIMIT})
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
[i:140]<font color="#({$ktai_color_config.color_25})">設定確認</font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_06})">
<a href="({t_url m=ktai a=page_h_show_image_limit})&amp;({$tail})">写真容量</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr></table>
({/if})
<br>
<hr color="#({$ktai_color_config.border_01})">

■<a href="({t_url m=ktai a=page_o_sns_kiyaku})">利用規約</a><br>
({if $smarty.const.OPENPNE_DISP_KTAI_SNS_PRIVACY})
■<a href="({t_url m=ktai a=page_o_sns_privacy})">ﾌﾟﾗｲﾊﾞｼｰﾎﾟﾘｼｰ</a><br>
({/if})
({if $u!=1})
■<a href="({t_url m=ktai a=page_h_taikai_confirm})&amp;({$tail})">退会手続き</a><br>
({/if})
■<a href="({t_url m=ktai a=do_h_logout})&amp;({$tail})">ﾛｸﾞｱｳﾄ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
