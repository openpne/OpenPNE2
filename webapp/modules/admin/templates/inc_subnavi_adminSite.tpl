<div class="subNavi">
({strip})
({if $auth_type == 'all'})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_member')})">メンバーリスト</a>&nbsp;|&nbsp;
({/if})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">アップロード画像リスト</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_image')})">画像アップロード・削除</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_kakikomi')})">投稿記事削除</a>&nbsp;|&nbsp;
({/strip})
</div>
