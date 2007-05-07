<div class="subNavi">
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_admin_config')})">SNS設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('limit_domain')})">ドメイン制限</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_api')})">API設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_cmd')})">CMD設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail_send')})">メール送信設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_mail')})">メール文言変更</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_profile')})">プロフィール項目設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_category')})">コミュニティカテゴリ設定</a>&nbsp;|&nbsp;
({if $auth_type == 'all' || $auth_type == ''})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('manage_c_commu')})">初期コミュニティ設定</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_holiday')})">祝日設定</a>&nbsp;|&nbsp;
({if $smarty.const.OPENPNE_DISP_POINT})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_rank')})">ランク設定</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_action')})">アクション設定</a>
({/if})
</div>
