({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;画像・書き込み管理：日記管理</div>

({*ここまで:navi*})

<h2>日記管理</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<form action="./" method="GET">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('diary_list','page')})">
<h3 class="item">検索キーワード</h3>
<input class="basic" type="text" name="keyword" value="({$keyword})">
<span class="textBtnS"><input type="submit" value="検索"></span>
</form>

({capture name="pager"})

<p class="display">
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('diary_list','page')})&page=({$item})&keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('diary_list','page')})&page=({$page-1})&keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&a=page_({$hash_tbl->hash('diary_list','page')})&page=({$page+1})&keyword=({$keyword_encode})">次＞＞</a>({/if})
</p>

({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<table class="basicType2">
<tbody>
({foreach from=$diary_list item=item})
({****})
<tr>
<th>ID</th>
<td class="type1">
({$item.c_diary_id})
</td>
</tr>
({****})
<tr>
<th>タイトル</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_fh_diary})&target_c_diary_id=({$item.c_diary_id})" target="_blank">({$item.subject})</a> (コメント({$item.count_comments})件)
</td>
</tr>
({****})
<tr>
<th>作成者</th>
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
<th>日記本文</th>
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

</div>
({$inc_footer|smarty:nodefaults})