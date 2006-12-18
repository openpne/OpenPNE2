<div class="subNavi">
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_admin_user')})" title="アカウント管理: 管理画面ログイン用アカウントの管理">アカウント管理</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_admin_password')})" title="パスワード変更: 管理画面ログイン用パスワードの変更">パスワード変更</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_hash_table')})" title="ページ名ランダム生成: 管理画面のページ名を推測不可能なランダム文字列で置換">ページ名ランダム生成</a>

</div>
