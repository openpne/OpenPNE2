({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ***************************** -->
<!-- ******ここから：レビュー****** -->
({t_form m=pc a=page_h_review_add_write_confirm})
<input type="hidden" name="asin" value="({$asin})">
<input type="hidden" name="category_id" value="({$category_id})">
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:646px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：レビュー＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:644px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:468px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">レビュー</span></td>
<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:644px;">
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" style="width:180px;" align="center" rowspan="7">

<a href="({$product.DetailPageURL})" target="_blank"><img src="({if $product.MediumImage})({$product.MediumImage.URL})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})"><br>詳細を見る</a>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:100px;" class="bg_05" align="left" valign="middle">

<div style="padding:6px;" class="c_01">

タイトル

</div>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:450px;height:50px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$product.ItemAttributes.Title})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div style="padding:6px;" class="c_01">

説明

</div>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:450px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

({$product.ItemAttributes.PublicationDate})<br>
({$product.ItemAttributes.Manufacturer})<br>
({$product.artist})({$product.author})

</div>
</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
<div style="padding:6px;" class="c_01">

レビュー

</div>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:450px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<textarea class="text" name="body" rows="8" cols="40" style="width:438px;">({$body})</textarea>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div style="padding:6px;" class="c_01">

満足度

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:450px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<select name="satisfaction_level">
<option value="0">----</option>
({html_options options=$satisfaction selected=$satisfaction_level})
</select>&nbsp;評価：５段階（５が最高、１が最低）

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:642px;" class="bg_03" align="left" valign="middle" colspan="6">
<div style="padding:5px 90px;">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<div align="center" style="text-align:center;">
<input type="submit" class="submit" value="確認画面">
</div>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:644px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：レビュー＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
</form>
<!-- ******ここまで：レビュー****** -->
<!-- ***************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
