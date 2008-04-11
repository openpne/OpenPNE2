({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminStatisticalInformation.tpl"})

({capture name=page_name_temp})
({$item_str}) ({if $month_flag})({$ymd|date_format:"%Y年%m月"})({else})({$ymd|date_format:"%Y年%m月%d日"})({/if})にアクセスしたメンバー
({/capture})
({* ({assign var="page_name" value=$smarty.capture.page_name_temp}) *})
({ext_include file="inc_tree_adminStatisticalInformation.tpl"})
</div>

({*ここまで:navi*})


<h2>({$item_str})&nbsp;({if $month_flag})({$ymd|date_format:"%Y年%m月"})({else})({$ymd|date_format:"%Y年%m月%d日"})({/if})にアクセスしたメンバー</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

[({$item_str})&nbsp;({if $month_flag})({$ymd|date_format:"%Y年%m月"})({else})({$ymd|date_format:"%Y年%m月%d日"})({/if})にアクセスしたメンバー]

<br>

({if $is_prev})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$requests.page_name})&orderby=({$orderby})&direc=-1&page=({$page})">＜前を表示</a>
({/if})
&nbsp;&nbsp;({$start_num})件～({$end_num})件を表示&nbsp;&nbsp;
({if $is_next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$requests.page_name})&orderby=({$orderby})&direc=1&page=({$page})">次を表示＞</a>({/if})
<br>
<table cellspacing="0" cellpadding="5" class="basicType2">
<tr>
<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$requests.page_name})&orderby1=({$orderby1})">ID</a></th>
<th>({$WORD_NICKNAME})</th>
<th><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('access_analysis_member')})&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$requests.page_name})&orderby2=({$orderby2})">アクセス数</a></th>
</tr>

({foreach from=$access_member item=item})
<tr>
<td>({$item.c_member_id})</td>
<td>({$item.nickname})</td>
<td>({$item.count})</td>
</tr>

({/foreach})

<tr>
<td colspan="2">合計</td>
<td>({$sum})</td>
</tr>

</table>

({$inc_footer|smarty:nodefaults})
