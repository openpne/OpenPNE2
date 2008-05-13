({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})

({assign var="parent_page_name" value="バナー設定"})
({capture name=parent_page_url})?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})({/capture})

({assign var="page_name" value="バナー追加"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>バナー追加</h2>
<div class="contents">

<form action="./" method="post" enctype="multipart/form-data">
<table class="basicType2">
<tr>
<th>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_banner','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
画像</th>
<td><input type="file" name="upfile" /></td>
</tr>
<tr>
<th>リンク先</th>
<td><input type="text" class="basic" name="a_href" value="" size="40" /></td>
</tr>
<tr>
<th>表示位置</th>
<td>
<select class="basic" name="type">
<option value="TOP"({if $requests.type != 'side'}) selected="selected"({/if})>トップ</option>
<option value="SIDE"({if $requests.type == 'side'}) selected="selected"({/if})>サイド</option>
</select>
</td>
</tr>
<tr>
<th>バナー名</th>
<td><input type="text" class="basic" name="nickname" value="" size="20" /></td>
</tr>
</table>
<p class="textBtn"><input type="submit" class="submit" value="バナーを追加する" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})">バナー設定へ戻る</a></p>
({$inc_footer|smarty:nodefaults})
