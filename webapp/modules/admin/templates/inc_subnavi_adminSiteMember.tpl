<div class="subNavi">
({strip})
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})">メンバーリスト</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('send_invites')})">招待メール送信</a>&nbsp;|&nbsp;
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('csv_download')})">CSVダウンロード</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('import_c_member')})">CSVインポート</a>&nbsp;|&nbsp;
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist')})">ブラックリスト管理</a>&nbsp;|&nbsp;
({/if})
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu')})">({$WORD_COMMUNITY})リスト</a>&nbsp;|&nbsp;
({/if})
({if $smarty.const.IS_SNS_ENTRY_CONFIRM})
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_sns_entry')})">承認待ちリスト</a>&nbsp;|&nbsp;
({/if})
({/if})
({/strip})
</div>
