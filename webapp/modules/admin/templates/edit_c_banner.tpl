({$inc_header|smarty:nodefaults})

<script type="text/javascript">
<!--
function switchTextarea(position, enable) {
  if (position == "top") {
    document.form_top_banner.top_banner_html_before.disabled = !enable;
    document.form_top_banner.top_banner_html_after.disabled = !enable;
    if (enable)
      document.form_top_banner.top_banner_html_before.focus();
  } else {
    document.form_side_banner.side_banner_html_before.disabled = !enable;
    document.form_side_banner.side_banner_html_after.disabled = !enable;
    if (enable)
      document.form_side_banner.side_banner_html_before.focus();
  }
}
function disableTextarea() {}
function disableTextarea_top(){ switchTextarea("top", false); }
function disableTextarea_side(){ switchTextarea("side", false); }
function disableTextarea_top_side(){ switchTextarea("top", false);
                                     switchTextarea("side", false); }
window.onload = disableTextarea({if !$top_banner_html_before && !$top_banner_html_after})_top({/if})({if !$side_banner_html_before && !$side_banner_html_after})_side({/if})
//-->
</script>

<h2>バナー管理</h2>

({if $msg})
<p class="caution">({$msg})</p>
({/if})

<h3>■トップバナー</h3>
<p>468 x 60 ピクセルの画像を設定してください。</p>

<form action="./" method="post" name="form_top_banner">
<table>
<tr>
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_top_banner_html','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input tabindex="1" type="radio" name="disp_type" value="img" onClick="switchTextarea('top', false);" onKeyPress="switchTextarea('top', false);"({if !$top_banner_html_before && !$top_banner_html_after}) checked="checked"({/if})></td>
<td>

<h4>★<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_banner')})">バナー画像を追加</a></h4>
({if $c_banner_top_list})
<table>
<tr>
<th colspan="2">操作</th>
<th>ID</th>
<th>画像</th>
<th>リンク先</th>
<th>表示位置</th>
<th>バナー名</th>
<th>表示（ログイン前）</th>
<th>表示（ログイン後）</th>
</tr>
({foreach from=$c_banner_top_list item=item})
<tr>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_banner')})&amp;c_banner_id=({$item.c_banner_id})">変更</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_banner_confirm')})&amp;c_banner_id=({$item.c_banner_id})">削除</a></td>
<td class="idnumber">({$item.c_banner_id})</td>
<td><a href="({t_img_url filename=$item.image_filename})" target="_blank"><img src="({t_img_url filename=$item.image_filename w=180 h=180})"></a></td>
<td>({$item.a_href})</td>
<td>({$item.type})</td>
<td>({$item.nickname})</td>
<td style="text-align:center">({if !$item.is_hidden_before})○({else})×({/if})</td>
<td style="text-align:center">({if !$item.is_hidden_after})○({else})×({/if})</td>
</tr>
({/foreach})
</table>
({/if})

</td>
<td rowspan="2"><input tabindex="4" type="submit" class="submit" value="確定"></td>
</tr>
<tr>
<td><input tabindex="2" type="radio" name="disp_type" value="html" onClick="switchTextarea('top', true);" onKeyPress="switchTextarea('top', true);"({if $top_banner_html_before || $top_banner_html_after}) checked="checked"({/if})></td>
<td><h4>★任意HTMLで表示</h4>
ログイン前<br>
<textarea tabindex="3" cols="72" rows="5" name="top_banner_html_before">({$top_banner_html_before})</textarea><br>
ログイン後<br>
<textarea tabindex="3" cols="72" rows="5" name="top_banner_html_after">({$top_banner_html_after})</textarea></td>
</tr>
</table>
</form>


<h3>■サイドバナー</h3>

<form action="./" method="post" name="form_side_banner">
<table>
<tr>
<td>
<input type="hidden" name="m" value="({$module_name})">
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_side_banner_html','do')})">
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input tabindex="5" type="radio" name="disp_type" value="img" onClick="switchTextarea('side', false);" onKeyPress="switchTextarea('side', false);"({if !$side_banner_html_before && !$side_banner_html_after}) checked="checked"({/if})></td>
<td>

<h4>★<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_banner')})&amp;type=side">バナー画像を追加</a></h4>
({if $c_banner_side_list})
<table>
<tr>
<th colspan="2">操作</th>
<th>ID</th>
<th>画像</th>
<th>リンク先</th>
<th>表示位置</th>
<th>バナー名</th>
<th>表示（ログイン前）</th>
<th>表示（ログイン後）</th>
</tr>
({foreach from=$c_banner_side_list item=item})
<tr>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_banner')})&amp;c_banner_id=({$item.c_banner_id})">変更</a></td>
<td><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_banner_confirm')})&amp;c_banner_id=({$item.c_banner_id})">削除</a></td>
<td class="idnumber">({$item.c_banner_id})</td>
<td><a href="({t_img_url filename=$item.image_filename})" target="_blank"><img src="({t_img_url filename=$item.image_filename w=180 h=180})"></a></td>
<td>({$item.a_href})</td>
<td>({$item.type})</td>
<td>({$item.nickname})</td>
<td style="text-align:center">({if !$item.is_hidden_before})○({else})×({/if})</td>
<td style="text-align:center">({if !$item.is_hidden_after})○({else})×({/if})</td>
</tr>
({/foreach})
</table>
({/if})

</td>
<td rowspan="2"><input tabindex="8" type="submit" class="submit" value="確定"></td>
</tr>
<tr>
<td><input tabindex="6" type="radio" name="disp_type" value="html" onClick="switchTextarea('side', true);" onKeyPress="switchTextarea('side', true);"({if $side_banner_html_before || $side_banner_html_after}) checked="checked"({/if})></td>
<td><h4>★任意HTMLで表示</h4>
ログイン前<br>
<textarea tabindex="7" cols="72" rows="5" name="side_banner_html_before">({$side_banner_html_before})</textarea><br>
ログイン後<br>
<textarea tabindex="7" cols="72" rows="5" name="side_banner_html_after">({$side_banner_html_after})</textarea></td>
</tr>
</table>
</form>

({$inc_footer|smarty:nodefaults})