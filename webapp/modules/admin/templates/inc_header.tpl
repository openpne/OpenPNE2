({assign var="title" value="`$smarty.const.SNS_NAME`管理画面"})
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>({$title})</title>
<meta content="text/css" http-equiv="content-style-type" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link href="modules/admin/default.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="./js/prototype.js?r7140"></script>
<script type="text/javascript" src="./modules/admin/default.js?r11725"></script>
({if $custom_header})
({$custom_header|smarty:nodefaults})
({/if})
<script type="text/javascript" src="./js/pne.js"></script>
</head>
<body id="admin_page_({$CURRENT_ACTION})">

<div class="container">

({*ここから:header*})

<div class="header">
<div class="ttl"><h1><a href="?m=({$module_name})">({$title})</a></h1><span>【<a href="./" target="_blank">サイト確認</a>】</span></div>
<div class="naviHelp"></div>
</div>

({*ここまで:header*})

({*ここから:navi*})

({if $display_navi})
<div class="navi">
<div class="naviMain">

({****************})
({****************})

({if $auth_type == 'all' || $auth_type == ''})
<ul class="admin">

<li id="adminSiteMember" onmouseover="menu('adminSiteMember','adminSiteMemberCont')" onmouseout="menu('adminSiteMember','adminSiteMemberCont')"><a class="tab" href="({if $auth_type == 'all'})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})({elseif $auth_type == 'all' || $auth_type == ''})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_invites')})({else})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('csv_download')})({/if})">メンバー管理</a>
<ul id="adminSiteMemberCont" class="pull">
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})">メンバーリスト</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_invites')})">招待メール送信</a></li>
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('csv_download')})">CSVダウンロード</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('import_c_member')})">CSVインポート</a></li>
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})">ブラックリスト管理</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu')})">({$WORD_COMMUNITY})リスト</a></li>
({if $smarty.const.IS_SNS_ENTRY_CONFIRM})
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})">承認待ちリスト</a></li>
({/if})
({/if})
</ul>
</li>

({****})

<li id="adminImageKakikomi" onmouseover="menu('adminImageKakikomi','adminImageKakikomiCont')" onmouseout="menu('adminImageKakikomi','adminImageKakikomiCont')">
<a class="tab" href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">画像・書き込み管理</a>
<ul id="adminImageKakikomiCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">アップロード画像リスト</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_image')})">画像アップロード・削除</a></li>
({if $smarty.const.OPENPNE_USE_FILEUPLOAD})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_file')})">アップロードファイルリスト</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_list')})">({$WORD_DIARY})管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('diary_comment_list')})">({$WORD_DIARY})コメント管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_list')})">トピック・イベント管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('topic_comment_list')})">トピック・イベントのコメント管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('review_list')})">レビュー管理</a></li>
({if $smarty.const.OPENPNE_USE_ALBUM})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_list')})">アルバム管理</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_image_list')})">アルバム写真管理</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('download_xml')})">書き込みデータダウンロード</a></li>
</ul>
</li>

({****})

<li id="adminStatisticalInformation" onmouseover="menu('adminStatisticalInformation','adminStatisticalInformationCont')" onmouseout="menu('adminStatisticalInformation','adminStatisticalInformationCont')"><a class="tab" href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_generation')})">統計情報</a>
<ul id="adminStatisticalInformationCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_generation')})">世代別メンバー数表示</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_month')})">登録日別メンバー数表示（月次集計）</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_day')})">登録日別メンバー数表示（日次集計）</a></li>
({foreach from=$profile_list item=item})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_profile')})&amp;target_c_profile_id=({$item.c_profile_id})">({$item.caption})別メンバー数表示</a></li>
({/foreach})
({if $smarty.const.LOG_C_ACCESS_LOG})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&amp;ktai_flag=0">PCページ月次集計</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&amp;ktai_flag=1">携帯ページ月次集計</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('image_analysis_category')})">カテゴリ別画像容量表示</a></li>
</ul>
</li>

</ul>
({/if})

({****************})
({****************})

<ul class="design">

<li id="adminDesign" onmouseover="menu('adminDesign','adminDesignCont')" onmouseout="menu('adminDesign','adminDesignCont')"><a class="tab" href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})">デザイン</a>
<ul id="adminDesignCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})">スキン画像変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_sns_config')})">配色・CSS変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_sns_config_ktai')})">携帯版配色変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_navi')})">ナビゲーション変更</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_html')})">HTML挿入</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_entry_point')})">テンプレート挿入</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})">バナー設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_info')})">お知らせ・規約設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})">フリーページ管理</a></li>
</ul>
</li>

</ul>

({****************})
({****************})

<ul class="config">

<li id="adminSNSConfig" onmouseover="menu('adminSNSConfig','adminSNSConfigCont')" onmouseout="menu('adminSNSConfig','adminSNSConfigCont')"><a class="tab" href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})">SNS設定</a>
<ul id="adminSNSConfigCont" class="pull">
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})">SNS設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config_word')})">SNS内名称設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">プロフィール項目設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_category')})">({$WORD_COMMUNITY})カテゴリ設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('manage_c_commu')})">初期({$WORD_COMMUNITY})設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_holiday')})">祝日設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail_send')})">メール送信設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})">メール文言変更</a></li>
({if $smarty.const.OPENPNE_USE_POINT_RANK})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})">ポイント・ランク設定</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('limit_domain')})">招待メールドメイン制限</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})">CMD設定</a></li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd_caster')})">CMDキャスト設定</a></li>
({if $smarty.const.OPENPNE_USE_API})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})">API設定</a></li>
({/if})
({if $smarty.const.OPENPNE_USE_DECORATION})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_deco')})">文字装飾設定</a></li>
({/if})
({* ({if $smarty.const.OPENPNE_USE_ALBUM}) *})
({* <li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_limit')})">アルバム容量制限設定</a></li> *})
({* ({/if}) *})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_image_limit')})">画像容量制限設定</a></li>
</ul>
</li>
</ul>

({****************})
({****************})
<ul class="module">

<li id="adminModule" onmouseover="menu('adminModule','adminModuleCont')" onmouseout="menu('adminModule','adminModuleCont')"><a class="tab" href="#">拡張機能</a>
<ul id="adminModuleCont" class="pull">
({foreach from=$enable_module_list item=item})
<li><a href="?m=({$item.admin_menu.module})&amp;a=({$item.admin_menu.action})">({$item.admin_menu.caption|default:$item.general.name})</a></li>
({/foreach})
({if !$enable_module_list})
<li><a href="#">（なし）</a></li>
({/if})
</ul>
</li>
</ul>
({****************})
({****************})

<ul class="adminadmin">

<li id="adminAdminConfig" onmouseover="menu('adminAdminConfig','adminAdminConfigCont')" onmouseout="menu('adminAdminConfig','adminAdminConfigCont')"><a class="tab" href="({if $auth_type == 'all'})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})({else})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_admin_password')})({/if})">管理画面設定</a>
<ul id="adminAdminConfigCont" class="pull">
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})">アカウント管理</a></li>
({/if})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_admin_password')})">パスワード変更</a></li>
({if $auth_type == 'all'})
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_hash_table')})">ページ名ランダム生成</a></li>
({/if})
</ul>
</li>

</ul>

({****************})
({****************})

<p id="logout"><a href="?m=({$module_name})&amp;a=do_({$hash_tbl->hash('logout','do')})&amp;sessid=({$PHPSESSID})">ログアウト</a></p>

({****************})
({****************})

</div>

({else})
<div>({*naviSubに閉じタグに対応*})
({/if})

({*続く:各ページのnaviSubへ続く*})
