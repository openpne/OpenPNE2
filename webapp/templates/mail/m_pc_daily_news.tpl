【({$SNS_NAME})】デイリー・ニュース [({$smarty.now|date_format:"%Y. %m. %d"})]
━━ ({$OPENPNE_URL}) ━━━━━━━━━━━━━━━━

({$CATCH_COPY})({$SNS_NAME})

本日の最新情報({if $smarty.const.OPENPNE_USE_RANKING})・新着ランキング({/if})　[({$smarty.now|date_format:"%Y. %m. %d/%a"})]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

({$c_member.nickname})さん

({$CATCH_COPY})({$SNS_NAME}) からの
本日の最新情報のお知らせです。

({if $daily_news_head|smarty:nodefaults})
({$daily_news_head|smarty:nodefaults})

({/if})
―――――――――――――――――――――――――――――
■INDEX■
―――――――――――――――――――――――――――――

◆({$WORD_MY_FRIEND})の最新({$WORD_DIARY})
◆参加({$WORD_COMMUNITY})の最新書き込み
◆({$c_member.nickname})さんのページへのアクセス
({if $smarty.const.OPENPNE_USE_RANKING})
◆昨日のランキングNo1は？ 
({/if})

―――――――――――――――――――――――――――――
◆({$WORD_MY_FRIEND})の最新({$WORD_DIARY})◆
―――――――――――――――――――――――――――――

({foreach from=$diary_friend_list item=item})
◇({$WORD_NICKNAME})：({$item.nickname})さん
　タイトル　　：({$item.subject})
　({t_url_mail m=pc a=page_fh_diary})&target_c_diary_id=({$item.c_diary_id})

({/foreach})

―――――――――――――――――――――――――――――
◆参加({$WORD_COMMUNITY})の最新書き込み◆
―――――――――――――――――――――――――――――

({$c_member.nickname})さんが参加している({$WORD_COMMUNITY})掲示板の更新トピックです。

({foreach from=$c_commu_topic_comment_list item=item})
◇名　前　：({$item.c_commu_name})
　トピック：({$item.c_commu_topic_name})
　({t_url_mail m=pc a=page_c_topic_detail})&target_c_commu_topic_id=({$item.c_commu_topic_id})

({/foreach})

―――――――――――――――――――――――――――――
◆({$c_member.nickname})さんのページへのアクセス数◆
―――――――――――――――――――――――――――――

◇最近、({$c_member.nickname})さんのページに訪れた人を確かめる
（あしあとを確認）

　→　({t_url_mail m=pc a=page_h_ashiato})

◇({$c_member.nickname})さんのページに訪れた人数：({$ashiato_num})アクセス


({if $smarty.const.OPENPNE_USE_RANKING})
―――――――――――――――――――――――――――――
◆昨日のランキングNo1は？◆
―――――――――――――――――――――――――――――

◇昨日のアクセス数No1メンバーは？
　→　({t_url_mail m=pc a=page_h_ranking})&kind=ashiato

◇昨日の({$WORD_MY_FRIEND})数No1メンバーは？
　→　({t_url_mail m=pc a=page_h_ranking})&kind=friend

◇昨日の参加人数No1({$WORD_COMMUNITY})は？
　→　({t_url_mail m=pc a=page_h_ranking})&kind=com_member

◇昨日の盛り上がり度No1({$WORD_COMMUNITY})は？
　→　({t_url_mail m=pc a=page_h_ranking})&kind=com_comment

({if $daily_news_foot|smarty:nodefaults})
({$daily_news_foot|smarty:nodefaults})

({/if})
({/if})
―――――――――――――――――――――――――――――

メール受信の設定変更はログイン後の「設定変更」より
おこなってください。

▼({$SNS_NAME})のデイリー・ニュースとは？

　あなたの({$WORD_MY_FRIEND})からの最新情報や、参加({$WORD_COMMUNITY})の書き込み
　情報など、毎日の更新情報をメールでお知らせします。

▼({$SNS_NAME})のデイリー・ニュース　配信停止はこちらから
　→　({t_url_mail m=pc a=page_h_config})


({$inc_signature})
