({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})
({assign var="page_name" value="画像容量制限設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>({$page_name})</h2>

<div class="contents">

<div id="info">
<p>メンバーが使用することのできる画像の容量をMB単位で制限します。</p>
<ul>
<li>メンバー一人あたりの容量です</li>
<li>メンバーは、ここで設定された容量を超えた画像の投稿ができなくなります</li>
<li>空欄か0が指定された場合は無制限になります</li>
<li>全体画像容量は、アルバム、({$WORD_DIARY})、({$WORD_COMMUNITY})の画像の合計サイズを制限します</li>
<li>アルバムは、アルバムの画像の合計サイズを制限します</li>
<li>({$WORD_DIARY})は、({$WORD_DIARY})、({$WORD_DIARY})のコメントの画像の合計サイズを制限します</li>
<li>({$WORD_COMMUNITY})は、トピック、イベント、トピック・イベントコメントの画像の合計サイズを制限します</li>
<li>全体画像の設定ありの場合、上記以外はその他として全体制限サイズから個別制限サイズの差分で制限します</li>
    例：プロフィール、メッセージ、グループ(biz)、施設(biz)、アルバム表紙、({$WORD_COMMUNITY})TOPの画像
<li>全体画像の設定ありの場合、無制限に設定した画像もその他に分類されます</li>
<li>全体画像の設定ありで、({$WORD_COMMUNITY})が無制限の場合、以下のようになります</li>
<table class="basicType2">
<thead>
<tr>
<th>全体画像</th>
<th>アルバム</th>
<th>({$WORD_DIARY})</th>
<th>({$WORD_COMMUNITY})</th>
<th>その他</th>
</tr>
</thead>
<tbody>
<tr>
<td class="cell01">300</td>
<td class="cell01">100</td>
<td class="cell01">50</td>
<td class="cell01">0</td>
<td class="cell01">150</td>
</tr>
</tbody>
</table>
<p>その他の制限は、全体画像容量からアルバムと({$WORD_DIARY})の容量を引いた差分の150MBになります</p>
<p>この場合、({$WORD_COMMUNITY})とその他の画像の合計サイズが150MBを超えると投稿できなくなります</p>
<br>
<li>全体画像が無制限でアルバムと({$WORD_DIARY})のみ設定された場合、以下のようになります</li>
<table class="basicType2">
<thead>
<tr>
<th>全体画像</th>
<th>アルバム</th>
<th>({$WORD_DIARY})</th>
<th>({$WORD_COMMUNITY})</th>
<th>その他</th>
</tr>
</thead>
<tbody>
<tr>
<td class="cell01">0</td>
<td class="cell01">100</td>
<td class="cell01">50</td>
<td class="cell01">0</td>
<td class="cell01">0</td>
</tr>
</tbody>
</table>
<p>アルバムと({$WORD_DIARY})の画像のみ指定の容量で制限され、他の画像は制限されません</p>
</ul>
</div>


<div id="limitForm">
<h4>全体画像容量制限</h4>
<form action="./" method="get">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('edit_image_limit','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input id="input_limit_user" class="basic" type="text" name="limit_user" value="({$smarty.const.OPENPNE_IMAGE_USER_LIMIT})" /><label for="input_limit_user">MB</label>
({if $smarty.const.OPENPNE_USE_ALBUM})
<h4>アルバム容量制限</h4>
<input id="input_limit_album" class="basic" type="text" name="limit_album" value="({$smarty.const.OPENPNE_ALBUM_LIMIT})" /><label for="input_limit_album">MB</label>
({/if})
<h4>({$WORD_DIARY})画像容量制限</h4>
<input id="input_limit_diary" class="basic" type="text" name="limit_diary" value="({$smarty.const.OPENPNE_IMAGE_DIARY_LIMIT})" /><label for="input_limit_diary">MB</label>
<h4>({$WORD_COMMUNITY})画像容量制限</h4>
<input id="input_limit_commu" class="basic" type="text" name="limit_commu" value="({$smarty.const.OPENPNE_IMAGE_COMMU_LIMIT})" /><label for="input_limit_commu">MB</label>
<p class="textBtn"><input type="submit" value="　変　更　" /></p>
</form>
</div>

({$inc_footer|smarty:nodefaults})
