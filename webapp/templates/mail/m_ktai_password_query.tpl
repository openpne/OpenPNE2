[({$SNS_NAME})]パスワード再設定用URL発行のお知らせ
({$c_member.nickname})さん、こんにちは。
({$CATCH_COPY})({$SNS_NAME})からのお知らせです。

パスワード再設定の要求を受け付けました。

({if $login_id})ログインID : ({$login_id})
({/if})
パスワード : ({$password})

下記の URL にアクセスし、パスワードの再設定をおこなってください。

({$update_password_url})

({$SNS_NAME})ログインページ
({$login_url})
