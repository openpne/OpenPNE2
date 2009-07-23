({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})
({capture name=page_name_temp})({$item_str})ページ月次集計({/capture})
({assign var="page_name" value=$smarty.capture.page_name_temp})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>({$item_str})ページ月次集計</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<h3 class="item">アクセスメンバー数（ＰＣ＋携帯の７日以内のログインメンバー数）：({$active_num}) 人</h3>

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_diary')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスのあった({$WORD_DIARY})を表示する</a>
</li>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_member')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスのあったメンバーを表示する</a>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスのあった({$WORD_COMMUNITY})を表示する</a>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスのあったトピックを表示する</a>
</ul>

<ul>
<li><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({if $item_str=='PC版'})0({else})1({/if})&ymd=({$nowtime})&month_flag=1&page_name=all&orderby2=-2">今月最もアクセスをしたメンバーを表示する</a></li>
</ul>

<h3 class="item">月次別アクセスメンバー数</h3>

<table class="basicType2">
<tbody>
({foreach from=$access_analysis_month item=item})
<tr>
<th>
({$item.ym|date_format:"%Y年%m月"})
</th>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_page')})&ymd=({$item.ym})&month_flag=1&ktai_flag=({$ktai_flag})">
({$item.count})
</a>
</td>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_day')})&ymd=({$item.ym})&ktai_flag=({$ktai_flag})">日次集計</a>
</td>
</tr>
({/foreach})
</tbody>
</table>

<h3 class="item">ダウンロード</h3>
<p>CSV形式でダウンロードします。</p>
<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_access_analysis_month','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="ktai_flag" value="({$ktai_flag})" />
<input type="hidden" name="timestamp" value="({$smarty.now})" />
<p class="textBtn"><input type="submit" value="ダウンロード" /></p>
</form>

({$inc_footer|smarty:nodefaults})
