({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})

({if $item_str == "PC版"})
({assign var="parent_page_name" value="PCページ月次集計"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=0({/capture})
({else})
({assign var="parent_page_name" value="携帯ページ月次集計"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=1({/capture})
({/if})

({capture name=page_name_temp})({$item_str}) ({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})　ページ毎の集計({/capture})
({assign var="page_name" value=$smarty.capture.page_name_temp})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>({$item_str}) ({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})　ページ毎の集計</h2>
<div class="contents">

<table class="basicType2">
<thead>
<tr>
<th>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_page')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&orderby1=({$orderby1})">ページ</a></th>
<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_page')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&orderby2=({$orderby2})">アクセス数</a></th>
<th>アクセスされた<br>メンバー<br>(target_c_member_id)</td>
<th>アクセスされた<br>({$WORD_COMMUNITY})<br>(target_c_commu_id)</td>
<th>アクセスされた<br>トピック<br>(target_c_topic_id)</td>
<th>アクセスされた<br>({$WORD_DIARY})<br>(target_c_diary_id)</td>
<th>アクセスした<br>メンバー<br>(c_member_id)</td>
</tr>
</thead>
<tbody>
({foreach from=$access_analysis_month_page item=item})
<tr>
<th>({$item.page_name})</th>
<td>({$item.count})</td>
({if $item.is_target_c_member_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">詳細</a></td>
({else})
<td><br></td>
({/if})

({if $item.is_target_c_commu_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">詳細</a></td>
({else})
<td><br></td>
({/if})

({if $item.is_target_c_topic_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">詳細</a></td>
({else})
<td><br></td>
({/if})

({if $item.is_target_c_diary_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_diary')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">詳細</a></td>
({else})
<td><br></td>
({/if})

({if $item.is_c_member_id == 1})
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$item.page_name})">詳細</a></td>
</tr>
({else})
<td><br></td>
({/if})
({/foreach})

<tr>
<th>合計</th>
<td>({$sum})</td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">詳細</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">詳細</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">詳細</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_diary')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">詳細</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=all">詳細</a></td>
</tr>
</tbody>
</table>

<h3 class="item">ダウンロード</h3>
<p>CSV形式でダウンロードします。</p>
<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_access_analysis_page','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="ktai_flag" value="({$ktai_flag})" />
<input type="hidden" name="ymd" value="({$ymd})" />
<input type="hidden" name="month_flag" value="({$month_flag})" />
<input type="hidden" name="orderby" value="({$orderby})" />
<input type="hidden" name="timestamp" value="({$smarty.now})" />
<p class="textBtn"><input type="submit" value="ダウンロード" /></p>
</form>

({$inc_footer|smarty:nodefaults})
