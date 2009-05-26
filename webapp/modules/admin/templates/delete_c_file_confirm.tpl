({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="parent_page_name" value="アップロードファイルリスト"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_file')})({/capture})
({assign var="page_name" value="ファイル削除の確認"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">ファイル削除の確認</h2>
<div class="contents">
<p class="caution" id="c01">本当に削除してもよろしいですか？</p>

<table class="basicType2">
<tbody>
({***})
<tr>
<th>ID</th>
<td class="type1">
({$c_file.c_file_id})
</td>
</tr>
({****})
<tr>
<th>ファイル名</th>
<td>
({$c_file.filename})
</td>
</tr>
({****})
<tr>
<th>元ファイル名</th>
<td>
({$c_file.original_filename})
</td>
</tr>
({****})
<tr>
<th>作成日</th>
<td>
({$c_file.r_datetime})
</td>
</tr>
({****})
<tr>
<th>ファイルサイズ</th>
<td>
({$c_file.size|number_format}) Bytes
</td>
</tr>
({****})
</tbody>
</table>


<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_file4c_file_id','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target_c_file_id" value="({$requests.target_c_file_id})" />
<p class="textBtn"><input type="submit" value="削除する" /></p>
</form>
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_file')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">アップロードファイルリストに戻る</a></p>

({$inc_footer|smarty:nodefaults})
