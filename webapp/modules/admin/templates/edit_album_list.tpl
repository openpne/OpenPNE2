({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="アルバム管理"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>({$page_name})</h2>

<div class="contents">

<div id="searchForm">
<h4>検索キーワード</h4>
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('edit_album_list','page')})" />
<input class="basic" type="text" name="keyword" value="({$keyword})" />
<span class="textBtnS"><input type="submit" value="　検　索　" /></span>
</form>

<h4>アルバムID検索</h4>
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('edit_album_list','page')})" />
<input class="basic" type="text" name="target_c_album_id" value="({$target_c_album_id})" />
<span class="textBtnS"><input type="submit" value="　検　索　" /></span>
</form>
</div>

({if !$album_list})
<p id="noAlbum">該当するアルバムが存在しません</p>
({else})

<script type="text/javascript" src="./js/select_delete.js"></script>

({capture name="pager"})
<div class="listControl">
<p class="display">
({$total_num})件中 ({$start_num})-({$end_num})件目を表示しています
</p>
<p class="listMove">
({if $page_list})({foreach from=$page_list item=item})({if $page!=$item})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_list','page')})&amp;page=({$item})&amp;keyword=({$keyword_encode})">({$item})</a>({else})<b>({$item})</b>({/if})&nbsp;&nbsp;({/foreach})&nbsp;({/if})
({if $prev})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_list','page')})&amp;page=({$page-1})&amp;keyword=({$keyword_encode})">＜＜前</a>　({/if})
({if $next})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_list','page')})&amp;page=({$page+1})&amp;keyword=({$keyword_encode})">次＞＞</a>({/if})
</p>
</div>
({/capture})

<div class="listControl" id="pager01">
({$smarty.capture.pager|smarty:nodefaults})
</div>

({foreach from=$album_list item=item})
<table class="basicType2 album">
<tbody>
({****})
<tr>
<th>ID</th>
<td class="type1">
<input type="checkbox" name="del" value="({$item.c_album_id})" />
({$item.c_album_id})
</td>
</tr>
({****})
<tr>
<th>タイトル</th>
<td>
<a href="({t_url _absolute=1 m=pc a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})" target="_blank">({$item.subject})</a>
(({if $item.count_images})<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_album_image_list','page')})&amp;target_c_album_id=({$item.c_album_id})">({/if})写真：({$item.count_images})件({if $item.count_images})</a>({/if}))
</td>
</tr>
({****})
<tr>
<th>作成者</th>
<td>
<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('c_member_detail','page')})&amp;target_c_member_id=({$item.c_member_id})">({$item.c_member.nickname})</a>
</td>
</tr>
({****})
<tr>
<th>表紙</th>
<td>
<img src="({if $item.album_cover_image})({t_img_url filename=$item.album_cover_image w=120 h=120})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" />
</td>
</tr>
({****})
<tr>
<th>アルバムの説明</th>
<td class="textbody">
({$item.description|nl2br})
</td>
</tr>
({****})
<tr>
<th>公開範囲</th>
<td>
({if $item.public_flag == "public"})
全員に公開
({elseif $item.public_flag == "friend"})
({$WORD_MY_FRIEND})まで公開
({elseif $item.public_flag == "private"})
公開しない
({/if})
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
<td class="formbutton" colspan="2">
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_album_confirm')})" />
<input type="hidden" name="target_c_album_id" value="({$item.c_album_id})" />
<span class="textBtnS"><input type="submit" value="　削　除　" /></span>
</form>
</td>
</tr>
</tbody>
</table>
({/foreach})

<form id="select-delete-form" action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('delete_album_confirm_selected')})" />
<input type="hidden" id="del-ids" name="target_c_album_ids" value="" />
<span class="textBtnS"><input type="button" id="select-delete" value="選択したアルバムを削除" /></span>
</form>

<div class="listControl" id="pager02">
({$smarty.capture.pager|smarty:nodefaults})
</div>
({/if})

({$inc_footer|smarty:nodefaults})
