【({$SNS_NAME})】({$c_member.nickname})さんが登録されました。

登録者データ


メンバーID : ({$c_member.c_member_id})
({if $login_id})ログインID : ({$login_id})
({/if})
({$WORD_NICKNAME}) : ({$c_member.nickname})
登録日 : ({$c_member.r_date})
招待者 : ({$c_member.c_member_id_invite}) (({$c_member.c_member_invite.nickname}))
生年月日 : ({if $c_member.birth_year})({$c_member.birth_year})年({/if})({if $c_member.birth_month})({$c_member.birth_month})月({/if})({if $c_member.birth_day})({$c_member.birth_day})日({/if})

({foreach from=$c_profile_list item=prof})
({if $prof.name != 'PNE_POINT' && isset($c_member.profile[$prof.name].value)})
({if $prof.form_type == "checkbox"})
({$prof.caption}) : ({$c_member.profile[$prof.name].value|@t_implode:", "})
({else})
({$prof.caption}) : ({$c_member.profile[$prof.name].value})
({/if})
({/if})
({/foreach})

PCメールアドレス : ({$c_member.secure.pc_address})
携帯メールアドレス : ({$c_member.secure.ktai_address})
登録メールアドレス : ({$c_member.secure.regist_address})



({$inc_signature})
