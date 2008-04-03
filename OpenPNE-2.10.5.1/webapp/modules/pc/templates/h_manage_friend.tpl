({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ****************************************** -->
<!-- ******ここから：マイフレンド管理****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：マイフレンド管理＞内容* -->
<div class="border_01">
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">({$WORD_MY_FRIEND})管理</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({if $pager.total_num})
<!-- ここから：ページャー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $pager.prev})
<a href="({t_url m=pc a=page_h_manage_friend page=$pager.prev})">前を表示</a>&nbsp;&nbsp;
({/if})
({if $pager.total_num})
({$pager.start})件～({$pager.end})件を表示
({/if})
({if $pager.next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_manage_friend page=$pager.next})">次を表示</a>
({/if})

</div>
</td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：ページャー -->
({/if})
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
({if $c_friend_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({foreach from=$c_friend_list item=item})
<tr>
<td style="width:150px;height:50px;" class="bg_03" align="center" valign="middle">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" class="pict"><br>({$item.nickname})</a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:387px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

({if $item.intro})
({$item.intro|t_truncate:48:"":3})<br>
<a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$item.c_member_id})">編集</a>

<a href="({t_url m=pc a=page_f_intro_delete_confirm})&amp;target_c_member_id=({$item.c_member_id})&amp;sessid=({$PHPSESSID})">削除</a>
({else})
<a href="({t_url m=pc a=page_f_intro_edit})&amp;target_c_member_id=({$item.c_member_id})">紹介文を書く</a>
({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:95px;" class="bg_02">

<div class="padding_s">

<a href="({t_url m=pc a=page_fh_friend_list_delete_c_friend_confilm})&amp;target_c_member_id=({$item.c_member_id})">({$WORD_MY_FRIEND})から外す</a>

</div>

</td>
</tr>
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({/foreach})
</table>
({else})
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height: 50px;" class="bg_03" align="center" valign="middle">
({$WORD_MY_FRIEND})登録がありません。
</td>
</tr>
({*********})
</table>
({/if})
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
({if $pager.total_num})
<!-- ここから：ページャー -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $pager.prev})
<a href="({t_url m=pc a=page_h_manage_friend page=$pager.prev})">前を表示</a>&nbsp;&nbsp;
({/if})
({if $pager.total_num})
({$pager.start})件～({$pager.end})件を表示
({/if})
({if $pager.next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_h_manage_friend page=$pager.next})">次を表示</a>
({/if})

</div>
</td>
</tr>
({*********})
</table>
<!-- ここまで：ページャー -->
({/if})
({*ここまで：footer*})
</div>
<!-- *ここまで：マイフレンド管理＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：マイフレンド管理****** -->
<!-- ****************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">


({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})

