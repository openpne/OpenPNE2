[({$SNS_NAME})]ﾒｯｾｰｼﾞが届いています
({$c_member_to.nickname})さん、こんにちは。
({$CATCH_COPY})({$SNS_NAME})からのお知らせです。

メッセージボックスに({$c_member_from.nickname})さんから
メッセージが届いています。

({if $subject})
件名:
({$subject|t_truncate:50:"...":1:0})
({/if})

({if $body})
本文:
({$body|t_truncate:150:"...":1:0})
({/if})

({$SNS_NAME})ログインページ
({$login_url})
