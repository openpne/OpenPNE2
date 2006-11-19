({$inc_header|smarty:nodefaults})

({if $msg})
<div class="caution">({$msg})</div>
({/if})
<b>コミュニティのトピック・イベントコメント</b><br><br>

<form action="./" method="GET">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('topic_comment_list','page')})">
<input type="text" name="keyword" value="({$keyword})">
<input type="submit" value="検索">
</form>
<table border="0">
<tr><td>
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています 
({if $page_list})<br>({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('topic_comment_list','page')})&page=({$item})&keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('topic_comment_list','page')})&page=({$page-1})&keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('topic_comment_list','page')})&page=({$page+1})&keyword=({$keyword_encode})">次＞＞</a>({/if})
</td></tr>
({foreach from=$topic_comment_list item=item})
<tr><td>
<table border="1" width="700" cellpadding="6">
<tr>
<td width="150">ID</td>
<td>
({$item.c_commu_topic_comment_id})
</td></tr>
<tr>
<td width="150">トピック名</td>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_topic_detail})&target_c_commu_topic_id=({$item.c_commu_topic_id})" target="_blank">({$item.topic_name})</a> (({$item.count_comments}))
</td></tr>
<tr>
<td width="150">コミュニティ名</td>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_home})&target_c_commu_id=({$item.c_commu_id})" target="_blank">({$item.commu_name})</a>
</td></tr>
<tr>
<td width="150">コメント主</td>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a>
</td></tr>
<tr>
<td width="150">作成日</td>
<td>
({$item.r_datetime})
</td></tr>
<tr>
<td width="150">トピックコメント本文</td>
<td width="500">
({$item.body|nl2br})
<tr><td>
</table>
</td></tr>
({/foreach})

</table>

({$inc_footer|smarty:nodefaults})