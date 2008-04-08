({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})

({if $item_str == "PC版"})
({assign var="parent_page_name" value="PCページ月次集計"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=0({/capture})
({else})
({assign var="parent_page_name" value="携帯ページ月次集計"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_month')})&ktai_flag=1({/capture})
({/if})

({capture name=page_name_temp})({$item_str}) トピック別アクセス数表示 ({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})({/capture})
({assign var="page_name" value=$smarty.capture.page_name_temp})

({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})

<h2>({$item_str}) トピック別アクセス数表示 ({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})</h2>
<div class="contents">


<p>
[({$page_name})]<br />

</p>

<div class="listControl">
<p class="listMove">
({if $is_prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$requests.page_name})&orderby=({$orderby})&direc=-1&page=({$page})">＜前を表示</a> ({/if})
&nbsp;&nbsp;({$start_num})件～({$end_num})件を表示&nbsp;&nbsp;
({if $is_next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$requests.page_name})&orderby=({$orderby})&direc=1&page=({$page})">次を表示＞</a>({/if})
</p>
</div>

<table class="basicType2">
	<thead>
		<tr>
		<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$requests.page_name})&orderby1=({$orderby1})">ID</a></th>
		<th>トピック名</th>
		<th>({$WORD_COMMUNITY})名</th>
		<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_target_topic')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$requests.page_name})&orderby2=({$orderby2})">アクセス数</a></th>
		</tr>
	</thead>
	<tbody>
({foreach from=$target_topic item=item})
		<tr>
			<th>({$item.target_c_commu_topic_id})</th>
			<td>({$item.topic_name})</td>
			<td>({$item.commu_name})</td>
			<td>({$item.count})</td>
		</tr>
({/foreach})
		<tr>
			<td colspan="3">合計</td>
			<td>({$sum})</td>
		</tr>
	</tbody>
</table>

({$inc_footer|smarty:nodefaults})
