({$inc_header|smarty:nodefaults})

<b>({$item_str})	月次集計</b>
<br>
<br>
<b>アクセスユーザ数</b><font size=1 color=red>（ＰＣ＋携帯の７日以内のログインユーザ数）</font><br>
({$active_num}) 人<br>
<br>
<br>
今月最もアクセスのあった<br>
<a href="?m=admin&a=page_access_analysis_target_diary&ktai_flag=({if $item_str=='PC'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">日記</a> 
<a href="?m=admin&a=page_access_analysis_target_member&ktai_flag=({if $item_str=='PC'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">ユーザー</a> 
<a href="?m=admin&a=page_access_analysis_target_commu&ktai_flag=({if $item_str=='PC'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">コミュニティ</a>
<br><br>
今月最もアクセスをした<br>
<a href="?m=admin&a=page_access_analysis_member&ktai_flag=({if $item_str=='PC'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">ユーザー</a> 

<br>
<br>

({foreach from=$access_analysis_month item=item})

({$item.ym|date_format:"%Y年%m月"})-->({$item.count}) &nbsp;&nbsp;
<a href="?m=admin&a=page_access_analysis_page&ymd=({$item.ym})&month_flag=1&ktai_flag=({$ktai_flag})">ページ毎の詳細</a>
<a href="?m=admin&a=page_access_analysis_day&ymd=({$item.ym})&ktai_flag=({$ktai_flag})">日次集計</a>
<br>

({/foreach})

({$inc_footer|smarty:nodefaults})