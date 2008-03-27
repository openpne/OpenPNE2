({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************* -->
<!-- ******ここから：写真を編集****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：写真を編集＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">写真を編集する</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞１ -->
<div class="border_01 bg_02">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:188px;" align="center">

({if $c_member.image_filename_1})
<img src="({t_img_url filename=$c_member.image_filename_1 w=180 h=180})"><br>
[ <a href="({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=1&amp;sessid=({$PHPSESSID})">削除</a> |
({if $c_member.image_filename_1==$c_member.image_filename})
メイン写真
({else})
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=1&amp;sessid=({$PHPSESSID})">メイン写真</a>
({/if})
 ]
({else})
<img src="({t_img_url_skin filename=no_image w=180 h=180})">
({/if})

</td>

<td style="width:188px;" align="center">

({if $c_member.image_filename_2})
<img src="({t_img_url filename=$c_member.image_filename_2 w=180 h=180})"><br>
[ <a href="({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=2&amp;sessid=({$PHPSESSID})">削除</a> |
({if $c_member.image_filename_2==$c_member.image_filename})
メイン写真
({else})
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=2&amp;sessid=({$PHPSESSID})">メイン写真</a>
({/if})
 ]
({else})
<img src="({t_img_url_skin filename=no_image w=180 h=180})">
({/if})

</td>

<td style="width:188px;" align="center">

({if $c_member.image_filename_3})
<img src="({t_img_url filename=$c_member.image_filename_3 w=180 h=180})"><br>
[ <a href="({t_url m=pc a=do_h_config_image_delete_c_member_image})&amp;img_num=3&amp;sessid=({$PHPSESSID})">削除</a> |
({if $c_member.image_filename_3==$c_member.image_filename})
メイン写真
({else})
<a href="({t_url m=pc a=do_h_config_image_change_main_c_member_image})&amp;img_num=3&amp;sessid=({$PHPSESSID})">メイン写真</a>
({/if})
 ]
({else})
<img src="({t_img_url_skin filename=no_image w=180 h=180})">
({/if})

</td>

</tr>
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容＞＞２ -->
<!-- ここから：主内容＞＞２ -->
<div class="border_01 bg_02">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:230px;" align="center" valign="middle" rowspan="3">

({t_form _enctype=file m=pc a=do_h_config_image})
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<input name="upfile" type="file" value=" 参 照 ">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<input type="submit" class="submit" name="submit" value="写真をアップロードする">
</form>
</td>
<td style="width:1em;" align="right" valign="top">・</td>
<td style="width:auto;" align="left" valign="top">

写真は最大3枚までアップロードできます。

</td>
</tr>
<tr>
<td style="width:1em;" align="right" valign="top">・</td>
<td style="width:auto;" align="left" valign="top">

({$smarty.const.IMAGE_MAX_FILESIZE})KB以内のGIF・JPEG・PNGにしてください。

</td>
</tr>
<tr>
<td style="width:1em;" align="right" valign="top">・</td>
<td style="width:auto;" align="left" valign="top">

著作権や肖像権の侵害にあたる写真、暴力的・卑猥な写真、他のメンバーが見て不快に感じる写真の掲載は禁止しております。掲載はご自身の責任でお願いいたします。

</td>
</tr>
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容＞＞２ -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：写真を編集＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：写真を編集****** -->
<!-- ******************************* -->


<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************** -->
<!-- ******ここから：トップページに戻る****** -->
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;<a href="({t_url m=pc a=page_h_home})">ホームに戻る</a>
<!-- ******ここまで：トップページに戻る****** -->
<!-- ************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">


({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
