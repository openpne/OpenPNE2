<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>({$title})</title>
<meta content="text/css" http-equiv="content-style-type" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link href="modules/admin/default.css" rel="stylesheet" type="text/css" media="all" />
<script src="modules/admin/default.js" type="text/javascript"></script>
</head>
<body id="admin_page_({$CURRENT_ACTION})">

<div class="container">

({*ここから:header*})

<div class="header">
<div class="ttl"><h1><a href="?m=({$module_name})" title="({$title})">({$title})</a></h1><span>【<a href="./" title="サイト確認" target="_blank">サイト確認</a>】</span></div>
<div class="naviHelp"></div>
</div>

({*ここまで:header*})

({*ここから:navi*})

({if $display_navi})
<div class="navi">
<div class="naviMain">

({****************})
({****************})

<ul class="admin">

({if $auth_type == 'all' || $auth_type == ''})
<li id="adminSiteMember" onmouseover="menu('adminSiteMember', 'adminSiteMemberCont')" onmouseout="menu('adminSiteMember', 'adminSiteMemberCont')"><a href="({if $auth_type == 'all'})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({elseif $auth_type == 'all' || $auth_type == ''})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_invites')})({else})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('csv_download')})({/if})">メンバー管理</a>
<ul id="adminSiteMemberCont" class="pull">
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})" title="メンバーリスト: ユーザ登録情報閲覧、メッセージ送信、強制退会">メンバーリスト</a></li>
({/if})
({if $auth_type == 'all' || $auth_type == ''})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_invites')})" title="招待メール送信: 複数のメールアドレス宛に招待メールを送信">招待メール送信</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('csv_download')})">CSVダウンロード</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('import_c_member')})">CSVインポート</a></li>
</ul>
</li>
({/if})

({****})

<li id="adminImageKakikomi" onmouseover="menu('adminImageKakikomi', 'adminImageKakikomiCont')" onmouseout="menu('adminImageKakikomi', 'adminImageKakikomiCont')"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">画像・書き込み管理</a>
<ul id="adminImageKakikomiCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})" title="画像リスト・管理: SNSに登録されている画像の一覧、登録、削除">アップロード画像リスト</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_image')})" title="未定">画像アップロード・削除</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_list')})">日記管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_comment_list')})">日記コメント管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_list')})">トピック・イベント管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_comment_list')})">トピック・イベントのコメント管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_kakikomi')})" title="書き込み管理: 日記、コミュニティ、コミュニティトピックの強制削除">書き込み削除</a></li>
</ul>
</li>

({****})

<li id="adminStatisticalInformation" onmouseover="menu('adminStatisticalInformation', 'adminStatisticalInformationCont')" onmouseout="menu('adminStatisticalInformation', 'adminStatisticalInformationCont')"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_generation')})">統計情報</a>
<ul id="adminStatisticalInformationCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_generation')})">世代別ユーザー表示</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_month')})">登録日別ユーザー表示（月次集計）</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_day')})">登録日別ユーザー表示（日次集計）</a></li>
({foreach from=$profile_list item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_profile')})&target_c_profile_id=({$item.c_profile_id})">({$item.caption})別ユーザー表示</a></li>
({/foreach})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=0">PCページ月次集計</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=1">携帯ページ月次集計</a></li>
</ul>
</li>

</ul>

({****************})
({****************})

<ul class="design">

<li id="adminDesign" onmouseover="menu('adminDesign', 'adminDesignCont')" onmouseout="menu('adminDesign', 'adminDesignCont')"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})">デザイン</a>
<ul id="adminDesignCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})" title="スキン画像変更: スキン画像変更、ナビゲーション互換設定">スキン画像変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_sns_config')})" title="配色・CSS変更: 配色設定、カスタムCSS">配色・CSS変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_navi')})" title="ナビゲーション変更: ナビゲーションボタンのリンク先、キャプションを変更">ナビゲーション変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})" title="HTML追加: 全体に及ぶデザインの変更">HTML挿入</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})" title="エントリーポイント追加: Smartyテンプレートをページに追加">テンプレート挿入</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})" title="バナー管理: トップバナー、サイドバナー追加、任意HTML挿入">バナー設定</a></li>
</ul>
</li>

</ul>

({****************})
({****************})

<ul class="config">

<li id="adminSNSConfig" onmouseover="menu('adminSNSConfig', 'adminSNSConfigCont')" onmouseout="menu('adminSNSConfig', 'adminSNSConfigCont')"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})">SNS設定</a>
<ul id="adminSNSConfigCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})" title="SNS設定変更: SNSの動作に関する詳細設定">SNS設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('limit_domain')})" title="登録できるドメインの設定">ドメイン制限</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})" title="OpenPNEAPIの設定">API設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})" title="CMDタグの使用箇所・使用サービスの設定">CMD設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail_send')})" title="メール送信設定変更: SNSから送信する各種メールの送信設定、文言変更">メール送信設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})" title="メール文言変更: SNSから送信する各種メールの文言変更">メール文言変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})" title="プロフィール項目変更: プロフィール項目の追加、編集、削除、並び替え">プロフィール項目設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_category')})" title="コミュニティカテゴリ変更: コミュニティカテゴリの追加、編集、削除、並び替え">コミュニティカテゴリ設定</a></li>
({if $auth_type == 'all' || $auth_type == ''})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('manage_c_commu')})" title="初期コミュニティ管理: 新規登録時に参加させるコミュニティの設定">初期コミュニティ</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_holiday')})" title="カレンダーの祝日の設定">祝日設定</a></li>
</ul>
</li>

({****})

<li id="adminInfoKiyaku" onmouseover="menu('adminInfoKiyaku', 'adminInfoKiyakuCont')" onmouseout="menu('adminInfoKiyaku', 'adminInfoKiyakuCont')"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})">お知らせ・規約設定</a>
<ul id="adminInfoKiyakuCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})" title="お知らせ変更・HTML挿入: お知らせ、利用規約変更、HTML挿入">お知らせ・規約設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">フリーページ管理</a></li>
</ul>
</li>

</ul>

({****************})
({****************})

<ul class="adminadmin">

<li id="adminAdminConfig" onmouseover="menu('adminAdminConfig', 'adminAdminConfigCont')" onmouseout="menu('adminAdminConfig', 'adminAdminConfigCont')"><a href="({if $auth_type == 'all'})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})({else})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_admin_password')})({/if})">管理ページ設定</a>
<ul id="adminAdminConfigCont" class="pull">
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})" title="アカウント管理: 管理画面ログイン用アカウントの管理">アカウント管理</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_admin_password')})" title="パスワード変更: 管理画面ログイン用パスワードの変更">パスワード変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_hash_table')})" title="ページ名ランダム生成: 管理画面のページ名を推測不可能なランダム文字列で置換">ページ名ランダム生成</a></li>
</ul>
</li>

</ul>

({****************})
({****************})

<p id="logout"><a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('logout','do')})&amp;sessid=({$PHPSESSID})" title="ログアウト: 管理画面からログアウト">ログアウト</a></p>

({****************})
({****************})

</div>

({else})
({/if})

({*続く:各ページのnaviSubへ続く*})
