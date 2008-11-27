【({$SNS_NAME})】({$smarty.now|date_format:"%m/%d"})予定のお知らせ通知
({$c_member.nickname}) さん、おはようございます。

({$SNS_NAME})からのお知らせです。
カレンダーに追加された予定当日になりましたので、お知らせいたします。
今日の予定は以下になっています。

({foreach from=$c_schedule_list item=item})
件名：({$item.title})
({/foreach})

({$SNS_NAME})ログインページ
({$login_url})
