({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ***************************** -->
<!-- ******ここから：写真一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：XXX さんの写真一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({if $target_member.c_member_id != $u})
({$target_member.nickname}) さんの
({/if})
写真一覧
</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div class="border_01 bg_02">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:190px;" align="center">

<img src="({t_img_url filename=$target_member.image_filename_1 w=180 h=180 noimg=no_image})" class="icon">

</td>
<td style="width:190px;" align="center">

<img src="({t_img_url filename=$target_member.image_filename_2 w=180 h=180 noimg=no_image})" class="icon">

</td>
<td style="width:190px;" align="center">

<img src="({t_img_url filename=$target_member.image_filename_3 w=180 h=180 noimg=no_image})" class="icon">

</td>
</tr>
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：XXX さんの写真一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：写真一覧****** -->
<!-- ***************************** -->


<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************************* -->
<!-- ******ここから：メンバーのトップページに戻る****** -->
<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})">
({if $target_member.c_member_id != $u})
このメンバーの
({/if})
トップページに戻る
</a>
<!-- ******ここまで：メンバーのトップページに戻る****** -->
<!-- ******************************************* -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">


({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
