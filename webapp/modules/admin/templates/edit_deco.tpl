({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminSNSConfig.tpl"})

({assign var="page_name" value="文字装飾設定"})
({ext_include file="inc_tree_adminSNSConfig.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>文字装飾設定</h2>
<div class="contents">
<h3 class="ttl01">文字装飾使用設定</h3>

<p>メンバーが使用できる文字装飾を設定します。</p>
<p>ボタン画像の変更は[<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('edit_skin_image','page')})">デザイン・スキン設定</a>]からおこなえます。</p>

<form action="./" method="post">
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_c_deco','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table class="basicType2">
<thead>
<tr>
<th>ID</th>
<th>画像</th>
<th>装飾名</th>
<th>表示例</th>
<th>操作</th>
</tr>
</thead>
<tbody>
({foreach from=$c_config_decoration_list item=item})
<tr>
<th>({$item.c_config_decoration_id})</th>
<td><img src="({t_img_url_skin filename=deco_`$item.image_name` w=32 h=32})" alt="({$item.caption})" /></td>
<td>({$item.caption})</td>
<td>({$item.sample|smarty:nodefaults})</td>
<td>
<input type="radio" name="is_enabled[({$item.c_config_decoration_id})]" value="1" ({if $item.is_enabled}) checked="checked"({/if}) />使用する
&nbsp;
<input type="radio" name="is_enabled[({$item.c_config_decoration_id})]" value="0" ({if !$item.is_enabled}) checked="checked"({/if}) />使用しない
</td>
</tr>
({/foreach})
<tr>
<td colspan="5" align="right"><p class="textBtn"><input type="submit" value="　変　更　" /></p></td>
</tr>
</tbody>
</table>
</form>

({$inc_footer|smarty:nodefaults})
