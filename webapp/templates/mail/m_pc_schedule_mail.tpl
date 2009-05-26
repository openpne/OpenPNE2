【({$SNS_NAME})】({$smarty.now|date_format:"%m/%d"})予定のお知らせ通知
({$c_member.nickname}) さん、おはようございます。

({$SNS_NAME})からのお知らせです。
カレンダーに追加された予定当日になりましたので、お知らせいたします。
今日の予定は以下になっています。

({foreach from=$c_schedule_list item=item})
件名：({$item.title})
({/foreach})

以下のURLをクリックして詳細をご確認ください。
お知らせメールの通知設定は予定作成時に変更可能です。

({t_url_mail m=pc a=page_h_calendar})

なお登録メールアドレスの変更などは設定変更画面からおこなってください。

({$SNS_NAME})ログインページ↓
({$OPENPNE_URL})


({$inc_signature})