({$c_member.nickname})さんから ({$SNS_NAME}) の招待状が届いています

こんにちは！({$CATCH_COPY})({$SNS_NAME}) からのお知らせです。

({$c_member.nickname})さん があなたを
({$SNS_NAME}) へ招待しています。

({if $invite_message})
―――― < ({$c_member.nickname})さん >からあなたへのメッセージ ―――

({$invite_message})

―――――――――――――――――――――――――――――
({/if})

下記のURLから、会員登録(無料)をおこなうと、
({$SNS_NAME}) に参加できます。


■ ({$SNS_NAME}) に参加する
({t_url_mail m=pc a=page_o_ri})&sid=({$sid})


■ ({$SNS_NAME}) って何？
({$SNS_NAME})は、参加者が互いに友人を紹介しあい、
友人関係を広げるコミュニティ型のWebサイトです。


◆メッセージの相手に覚えがない方へ
あなたがメッセージの相手に覚えがない場合、メールアドレスを
間違えて送信されている可能性がございます。そのような場合、
大変お手数ではございますが下記メールアドレスまでご連絡ください。

({$ADMIN_EMAIL})


({$inc_signature})