({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSiteMember.tpl"})
({assign var="page_name" value="ブラックリスト管理"})
({ext_include file="inc_tree_adminSiteMember.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>ブラックリスト管理</h2>
<div class="contents">

<ul class="description">
    <li>ブラックリストに登録されたメンバーのSNSへのログイン・新規登録を制限する機能です。</li>
    <li>携帯個体識別番号(暗号化済)をキーにブラックリストに登録します。</li>
</ul>

<p id="itemAdd"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist_add','page')})">携帯個体識別番号をブラックリストに追加する</a></p>

({capture name="pager"})
<div class="listControl">
<p class="display">
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist','page')})&amp;page=({$item})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist','page')})&amp;page=({$page-1})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist','page')})&amp;page=({$page+1})">次＞＞</a>({/if})
</p>
</div>
({/capture})

({if $c_blacklist_list})
<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>
({/if})

<table class="basicType2">
({capture name="table_header"})
<tr>
<th>ID</th>
<th>携帯個体識別番号(暗号化済)</th>
<th>該当するメンバー</th>
<th>備考</th>
<th>操作</th>
</tr>
({/capture})
<thead>
({$smarty.capture.table_header|smarty:nodefaults})
</thead>
<tbody>
({foreach from=$c_blacklist_list item=item})
({if $item})
<tr>
<td class="cell01">({$item.c_blacklist_id})</td>
<td>({$item.easy_access_id})</td>
<td>
({if $item.c_member_id})
<a href="({t_url _absolute=1 m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})" target="_blank">({$item.nickname})</a>
({/if})
</td>
<td>({$item.info|nl2br})</td>
<td>
<ul>
<li><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist_edit','page')})&amp;target_c_blacklist_id=({$item.c_blacklist_id})'>編集</a></li>
<li><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('blacklist_delete_confirm','page')})&amp;target_c_blacklist_id=({$item.c_blacklist_id})'>ブラックリストから外す</a></li>
</ul>
</td>
</tr>
({/if})
({foreachelse})
<tr>
<td colspan="5">ブラックリストは登録されていません</td>
</tr>
({/foreach})
</table>

({if $c_blacklist_list})
<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>
({/if})

({$inc_footer|smarty:nodefaults})
