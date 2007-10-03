({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ************************************ -->
<!-- ******ここから：マイフレンド最新レビュー一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_01">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$WORD_MY_FRIEND})最新レビュー</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->

({if $total_num})
<!-- ここから：主内容＞＞件数表示終わり -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="right" valign="middle">

<div class="padding_s">

({if $is_prev})
<a href="({t_url m=pc a=page_h_friend_review_list})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({/if})({$start_num})件～({$end_num})件を表示({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_friend_review_list})&amp;page=({$page})&amp;direc=1">次を表示</a>
({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞件数表示終わり -->
<!-- ここから：主内容＞＞日記一覧 -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({foreach from=$c_friend_review_list item=item})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:180px;" class="bg_05" align="center" valign="top">

<div class="padding_s">

({$item.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:453px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">({$item.title|t_truncate:50})</a>
(({$item.nickname}))

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
<!-- ここまで：主内容＞＞日記一覧 -->
<!-- ここから：主内容＞＞件数表示終わり -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="right" valign="middle">

<div class="padding_s">

({if $is_prev})
<a href="({t_url m=pc a=page_h_friend_review_list})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({/if})({$start_num})件～({$end_num})件を表示({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_friend_review_list})&amp;page=({$page})&amp;direc=1">次を表示</a>
({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞件数表示終わり -->

({else})

<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="center" valign="top">

<div class="padding_s">

まだ({$WORD_MY_FRIEND})のレビューがありません。

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>

({/if})

<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：マイフレンド最新レビュー一覧****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">


({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
