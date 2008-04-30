({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="フリーページ管理"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

<h2>フリーページ管理</h2>
<div class="contents">

({if $msg})
<p class="actionMsg">({$msg})</p>
({/if})
<p>任意のHTMLを表示するページを作成できます。</p>
<p class="caution">※「SNS認証：あり」のページとはSNSにログインしている場合にのみ閲覧できるページです。</p>


<h3 class="item">フリーページリスト</h3>

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
<th>ページID</th>
<th>ページタイトル</th>
<th>SNS認証</th>
<th>対象ブラウザ</th>
<th colspan="2">操作</th>
</tr>
({****})
</thead>
<tbody>
({****})
({foreach from=$c_free_page_list item=item})
({if $item})
<tr>
<td>({$item.c_free_page_id})</td>
<td><a href="({if $item.auth})({t_url _absolute=1 m=$item.type a=page_h_free_page})({else})({t_url _absolute=1 m=$item.type a=page_o_free_page})({/if})&amp;c_free_page_id=({$item.c_free_page_id})" target="_blank">({$item.title|default:"タイトルなし"})</a></td>
<td>({if $item.auth})あり({else})なし({/if})</td>
<td>({if $item.type == 'pc'})PC({else})携帯({/if})</td>
<td><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_free_page','page')})&amp;c_free_page_id=({$item.c_free_page_id})'>編集</a></td>
<td><a href='?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_free_page_confirm','page')})&amp;c_free_page_id=({$item.c_free_page_id})'>削除</a></td>
</tr>
({/if})
({foreachelse})
<tr>
<td colspan="6" class="empty">フリーページが登録されていません</td>
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


<h3 class="item">フリーページの新規追加</h3>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_free_page','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />

<table class="basicType2">
<tbody>
<tr>
<th>ページタイトル</th>
<td><input class="basic" type="text" name="title" size="({$cols|default:72})" /></td>
</tr>
<tr>
<th>ページ内容</th>
<td>
<textarea class="basic" name="body" cols="({$cols|default:72})" rows="({$rows|default:10})"></textarea>
</td>
</tr>
<tr>
<th>SNS認証</th>
<td>
<input class="basicRadio" type="radio" id="radio_auth_1" name="auth" value="1" checked="checked" /><label for="radio_auth_1">あり</label>
<input class="basicRadio" type="radio" id="radio_auth_2" name="auth" value="0" /><label for="radio_auth_2">なし</label>
</td>
</tr>
<tr>
<th>対象ブラウザ</th>
<td>
<input class="basicRadio" type="radio" id="radio_type_1" name="type" value="pc" checked="checked" /><label for="radio_type_1">PC</label>
<input class="basicRadio" type="radio" id="radio_type_2" name="type" value="ktai" /><label for="radio_type_2">携帯</label>
</td>
</tr>
<tr>
<td colspan="2">
<p class="caution">※「SNS認証：あり」「対象ブラウザ：携帯」のページにて、フリーページ内のリンクから外部サイトに遷移する際、<br />
外部サイトにリファラから「第三者によるログインが可能な情報」が漏えいする危険性があります。</p>
<p class="textBtn"><input type="submit" class="submit" value="追加する"></p>
</td>
</tr>
</tbody>
</table>

</form>

({$inc_footer|smarty:nodefaults})
