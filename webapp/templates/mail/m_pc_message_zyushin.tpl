【({$SNS_NAME})】({$c_member_from.nickname})さんからメッセージが届いています

({$c_member_to.nickname})さん、こんにちは。
({$CATCH_COPY})({$SNS_NAME}) からのお知らせです。

メッセージボックスに({$c_member_from.nickname})さんから
メッセージが届いています。

―――― < ({$c_member_from.nickname})さん >からあなたへのメッセージ ―――

({if $subject})
件名:
({$subject|t_truncate:50:"...":1:0})
({/if})

({if $body})
本文:
({$body|t_truncate:150:"...":1:0})
({/if})

―――――――――――――――――――――――――――――

なお、登録メールアドレスの変更などは
「設定変更」画面からおこなってください。

今後とも、ぜひ、({$SNS_NAME})をご活用ください。


({$inc_signature})
