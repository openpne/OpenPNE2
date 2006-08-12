({$inc_header|smarty:nodefaults})

<h2>画像管理</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<h3>画像一覧</h3>

<p><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">画像リストへ</a></p>

<h3>画像をデータベースに登録</h3>

<p class="caution">※同じファイル名で既に登録されている画像がある場合、上書きされます。</p>

<form action="./" method="post" enctype="multipart/form-data">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<dl>
<dt>ファイル名：</dd>
<dd><input type="text" name="filename" value="" size="30"></dd>
<dt>画像：</dt>
<dd><input type="file" name="upfile"></dd>
<dd><input type="submit" class="submit" value="登録"></dd>
</dl>
</form>

<h3>データベース内の画像を表示</h3>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="page_({$hash_tbl->hash('edit_c_image')})">
<dl>
<dt>ファイル名：</dt>
<dd><input type="text" name="filename" value="({$requests.filename})" size="30"></dd>
<dd><input type="submit" class="submit" value="表示"></dd>
</dl>
</form>

({if $requests.filename})
({if $is_image})
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_image','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="filename" value="({$requests.filename})">
<dl>
<dd><a href="({t_img_url filename=$requests.filename})" target="_blank">
<img src="({t_img_url filename=$requests.filename w=120 h=120})"></a></dd>
<dd><input type="submit" class="submit" value="この画像を削除する"></dd>
</dl>
</div>
</form>
({else})
<em>({$requests.filename})</em> は登録されていません。
({/if})
({/if})

({$inc_footer|smarty:nodefaults})