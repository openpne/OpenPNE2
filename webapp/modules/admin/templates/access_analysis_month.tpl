({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;セキュリティ管理：ページ名ランダム生成</div>
</div>

({*ここまで:navi*})

<h2>({$item_str})ページ月次集計</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<h3 class="item">アクセスユーザ数（ＰＣ＋携帯の７日以内のログインユーザ数）：({$active_num}) 人</h3>

<ul>
<li><a href="?m=admin&a=page_access_analysis_target_diary&ktai_flag=({if $item_str=='PC'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスのあった日記を表示する</a></li>
<li><a href="?m=admin&a=page_access_analysis_target_member&ktai_flag=({if $item_str=='PC'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスのあったユーザーを表示する</a>
<li><a href="?m=admin&a=page_access_analysis_target_commu&ktai_flag=({if $item_str=='PC'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスのあったコミュニティを表示する</a>
<li><a href="?m=admin&a=page_access_analysis_target_topic&ktai_flag=({if $item_str=='PC'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスのあったトピックを表示する</a>
</ul>

<ul>
<li><a href="?m=admin&a=page_access_analysis_member&ktai_flag=({if $item_str=='PC'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスをしたユーザーを表示する</a></li>
</ul>

<table class="basicType2">
<tbody>
({foreach from=$access_analysis_month item=item})
<tr>
<td>
({$item.ym|date_format:"%Y年%m月"})
</td>
<td>
<a href="?m=admin&a=page_access_analysis_page&ymd=({$item.ym})&month_flag=1&ktai_flag=({$ktai_flag})">
({$item.count})
</a>
</td>
<td>
<a href="?m=admin&a=page_access_analysis_day&ymd=({$item.ym})&ktai_flag=({$ktai_flag})">日次集計</a>
</td>
</tr>
({/foreach})
</tbody>
</table>
</div>

({$inc_footer|smarty:nodefaults})