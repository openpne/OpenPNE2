<div class="subNavi">
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_generation')})">世代別ユーザー表示</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_month')})">登録日別ユーザー表示（月次集計）</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_date_day')})">登録日別ユーザー表示（日次集計）</a>&nbsp;|&nbsp;
({foreach from=$profile_list item=item})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('user_analysis_profile')})&target_c_profile_id=({$item.c_profile_id})">({$item.caption})別ユーザー表示</a>&nbsp;|&nbsp;
({/foreach})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=0">PCページ月次集計</a>&nbsp;|&nbsp;
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=1">携帯ページ月次集計</a>
</div>
