({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminInfoKiyaku.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;お知らせ・規約設定：フリーページ管理</div>
</div>

({*ここまで:navi*})

<h2>フリーページ管理</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})

</div>({*/div class="contents"*})

<table class="contents" cellpadding="0" cellspacing="0" border="0">
<tr>
<td class="menu">

<dl>
<dt><strong class="item">新規追加</strong></dt>
<dd>
<p>フリーページを新規追加する。</p>
</dd>
</dl>

<p class="textBtn"><input type="button" value="フリーページ追加する" onClick="location.href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_free_page')})'"></p>


<dl>
<dt><strong class="item">フリーページ操作</strong></dt>
</dl>

({if $pager && $pager.total_num > 0})
<div class="listControl" id="pager01">

({capture name="pager"})
<p class="display">
({$pager.total_num}) 件中 ({$pager.start_num}) - ({$pager.end_num})件目を表示しています
</p>
<p class="listMove">
({if $pager.prev_page})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$pager.prev_page})&amp;page_size=({$pager.page_size})({$cond})">前へ</a>&nbsp;
({/if})
({foreach from=$pager.disp_pages item=i})
({if $i == $pager.page})
&nbsp;<strong>({$i})</strong>&nbsp;
({else})
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$i})&amp;page_size=({$pager.page_size})({$cond})">&nbsp;({$i})&nbsp;</a>
({/if})
({/foreach})
({if $pager.next_page})
&nbsp;<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_free_page')})&amp;page=({$pager.next_page})&amp;page_size=({$pager.page_size})({$cond})">次へ</a>
({/if})
</p>
({/capture})

({$smarty.capture.pager|smarty:nodefaults})

</div>
({/if})

<table class="basicType2">
<thead>
({****})
<tr>
<th>ID</th>
<th colspan=2>操作</th>
</tr>
({****})
</thead>
<tbody>
({****})
({foreach from=$c_free_page_list item=item})
({if $item})
<tr>
<th><a href="({t_url _absolute=1 m=pc a=page_h_free_page})&amp;c_free_page_id=({$item.c_free_page_id})" target="_blank">({$item.c_free_page_id})</a></th>
<td><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_free_page','page')})&amp;c_free_page_id=({$item.c_free_page_id})'>編集</a></td>
<td><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_free_page_confirm','page')})&amp;c_free_page_id=({$item.c_free_page_id})'>削除</a></td>
</tr>
({/if})
({foreachelse})
<tr>
<td colspan="3" class="empty">フリーページが登録されていません</td>
</tr>
({****})
({/foreach})
</tbody>
</table>

({if $pager && $pager.total_num > 0})
<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>
({/if})

</td>
<td class="detail">
<h3>({if $is_edit})フリーページの編集({else})フリーページの新規追加({/if})</h3>

({if $is_edit})
<p class="default">ページをhtmlで記述してください</p>
({else})
<p class="default">追加するページをhtmlで記述してください</p>
({/if})

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_free_page','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<textarea name="body" cols="({$cols|default:72})" rows="({$rows|default:10})"></textarea>
({if $is_edit})
<p class="textBtn"><input type="submit" class="submit" value="変更する"></p>
({else})
<p class="textBtn"><input type="submit" class="submit" value="追加する"></p>
({/if})

</form>












</td>
</table>

</div>({*/div class="contents"*})
({$inc_footer|smarty:nodefaults})
