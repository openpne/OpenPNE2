({$inc_ktai_header|smarty:nodefaults})

<center>設定変更</center>
<hr>

({if $msg})
<font color="red">({$msg})</font><br>
<br>
({/if})

◆<a href="({t_url m=ktai a=page_h_config_mail_receive})&amp;({$tail})">メール受信設定</a><br>
({if !$is_unused_ashiato})
◆<a href="({t_url m=ktai a=page_h_config_mail_ashiato})&amp;({$tail})">あしあとお知らせメール設定</a><br>
({/if})
◆<a href="({t_url m=ktai a=page_h_config_public_flag_diary})&amp;({$tail})">日記の公開範囲設定</a><br>
◆<a href="({t_url m=ktai a=page_h_config_access_block})&amp;({$tail})">アクセスブロック設定</a><br>
<br>
以下の変更にはパスワードの入力が必要です。<br>
<br>
◆<a href="({t_url m=ktai a=page_h_config_mail})&amp;({$tail})">携帯メールアドレス変更</a><br>
({if $smarty.const.OPENPNE_ENABLE_PC})
◆<a href="({t_url m=ktai a=page_h_pc_send})&amp;({$tail})">PCメールアドレス登録</a><br>
({/if})
<br>
({if !$smarty.const.IS_SLAVEPNE})
◆<a href="({t_url m=ktai a=page_h_config_password})&amp;({$tail})">パスワード変更</a><br>
◆<a href="({t_url m=ktai a=page_h_config_password_query})&amp;({$tail})">秘密の質問答え設定</a><br>
({/if})
◆<a href="({t_url m=ktai a=page_h_config_easy_login})&amp;({$tail})">かんたんログイン設定</a><br>
<br>
◇({if $u!=1})
<a href="({t_url m=ktai a=page_h_taikai_confirm})&amp;({$tail})">退会手続き</a><br>
({else})
退会手続き<br>
ID 1 のメンバーは退会することができません。<br>
({/if})
<hr>

({$inc_ktai_footer|smarty:nodefaults})
