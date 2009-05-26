({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="ポイント・ランク設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>ポイント・ランク設定</h2>
<div class="contents">

<h3 class="item">アクションポイント設定</h3>
<p>メンバーのアクション毎に加算されるポイントを設定します。</p>

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<th>アクション</th>
<th>加算ポイント</th>
<th>操作</th>
</tr>
</thead>
<tbody>
({foreach from=$c_action_list item=c_action})
<tr>
<th>({$c_action.c_action_id})</th>
<td>({$c_action.name})</td>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_action','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input type="hidden" name="c_action_id" value="({$c_action.c_action_id})" />
<td><input type="text" class="basic" name="point" value="({$c_action.point})" size="10" /></td>
<td><span class="textBtnS"><input type="submit" class="submit" value="　変　更　"></span></td>
</form>

</tr>
({foreachelse})
<tr>
<td colspan="4">アクションが登録されていません</td>
</tr>
({/foreach})
</tbody>
</table>


<h3 class="item">ランク設定</h3>
<p>取得したポイントで到達するランクを設定します。</p>

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<th>ランク名</th>
<th>ランク画像</th>
<th>到達ポイント</th>
<th colspan="2">操作</th>
</tr>
</thead>
<tbody>
({foreach from=$c_rank_list item=c_rank})
<tr>
<th>({$c_rank.c_rank_id})</th>
<td>({$c_rank.name})</td>
<td  align="center"><a href="({t_img_url filename=$c_rank.image_filename})" target="_blank"><img src="({t_img_url filename=$c_rank.image_filename w=180 h=180})"></a></td>
<td>({$c_rank.point})</td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_rank')})&amp;c_rank_id=({$c_rank.c_rank_id})">変更</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_rank_confirm')})&amp;c_rank_id=({$c_rank.c_rank_id})">削除</a></td>
</tr>
({foreachelse})
<tr>
<td colspan="6">ランクが登録されていません</td>
</tr>
({/foreach})
<tr>
<form action="./" method="post" enctype="multipart/form-data">
<td>
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('insert_c_rank','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
</td>
<td><input type="text" class="basic" name="name" value="" size="5" /></td>
<td><input type="file" name="image_upfile" value="" size="20" /></td>
<td><input type="text" class="basic" name="point" value="" size="5" /></td>
<td colspan="2"><span class="textBtnS"><input type="submit" class="submit" value="ランク追加" /></span></td>
</form>
</tr>
</tbody>
</table>

<h3 class="item">ポイントクリア機能</h3>
<p>全メンバーのポイントを指定した初期ポイントに設定します。</p>

<table class="basicType2">
<thead>
<tr>
<th>初期ポイント</th>
<th>操作</th>
</tr>
</thead>
<tbody>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_point_clear','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<td><input type="text" class="basic" name="point" value="0" size="10" /></td>
<td><span class="textBtnS"><input type="submit" class="submit" value="　変　更　"></span></td>
</form>

</tbody>
</table>

({$inc_footer|smarty:nodefaults})
