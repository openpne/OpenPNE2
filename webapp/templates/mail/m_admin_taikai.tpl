【({$SNS_NAME})】({$c_member.nickname})さんが退会しました。

退会者データ

メンバーID : ({$c_member.c_member_id})
({if $login_id})ログインID : ({$login_id})
({/if})
({$WORD_NICKNAME}) : ({$c_member.nickname})
({if $smarty.const.OPENPNE_USE_POINT_RANK})
ランク : ({$c_member.rank.name})
ポイント : ({$c_member.point})
({/if})
最終ログイン : ({$c_member.access_date})
登録日 : ({$c_member.r_date})
招待者 : ({$c_member.c_member_id_invite}) (({$c_member.c_member_invite.nickname}))
生年月日 : ({if $c_member.birth_year})({$c_member.birth_year})年({/if})({if $c_member.birth_month})({$c_member.birth_month})月({/if})({if $c_member.birth_day})({$c_member.birth_day})日({/if})

({foreach from=$c_profile_list item=prof})
({if $prof.name != 'PNE_POINT'})
({if $prof.form_type == "checkbox"})
({$prof.caption}) : ({$c_member.profile[$prof.name].value|@t_implode:", "})
({else})
({$prof.caption}) : ({$c_member.profile[$prof.name].value})
({/if})
({/if})
({/foreach})

PCメールアドレス : ({$c_member.secure.pc_address})
携帯メールアドレス : ({$c_member.secure.ktai_address})
登録時メールアドレス : ({$c_member.secure.regist_address})

({if $reason})
退会理由
---------------------------------------------------
({$reason})
---------------------------------------------------
({else})
管理人による強制退会
({/if})


({$inc_signature})
