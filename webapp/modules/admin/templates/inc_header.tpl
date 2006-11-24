<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>({$title})</title>
<link rel="stylesheet" href="modules/admin/default.css" type="text/css">
</head>

<body>

<table border="0" cellspacing="0" cellpadding="0">

<tr>
<td style="width:100%;background:#000000;color:#ffffff;padding:5px;" colspan="2">

<h1><a href="?m=({$module_name})" title="({$title})">({$title})</a></h1>

</td>
</tr>
<tr>
<td style="background:#F0F3F3;padding:5px;" valign="top">

({if $display_navi})
<div id="site_navi">

({if $auth_type == 'all' || $auth_type == ''})
<p>SNS管理</p>
<ul>
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" title="メンバーリスト: ユーザ登録情報閲覧、メッセージ送信、強制退会">メンバーリスト</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_invites')})" title="SNS招待メール送信: 複数のメールアドレス宛に招待メールを送信">SNS招待メール送信</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})" title="画像リスト・管理: SNSに登録されている画像の一覧、登録、削除">画像リスト・管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_list')})" title="日記管理">日記管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_comment_list')})" title="日記コメント管理">日記コメント管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_list')})" title="トピック・イベント管理">トピック・イベント管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_comment_list')})" title="トピック・イベントのコメント管理">トピック・イベントのコメント管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_kakikomi')})" title="書き込み管理: 日記、コミュニティ、コミュニティトピックの強制削除">書き込み削除</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('manage_c_commu')})" title="初期コミュニティ管理: 新規登録時に参加させるコミュニティの設定">初期コミュニティ管理</a></li>
</ul>

<p>SNS統計情報</p>

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_generation')})" title="世代別ユーザー表示">世代別ユーザー表示</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_month')})" title="登録日別ユーザー表示（月次集計）">登録日別ユーザー表示（月次集計）</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_day')})" title="登録日別ユーザー表示（日次集計）">登録日別ユーザー表示（日次集計）</a></li>
({foreach from=$profile_list item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_profile')})&target_c_profile_id=({$item.c_profile_id})">({$item.caption})別ユーザー表示</a></li>
({/foreach})

({if $smarty.const.LOG_C_ACCESS_LOG})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=0" title="PCページ（月次集計）">PCページ月次集計</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=1" title="携帯ページ（月次集計）">携帯ページ月次集計</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('csv_download')})">CSVダウンロード</a></li>

</ul>
({/if})

<p>SNS設定</p>
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})" title="スキン画像変更: スキン画像変更、ナビゲーション互換設定">スキン画像変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_sns_config')})" title="配色・CSS変更: 配色設定、カスタムCSS">配色・CSS変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_navi')})" title="ナビゲーション変更: ナビゲーションボタンのリンク先、キャプションを変更">ナビゲーション変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})" title="お知らせ変更・HTML挿入: お知らせ、利用規約変更、HTML挿入">お知らせ変更・HTML挿入</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})" title="バナー管理: トップバナー、サイドバナー追加、任意HTML挿入">バナー管理</a></li>
</ul>

({if $ADMIN_INIT_CONFIG})
<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})" title="SNS設定変更: SNSの動作に関する詳細設定">SNS設定変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})" title="プロフィール項目変更: プロフィール項目の追加、編集、削除、並び替え">プロフィール項目変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_category')})" title="コミュニティカテゴリ変更: コミュニティカテゴリの追加、編集、削除、並び替え">コミュニティカテゴリ変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail_send')})" title="メール設定変更: SNSから送信する各種メールの送信設定、文言変更">メール設定変更</a></li>
</ul>
({/if})

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})" title="フリーページ一覧: フリーページの追加、編集、削除">フリーページ管理</a></li>
</ul>

<p>管理ページ設定</p>
<ul>
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})" title="アカウント管理: 管理画面ログイン用アカウントの管理">アカウント管理</a><br>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_admin_password')})" title="パスワード変更: 管理画面ログイン用パスワードの変更">パスワード変更</a><br>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_hash_table')})" title="ページ名ランダム生成: 管理画面のページ名を推測不可能なランダム文字列で置換">ページ名ランダム生成</a><br>
<li><a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('logout','do')})&amp;sessid=({$PHPSESSID})" title="ログアウト: 管理画面からログアウト">ログアウト</a>
</ul>



<div style="text-align:left;padding:.5em 5px;">
【<a href="./" title="サイトを表示" target="_blank">サイトを表示</a>】
</div>

</div>
({else})
&nbsp;
({/if})

</td>
<td style="width:100%;padding:5px;" valign="top">
