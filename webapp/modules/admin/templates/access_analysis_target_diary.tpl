({$inc_header|smarty:nodefaults})

<b>({$item_str})<br>
({if $month_flag})({$ymd|date_format:"%Y年%m月分"})({else})({$ymd|date_format:"%Y年%m月%d日分"})({/if})　
({$page_name})</b>

<br><br>

({if $is_prev})<a href="?m=admin&a=page_access_analysis_target_diary&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$page_name})&orderby=({$orderby})&direc=-1&page=({$page})">＜前を表示</a> ({/if})
&nbsp;&nbsp;({$start_num})件～({$end_num})件を表示&nbsp;&nbsp;
({if $is_next})<a href="?m=admin&a=page_access_analysis_target_diary&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$page_name})&orderby=({$orderby})&direc=1&page=({$page})">次を表示＞</a>({/if})
<br>
({*---------target_diary-------------*})
target_c_diary_id<br>
<table border="1" cellspacing="0" cellpadding="5">
<th><a href="?m=admin&a=page_access_analysis_target_diary&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$page_name})&orderby1=({$orderby1})">ID</a></th>
<th>タイトル</th>
<th>ニックネーム</th>
<th><a href="?m=admin&a=page_access_analysis_target_diary&ktai_flag=({$ktai_flag})&ymd=({$ymd})&month_flag=({$month_flag})&page_name=({$page_name})&orderby2=({$orderby2})">アクセス数</a></th>

({foreach from=$target_diary item=item})
<tr>
<td>({$item.target_c_diary_id})</td>
<td>({$item.subject})</td>
<td>({$item.nickname})</td>
<td>({$item.count})</td>
</tr>

({/foreach})

<tr>
<td colspan="3">合計</td>
<td>({$sum})</td>
</tr>

</table>
<br><br>



({$inc_footer|smarty:nodefaults})
