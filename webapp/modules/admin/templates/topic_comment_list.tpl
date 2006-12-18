({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;セキュリティ管理：ページ名ランダム生成</div>
</div>

({*ここまで:navi*})

<h2>コミュニティのトピック・イベントコメント管理</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})


<form action="./" method="GET">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('topic_comment_list','page')})">
<h3 class="item">検索キーワード</h3>
<input class="basic" type="text" name="keyword" value="({$keyword})">
<span class="textBtnS"><input type="submit" value="検索"></span>
</form>

({capture name="pager"})
<p class="listMove">

({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています 
({if $page_list})<br>({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('topic_comment_list','page')})&page=({$item})&keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('topic_comment_list','page')})&page=({$page-1})&keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('topic_comment_list','page')})&page=({$page+1})&keyword=({$keyword_encode})">次＞＞</a>({/if})

</p>

({/capture})

({$smarty.capture.pager|smarty:nodefaults})


<table class="basicType2">
<tbody>
({foreach from=$topic_comment_list item=item})
({****})
<tr>
<th>ID</th>
<td class="type1">
({$item.c_commu_topic_comment_id})
</td>
</tr>
({****})
<tr>
<th>トピック名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_topic_detail})&target_c_commu_topic_id=({$item.c_commu_topic_id})" target="_blank">({$item.topic_name})</a> (({$item.count_comments}))
</td>
</tr>
({****})
<tr>
<th>コミュニティ名</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_c_home})&target_c_commu_id=({$item.c_commu_id})" target="_blank">({$item.commu_name})</a>
</td>
</tr>
({****})
<tr>
<th>コメント主</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$item.r_datetime})
</td>
</tr>
({****})
<tr>
<th>トピックコメント本文</th>
<td width="500">
({$item.body|nl2br})
</td>
</tr>
({****})
({/foreach})
</tbody>
</table>

({$smarty.capture.pager|smarty:nodefaults})
</div>
({$inc_footer|smarty:nodefaults})