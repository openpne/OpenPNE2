({$inc_header|smarty:nodefaults})
</div>

({*ここまで:navi*})

<h2>({$WORD_COMMUNITY})リスト</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_commu','page')})" />
<h3 class="item">検索キーワード</h3>
<input class="basic" type="text" name="keyword" value="({$keyword})" />
<span class="textBtnS"><input type="submit" value="検索" /></span>
</form>

<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('list_c_commu','page')})" />
<h3 class="item">ID検索</h3>
<input class="basic" type="text" name="target_c_commu_id" value="({$target_c_commu_id})" />
<span class="textBtnS"><input type="submit" value="検索" /></span>
</form>

({if !$commu_list})

<p class="info">該当する({$WORD_COMMUNITY})が存在しません</p>

({else})

({capture name="pager"})
<div class="listControl">
<p class="display">
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu','page')})&amp;page=({$item})&amp;keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu','page')})&amp;page=({$page-1})&amp;keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_commu','page')})&amp;page=({$page+1})&amp;keyword=({$keyword_encode})">次＞＞</a>({/if})
</p>
</div>
({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

<table class="basicType2">
<tr>
    <th>ID</th>
    <th>コミュニティ名</th>
    <th>コミュニティ管理者</th>
    <th>コミュニティ作成日</th>
    <th>操作</th>
</tr>

({foreach from=$commu_list item=commu})
<tr>
    <td>({$commu.c_commu_id})</td>
    <td><a href="({t_url _absolute=1 m=pc a=page_c_home})&amp;target_c_commu_id=({$commu.c_commu_id})" target="_blank">({$commu.name|truncate:60})</a></td>
    <td><a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$commu.c_member.c_member_id})" target="_blank">({$commu.c_member.nickname|truncate:60})</a></td>
    <td>({$commu.u_datetime})</td>
    <td><a href="?m=admin&amp;a=page_({$hash_tbl->hash('commu_member_list')})&amp;target_c_commu_id=({$commu.c_commu_id})">メンバーリスト</a></td>
</tr>
({/foreach})

<tr>
    <th>ID</th>
    <th>コミュニティ名</th>
    <th>コミュニティ管理者</th>
    <th>コミュニティ作成日</th>
    <th>操作</th>
</tr>
</table>

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({/if})

({$inc_footer|smarty:nodefaults})
