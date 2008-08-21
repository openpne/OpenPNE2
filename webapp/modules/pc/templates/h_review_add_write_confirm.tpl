({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************** -->
<!-- ******ここから：書き込み確認****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:576px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：書き込み確認＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:574px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:398px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">以下の内容でよろしいですか？</span></td>
<td style="width:140px;" align="right" class="bg_06">&nbsp;</td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:574px;">
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:100px;" class="bg_05" align="left" valign="middle">

<div style="padding: 3px;">
レビュー
</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:476px;" class="bg_02" align="left" valign="middle">
<div style="padding:10px;">

({$body|nl2br})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:100px;" class="bg_05" align="left" valign="middle">

<div class="padding_s">
満足度
</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:476px;" class="bg_02" align="left" valign="middle">
<div style="padding:10px;">

<img src="({t_img_url_skin filename=satisfaction_level_`$satisfaction_level`})" class="icon">

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:572px;" class="bg_03" align="center" valign="middle" colspan="3">

<div style="padding:5px;" align="center">

<table border="0" cellspacing="0" cellpadding="0" style="width:200px;height:20px;margin:0px auto;">
<tr>
<td>

({t_form m=pc a=do_h_review_add})
<input type="hidden" name="sessid" value="({$PHPSESSID})">
<input type="hidden" name="category_id" value="({$category_id})">
<input type="hidden" name="asin" value="({$asin})">
<input type="hidden" name="body" value="({$body})">
<input type="hidden" name="satisfaction_level" value="({$satisfaction_level})">
<input type="submit" class="submit" value="　作　成　">
</form>

</td>
<td>

({t_form _method=get m=pc a=page_h_review_add_write})
<input type="hidden" name="category_id" value="({$category_id})">
<input type="hidden" name="asin" value="({$asin})">
<input type="hidden" name="body" value="({$body})">
<input type="hidden" name="satisfaction_level" value="({$satisfaction_level})">
<input type="submit" class="submit" value="　修　正　">
</form>

</td>
</tr>
</table>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:574px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：書き込み確認＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：書き込み確認****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">


({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})



