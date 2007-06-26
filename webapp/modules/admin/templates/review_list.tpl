({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="レビュー管理"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

<h2>レビュー管理</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<form action="./" method="GET">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('review_list','page')})">
<h3 class="item">検索キーワード</h3>
<input class="basic" type="text" name="keyword" value="({$keyword})">
<span class="textBtnS"><input type="submit" value="検索"></span>
</form>

({capture name="pager"})
<div class="listControl">
<p class="display">
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('review_list','page')})&page=({$item})&keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('review_list','page')})&page=({$page-1})&keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('review_list','page')})&page=({$page+1})&keyword=({$keyword_encode})">次＞＞</a>({/if})
</p>
</div>
({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<table class="basicType2">
<tbody>
({foreach from=$review_list item=item})
({****})
<tr>
<th>ID</th>
<td class="type1">
<a href="({t_url _absolute=1 m=pc a=page_h_review_list_product})&c_review_id=({$item.c_review_id})" target="_blank">({$item.c_review_id})</a>
</td>
</tr>
({****})
<tr>
<th>タイトル</th>
<td>
<a href="({$item.c_review.url})" target="_blank">({$item.c_review.title})</a>
</td>
</tr>
({****})
<tr>
<th>説明</th>
<td>
({$item.c_review.release_date})<br>
({$item.c_review.manufacturer})<br>
({$item.c_review.artist})({$item.c_review.author})<br>
</td>
</tr>
({****})
<tr>
<th>レビュアー</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_f_home})&target_c_member_id=({$item.c_member_id})" target="_blank">({$item.c_member.nickname})</a>
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
<th>本文</th>
<td width="500">
({$item.body|nl2br})
</td>
</tr>
({****})
({/foreach})
</tbody>
</table>

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({$inc_footer|smarty:nodefaults})
