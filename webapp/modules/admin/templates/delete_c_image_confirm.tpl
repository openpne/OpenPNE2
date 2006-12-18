({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminImageKakikomi.tpl"})
<div class="tree"><a href="?m=({$module_name})">管理画面TOP</a>&nbsp;＞&nbsp;画像・書き込み管理：<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">アップロード画像リスト</a>&nbsp;＞&nbsp;画像削除の確認</div>
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2 id="ttl01">画像削除の確認</h2>
<div class="contents">
<p class="caution" id="c01">本当に削除してもよろしいですか？</p>
<p id="userImg"><a href="({t_img_url filename=$c_image.filename})" target="_blank"><img src="({t_img_url filename=$c_image.filename w=120 h=120})" /></a></p>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_image4c_image_id','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="target_c_image_id" value="({$requests.target_c_image_id})" />
<p class="textBtn"><input type="submit" value="削除する" /></p>
</form>
<p class="caution" id="c02"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('list_c_image')})" onClick="history.back(); return false;" onKeyPress="history.back(); return false;">アップロード画像リストに戻る</a></p>

</div>
({$inc_footer|smarty:nodefaults})
