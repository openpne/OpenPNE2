({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
({assign var="page_name" value="画像アップロード・削除"})
({ext_include file="inc_tree_adminImageKakikomi.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">画像のアップロード</h2>

<div class="contents">

<p class="caution" id="c01">※同じファイル名で既に登録されている画像がある場合、上書きされます。</p>
<form action="./" method="post" enctype="multipart/form-data" >
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<dl>
<dt class="filename"><strong class="item">ファイル名</strong></dt>
<dd class="filename"><input type="text" class="basic" name="filename" value="" size="30" /></dd>
<dt class="upfile"><strong class="item">画像</strong></dt>
<dd class="upfile"><input type="file" name="upfile" /><span>（GIF・JPG・PNG形式）</span></dd>
</dl>
<p class="textBtn"><input type="submit" value="　登　録　" /></p>
</form>

</div>({*/div class="contents"*})



<h2 id="ttl02">画像の表示・削除</h2>

<div class="contents">

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="page_({$hash_tbl->hash('edit_c_image')})" />
<dl>
<dt class="filename"><strong class="item">ファイル名</strong></dt>
<dd class="filename"><input type="text" class="basic" name="filename" value="({$requests.filename})" size="30" /></dd>
</dl>
<p class="textBtn"><input type="submit" value="　表　示　" /></p>
</form>
({if $requests.filename})
({if $is_image})
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_image','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="filename" value="({$requests.filename})" />
<p class="delImg"><a href="({t_img_url filename=$requests.filename})" target="_blank"><img src="({t_img_url filename=$requests.filename w=120 h=120})"></a></p>
({if strpos($requests.filename, 'skin_') !== 0 && strpos($requests.filename, 'no_') !== 0})
<p class="textBtn"><input type="submit" value="この画像を削除する"></p>
({/if})
</form>
({else})
<p class="caution" id="c02"><strong>({$requests.filename})</strong>は登録されていません。</p>
<p class="groupLing"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})">アップロード画像リストへ</a></p>
({/if})
({/if})
({$inc_footer|smarty:nodefaults})
