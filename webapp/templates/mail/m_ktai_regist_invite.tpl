({$SNS_NAME})招待状
こんにちは。
({$CATCH_COPY})({$SNS_NAME})からのお知らせです。
({$c_member.nickname})さんがあなたを({$SNS_NAME})へ招待しています。

下記のURLから、会員登録をおこなうと({$SNS_NAME})に参加できます。
({if $smarty.const.OPENPNE_AUTH_MODE == 'slavepne'})
({if $smarty.const.SLAVEPNE_SYOUTAI_URL_KTAI})
({$smarty.const.SLAVEPNE_SYOUTAI_URL_KTAI})
({else})
({$smarty.const.SLAVEPNE_SYOUTAI_URL_PC})
({/if})
({else})
({$url})
({/if})

◆({$c_member.nickname})さんからあなたへのメッセージ
({$message})

---
利用、登録料は全て無料です。参加をお待ちしております。
