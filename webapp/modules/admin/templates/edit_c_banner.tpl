({$inc_header|smarty:nodefaults})
({ext_include file="inc_subnavi_adminDesign.tpl"})
({assign var="page_name" value="バナー設定"})
({ext_include file="inc_tree_adminDesign.tpl"})
</div>

({*ここまで:navi*})

({if $msg})<p class="actionMsg">({$msg})</p>({/if})
<h2>バナー設定</h2>
<div class="contents">
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
<h3 class="item" id="ttl01">トップバナー</h3>
<p class="caution" id="c01">※468 x 60 ピクセルの画像を設定してください。</p>
<form action="./" method="post" name="form_top_banner">
<table class="basicType2" id="topBanner">
<tr>
<th class="radioBtn"><input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_top_banner_html','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input tabindex="1" type="radio" name="disp_type" value="img" onClick="switchTextarea('top', false);" onKeyPress="switchTextarea('top', false);"({if !$top_banner_html_before && !$top_banner_html_after}) checked="checked"({/if}) /></th>
<td class="image">
({if $c_banner_top_list})
<table class="basicType2">
<tr>
<th class="cell01" colspan="2">操作</th>
<th class="cell02">ID</th>
<th class="cell03">画像</th>
<th class="cell04">リンク先</th>
<th class="cell05">表示位置</th>
<th class="cell06">バナー名</th>
<th class="cell07">表示<br /><span>(ログイン前)</span></th>
<th class="cell08">表示<br /><span>(ログイン後)</span></th>
</tr>
({foreach from=$c_banner_top_list item=item})
<tr>
<td class="cell01A"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_banner')})&amp;c_banner_id=({$item.c_banner_id})">変更</a></td>
<td class="cell01B"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_banner_confirm')})&amp;c_banner_id=({$item.c_banner_id})">削除</a></td>
<td class="cell02">({$item.c_banner_id})</td>
<td class="cell03"><a href="({t_img_url filename=$item.image_filename})" target="_blank"><img src="({t_img_url filename=$item.image_filename w=180 h=180})"></a></td>
<td class="cell04">({$item.a_href})</td>
<td class="cell05">({$item.type})</td>
<td class="cell06">({$item.nickname})</td>
<td class="cell07">({if !$item.is_hidden_before})○({else})×({/if})</td>
<td class="cell08">({if !$item.is_hidden_after})○({else})×({/if})</td>
</tr>
({/foreach})
</table>
({else})
<p class="noBanner"><strong>未設定</strong>　（アップロードされているバナー画像はありません）</p>
({/if})
<p class="bannerUpload">【<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_banner')})">バナー画像を追加</a>】</p>
</td>
</tr>
<tr>
<th class="radioBtn"><input tabindex="2" type="radio" name="disp_type" value="html" onClick="switchTextarea('top', true);" onKeyPress="switchTextarea('top', true);"({if $top_banner_html_before || $top_banner_html_after}) checked="checked"({/if}) /></th>
<td class="html">
<dl>
<dt><strong>任意HTMLで表示する</strong></dt>
<dd>ログイン前<br /><textarea tabindex="3" cols="72" rows="5" name="top_banner_html_before">({$top_banner_html_before})</textarea></dd>
<dd>ログイン後<br /><textarea tabindex="3" cols="72" rows="5" name="top_banner_html_after">({$top_banner_html_after})</textarea></dd>
</dl>
</td>
</tr>

</table>
<p class="textBtn"><input tabindex="4" type="submit" value="トップバナー設定を確定する"></p>
</form>
<h3 class="item" id="ttl02">サイドバナー</h3>
<form action="./" method="post" name="form_side_banner">

<table class="basicType2" id="sideBanner">
<tr>
<th class="radioBtn"><input type="hidden" name="m" value="({$module_name})" />
<input type="hidden" name="a" value="do_({$hash_tbl->hash('update_side_banner_html','do')})" />
<input type="hidden" name="sessid" value="({$PHPSESSID})" />
<input tabindex="5" type="radio" name="disp_type" value="img" onClick="switchTextarea('side', false);" onKeyPress="switchTextarea('side', false);"({if !$side_banner_html_before && !$side_banner_html_after}) checked="checked"({/if}) /></th>
<td class="image">
({if $c_banner_side_list})
<table class="basicType2">
<tr>
<th class="cell01" colspan="2">操作</th>
<th class="cell02">ID</th>
<th class="cell03">画像</th>
<th class="cell04">リンク先</th>
<th class="cell05">表示位置</th>
<th class="cell06">バナー名</th>
<th class="cell07">表示<br /><span>(ログイン前)</span></th>
<th class="cell08">表示<br /><span>(ログイン後)</span></th>
</tr>
({foreach from=$c_banner_side_list item=item})
<tr>
<td class="cell01A"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('update_c_banner')})&amp;c_banner_id=({$item.c_banner_id})">変更</a></td>
<td class="cell01B"><a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('delete_c_banner_confirm')})&amp;c_banner_id=({$item.c_banner_id})">削除</a></td>
<td class="cell02">({$item.c_banner_id})</td>
<td class="cell03"><a href="({t_img_url filename=$item.image_filename})" target="_blank"><img src="({t_img_url filename=$item.image_filename w=180 h=180})" /></a></td>
<td class="cell04">({$item.a_href})</td>
<td class="cell05">({$item.type})</td>
<td class="cell06">({$item.nickname})</td>
<td class="cell07">({if !$item.is_hidden_before})○({else})×({/if})</td>
<td class="cell08">({if !$item.is_hidden_after})○({else})×({/if})</td>
</tr>
({/foreach})
</table>
({else})
<p class="noBanner"><strong>未設定</strong>　（アップロードされているバナー画像はありません）</p>
({/if})
<p class="bannerUpload">【<a href="?m=({$module_name})&amp;a=page_({$hash_tbl->hash('insert_c_banner')})&amp;type=side">バナー画像を追加</a>】</p>
</td>
</tr>
<tr>
<th class="radioBtn"><input tabindex="6" type="radio" name="disp_type" value="html" onClick="switchTextarea('side', true);" onKeyPress="switchTextarea('side', true);"({if $side_banner_html_before || $side_banner_html_after}) checked="checked"({/if}) /></th>
<td class="html">
<dl>
<dt><strong>任意HTMLで表示する</strong></dt>
<dd>ログイン前<br /><textarea tabindex="7" cols="72" rows="5" name="side_banner_html_before">({$side_banner_html_before})</textarea></dd>
<dd>ログイン後<br /><textarea tabindex="7" cols="72" rows="5" name="side_banner_html_after">({$side_banner_html_after})</textarea></dd>
</dl>
</td>
</tr>
</table>
<p class="textBtn"><input tabindex="8" type="submit" value="サイドバナー設定を確定する"></p>
</form>

({$inc_footer|smarty:nodefaults})
