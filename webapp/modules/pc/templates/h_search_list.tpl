({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ********************************** -->
<!-- ******ここから：検索項目の一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:580px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;" class="bg_00"><img src="./skin/dummy.gif" alt="dummy" style="width:566px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:528px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">検索項目の一覧</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<table border="0" cellspacing="0" cellpadding="0" style="width:566px;">
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:564px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!-- ここから: ヘッダー下 説明文 -->
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:564px;" class="bg_09" align="center" valign="middle" colspan="3">

<div class="padding_s">

※数字は各項目を全体に公開しているメンバーの数になります。

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
<!-- ここまで: ヘッダー下 説明文 -->
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" colspan="3">

<!-- ここから：主内容 -->
<div class="bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:532px;margin:0px auto;">
({********})
<tr>
<td style="width:532px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:530px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">


({foreach from=$profile_list item=profile})
({if $profile.disp_search && ($profile.form_type == 'select' || $profile.form_type == 'checkbox' || $profile.form_type == 'radio')})
<!-- ここから：主内容＞＞({$profile.caption}) -->
<table border="0" cellspacing="0" cellpadding="0" style="width:530px;">
({*******})
<tr>
<td>

({$profile.caption})<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">

</td>
<td colspan="2">&nbsp;</td>
</tr>
({*******})
<tr>
<td style="width:70px;text-align:left;" valign="top">

<div class="padding_s">

&nbsp;

</div>

</td>

<td style="text-align:left;" valign="top">

<div class="padding_s">

<table>

({foreach from=$profile.options name=$profile.name item=item})
({counter name=$profile.name assign=cnt})
({if $cnt % 5 == 1})<tr>({/if})
<td style="padding-right:0.5em"><a href="({t_url m=pc a=page_h_search_result})&amp;profile%5B({$profile.name})%5D=({$item.c_profile_option_id})">({$item.value})&nbsp;(({$count_list[$item.c_profile_option_id]|default:0}))</a></td>
({if $cnt % 5 == 0})</tr>({/if})
({/foreach})
({if $cnt % 5 != 0})</tr>({/if})

</table>

</div>

</td>
</tr>
({*******})
</table>
<!-- ここまで：主内容＞＞({$profile.caption}) -->

<hr>
({/if})
({/foreach})


</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({********})
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容 -->

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここから：footer*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;height:1px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:566px;height:1px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;height:1px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：検索項目一覧****** -->
<!-- ******************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
