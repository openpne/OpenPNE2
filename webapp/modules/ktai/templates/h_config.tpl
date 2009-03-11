({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr></table>
({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font>
<hr color="#({$ktai_color_config.border_01})">
({/if})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_config_mail_receive})&amp;({$tail})">ﾒｰﾙ受信設定</a><br>
({if !$is_unused_ashiato})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_config_mail_ashiato})&amp;({$tail})">あしあとお知らせﾒｰﾙ設定</a><br>
({/if})
({if !$is_unused_diary_comment})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_member_config_diary_comment_mail})&amp;({$tail})">({$WORD_DIARY_HALF})ｺﾒﾝﾄﾒｰﾙ受信設定</a><br>
({/if})
({if $smarty.const.OPENPNE_USE_POINT_RANK && !$is_unused_rank_up})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_member_config_rank_up_mail})&amp;({$tail})">ﾗﾝｸｱｯﾌﾟﾒｰﾙ受信設定</a><br>
({/if})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_config_public_flag_diary})&amp;({$tail})">({$WORD_DIARY_HALF})の公開範囲設定</a><br>
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_config_access_block})&amp;({$tail})">ｱｸｾｽﾌﾞﾛｯｸ設定</a><br>
({if $smarty.const.USE_SHINOBIASHI})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_config_shinobiashi})&amp;({$tail})">忍び足設定</a><br>
({/if})
({if $smarty.const.DISPLAY_NEWDIARYTOPIC_HOME})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_member_config_display_home})&amp;({$tail})">ﾏｲﾎｰﾑ最新情報表示設定</a><br>
({/if})
<br>
以下の変更にはﾊﾟｽﾜｰﾄﾞの入力が必要です。<br>
<br>
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_config_mail})&amp;({$tail})">携帯ﾒｰﾙｱﾄﾞﾚｽ変更</a><br>
({if $smarty.const.OPENPNE_ENABLE_PC})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_pc_send})&amp;({$tail})">PCﾒｰﾙｱﾄﾞﾚｽ登録</a><br>
({/if})
<br>
({if $smarty.const.OPENPNE_AUTH_MODE != 'slavepne'})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_config_password})&amp;({$tail})">ﾊﾟｽﾜｰﾄﾞ変更</a><br>
({if $smarty.const.IS_PASSWORD_QUERY_ANSWER})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_config_password_query})&amp;({$tail})">秘密の質問答え設定</a><br>
({/if})
({/if})
<font color="#({$ktai_color_config.bg_02})">◆</font><a href="({t_url m=ktai a=page_h_config_easy_login})&amp;({$tail})">かんたんﾛｸﾞｲﾝ設定</a><br>
<br>
◇({if $u!=1})
<a href="({t_url m=ktai a=page_h_taikai_confirm})&amp;({$tail})">退会手続き</a><br>
({else})
退会手続き<br>
ID 1 のﾒﾝﾊﾞｰは退会することができません。<br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
