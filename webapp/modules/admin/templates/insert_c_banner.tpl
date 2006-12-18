({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminInfoKiyaku.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;デザインカスタマイズ：<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})">バナー設定</a>&nbsp;＞&nbsp;バナー追加</div>
</div>

({*ここまで:navi*})

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
<td><input type="text" name="a_href" value="" size="40" /></td>
</tr>
<tr>
<th>表示位置</th>
<td>
<select name="type">
<option value="TOP"({if $requests.type != 'side'}) selected="selected"({/if})>トップ</option>
<option value="SIDE"({if $requests.type == 'side'}) selected="selected"({/if})>サイド</option>
</select>
</td>
</tr>
<tr>
<th>バナー名</th>
<td><input type="text" name="nickname" value="" size="20" /></td>
</tr>
</table>
<p class="textBtn"><input type="submit" class="submit" value="バナーを追加する" /></p>
</form>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_c_banner')})">バナー設定へ戻る</a></p>
</div>
({$inc_footer|smarty:nodefaults})