({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})

({if $item_str == "PC版"})
({assign var="parent_page_name" value="PCページ月次集計"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&amp;ktai_flag=0({/capture})
({else})
({assign var="parent_page_name" value="携帯ページ月次集計"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&amp;ktai_flag=1({/capture})
({/if})

({capture name=page_name_temp})({$item_str}) ({$WORD_COMMUNITY})別アクセス数表示 ({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})({/capture})
({assign var="page_name" value=$smarty.capture.page_name_temp})

({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>({$item_str}) ({$WORD_COMMUNITY})別アクセス数表示 ({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})</h2>
<div class="contents">

<p>[({$page_name})]</p>

({if $target_commu})
({if $is_prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby=({$orderby})&amp;page=({$page-1})">＜前を表示</a> ({/if})
&nbsp;&nbsp;({$start_num})件～({$end_num})件を表示&nbsp;&nbsp;
({if $is_next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby=({$orderby})&amp;page=({$page+1})">次を表示＞</a>({/if})
<br />
<table cellspacing="0" cellpadding="5" class="basicType2">
<thead>
<tr>
<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby1=({$orderby1})">ID</a></th>
<th>({$WORD_COMMUNITY})名</th>
<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_commu')})&amp;ktai_flag=({$ktai_flag})&amp;ymd=({$ymd})&amp;month_flag=({$month_flag})&amp;page_name=({$requests.page_name})&amp;orderby2=({$orderby2})">アクセス数</a></th>
</tr>
</thead>
<tbody>
({foreach from=$target_commu item=item})
<tr>
<th>({$item.target_c_commu_id})</th>
({if $item.is_c_commu_exists})
<td>({$item.name})</td>
({else})
<td>(既に削除された({$WORD_COMMUNITY})です)</td>
({/if})
<td>({$item.count})</td>
</tr>

({/foreach})

<tr>
<td colspan="2">合計</td>
<td>({$sum})</td>
</tr>
</tbody>
</table>

<h3 class="item">ダウンロード</h3>
<p>CSV形式で全件をダウンロードします。</p>
<form  action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('csv_access_analysis_target_commu','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="ktai_flag" value="({$ktai_flag})" />
<input type="hidden" name="ymd" value="({$ymd})" />
<input type="hidden" name="month_flag" value="({$month_flag})" />
<input type="hidden" name="page_name" value="({$requests.page_name})" />
<input type="hidden" name="orderby" value="({$orderby})" />
<input type="hidden" name="timestamp" value="({$smarty.now})" />
<p class="textBtn"><input type="submit" value="ダウンロード" /></p>
</form>
({else})
<p>アクセスされた({$WORD_COMMUNITY})はありません</p>
({/if})

({$inc_footer|smarty:nodefaults})
