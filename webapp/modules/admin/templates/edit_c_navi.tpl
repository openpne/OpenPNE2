({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="ナビゲーション変更"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>ナビゲーション変更</h2>
<div class="contents">
<p class="info">ナビゲーション項目の「リンク先URL」と「説明(alt属性)」を変更することができます。</p>
<p class="caution" id="c01">※「説明」を変更しても画像内の文字は自動的には変更されません。画像の変更は「<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image')})">スキン画像変更</a>」からおこなってください。</p>
<p class="pageNavi"><a href="#navi_global">グローバルナビゲーション</a> | <a href="#navi_h">h_系ナビゲーション</a> | <a href="#navi_f">f_系ナビゲーション</a> | <a href="#navi_c">c_系ナビゲーション</a> | </p>
<h3 class="item"><a name="navi_global">グローバルナビゲーション</a></h3>
<p class="image"><img src="({t_img_url_skin filename=skin_after_header})"></p>
<table class="basicType2">
<thead>
<tr>
<th>並び順<br />(左から)</th>
<th>リンク先URL</th>
<th>説明</th>
<th colspan="2">操作</th>
</tr>
</thead>
<tbody>
({foreach from=$navi_global key=key item=item})
<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_navi','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="navi_type" value="global"/>
<input type="hidden" name="sort_order" value="({$key+1})" />
<td class="cell01">({$key+1})</td>
<td class="cell02"><input type="text" class="basic" name="url" value="({$item.url})" size="40" /></td>
<td class="cell03"><input type="text" class="basic" name="caption" value="({$item.caption})" size="20" /></td>
<td class="cell04"><span class="textBtnS"><input type="submit" value="　変　更　" /></span></td>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_navi','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="navi_type" value="global" />
<input type="hidden" name="sort_order" value="({$key+1})" />
<td class="cell05"><span class="textBtnS"><input type="submit" value="リセット" /></span></td>
</form>
</tr>
({/foreach})
<tr class="disable">
<td>({$key+2})</td>
<td>-</td>
<td>ログアウト</td>
<td colspan="2">変更できません</td>
</tr>
</tbody>
</table>

<h3 class="item"><a name="navi_h">h_系ナビゲーション</a></h3>
<p class="image"><img src="({t_img_url_skin filename=skin_navi_h})"></p>
<table class="basicType2">
<thead>
<tr>
<th>並び順<br />(左から)</th>
<th>リンク先URL</th>
<th>説明</th>
<th colspan="2">操作</th>
</tr>
</thead>
<tbody>
({foreach from=$navi_h key=key item=item})
<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_navi','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="navi_type" value="h"/>
<input type="hidden" name="sort_order" value="({$key+1})" />
<td class="cell01">({$key+1})</td>
<td class="cell02"><input type="text" class="basic" name="url" value="({$item.url})" size="40" /></td>
<td class="cell03"><input type="text" class="basic" name="caption" value="({$item.caption})" size="20" /></td>
<td class="cell04"><span class="textBtnS"><input type="submit" value="　変　更　" /></span></td>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_navi','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="navi_type" value="h" />
<input type="hidden" name="sort_order" value="({$key+1})" />
<td class="cell05"><span class="textBtnS"><input type="submit" value="リセット" /></span></td>
</form>
</tr>
({/foreach})
</tbody>
</table>

<h3 class="item"><a name="navi_f">f_系ナビゲーション</a></h3>
<p class="image"><img src="({t_img_url_skin filename=skin_navi_f})"></p>
<table class="basicType2">
<thead>
<tr>
<th>並び順<br />(左から)</th>
<th>リンク先URL</th>
<th>説明</th>
<th colspan="2">操作</th>
</tr>
</thead>
<tbody>
({foreach from=$navi_f key=key item=item})
<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_navi','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="navi_type" value="f"/>
<input type="hidden" name="sort_order" value="({$key+1})" />
<td class="cell01">({$key+1})</td>
<td class="cell02"><input type="text" class="basic" name="url" value="({$item.url})" size="40" /></td>
<td class="cell03"><input type="text" class="basic" name="caption" value="({$item.caption})" size="20" /></td>
<td class="cell04"><span class="textBtnS"><input type="submit" value="　変　更　" /></span></td>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_navi','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="navi_type" value="f" />
<input type="hidden" name="sort_order" value="({$key+1})" />
<td class="cell05"><span class="textBtnS"><input type="submit" value="リセット" /></span></td>
</form>
</tr>
({/foreach})
</tbody>
</table>

<h3 class="item"><a name="navi_c">c_系ナビゲーション</a></h3>
<p class="image"><img src="({t_img_url_skin filename=skin_navi_c})"></p>
<table class="basicType2">
<thead>
<tr>
<th>並び順<br />(左から)</th>
<th>リンク先URL</th>
<th>説明</th>
<th colspan="2">操作</th>
</tr>
</thead>
<tbody>
({foreach from=$navi_c key=key item=item})
<tr>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_navi','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="navi_type" value="c"/>
<input type="hidden" name="sort_order" value="({$key+1})" />
<td class="cell01">({$key+1})</td>
<td class="cell02"><input type="text" class="basic" name="url" value="({$item.url})" size="40" /></td>
<td class="cell03"><input type="text" class="basic" name="caption" value="({$item.caption})" size="20" /></td>
<td class="cell04"><span class="textBtnS"><input type="submit" value="　変　更　" /></span></td>
</form>
<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('delete_c_navi','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="navi_type" value="c" />
<input type="hidden" name="sort_order" value="({$key+1})" />
<td class="cell05"><span class="textBtnS"><input type="submit" value="リセット" /></span></td>
</form>
</tr>
({/foreach})
</tbody>
</table>
({$inc_footer|smarty:nodefaults})
