({$c_member.nickname})さんが退会しました。

退会者データ

ID : ({$c_member.c_member_id})
ニックネーム : ({$c_member.nickname})
最終ログイン : ({$c_member.access_date|date_format:"%y-%m-%d %H:%M"})
登録日 : ({$c_member.r_date|date_format:"%y-%m-%d"})
招待者 : ({$c_member.c_member_invite.nickname})
生年月日 : ({if $c_member.birth_year})({$c_member.birth_year})年({/if})({if $c_member.birth_month})({$c_member.birth_month})月({/if})({if $c_member.birth_day})({$c_member.birth_day})日({/if})

({foreach from=$c_profile_list item=prof})
({$prof.caption}) : ({$c_member.profile[$prof.name].value})
({/foreach})

PCアドレス : ({$c_member.secure.pc_address})
携帯アドレス : ({$c_member.secure.ktai_address})
登録時アドレス : ({$c_member.secure.regist_address})

({if $reason})
退会理由
---------------------------------------------------
({$reason})
---------------------------------------------------
({else})
管理人による強制退会
({/if})

({$inc_signature})