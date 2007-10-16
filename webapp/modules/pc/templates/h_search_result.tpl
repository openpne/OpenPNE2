({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************** -->
<!-- ******ここから：メンバー一覧****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：メンバー一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:600px;padding:2px 0px;" class="bg_06"><span class="c_00"><span class="b_b">検索結果一覧</span>&nbsp;&nbsp;***&nbsp;({$pager.total_num})&nbsp;名 が該当しました。</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->

<!-- ここから：主内容＞＞メンバー一覧件数表示タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">
&nbsp;&nbsp;
({if $pager.page_prev})
<a href="({t_url m=pc a=page_h_search_result})&amp;page=({$pager.page_prev})&amp;({$search_condition})">前を表示</a>
({/if})

({if $pager.total_num})
({$pager.disp_start})件～({$pager.disp_end})件を表示
({/if})

({if $pager.page_next})
<a href="({t_url m=pc a=page_h_search_result})&amp;page=({$pager.page_next})&amp;({$search_condition})">次を表示</a>
({/if})
</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞メンバー一覧件数表示タブ -->

<!-- ここから：主内容＞＞メンバープロフィール一覧本体 -->
<div class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ここから：主内容＞＞メンバープロフィール一覧本体＞＞のループ部分 -->
({foreach from=$target_friend_list item=item})
<div class="border_01 bg_09" style="width:562px;margin:0px auto;" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;">
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="9"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center" rowspan="9"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:90px;" class="bg_03" align="center" valign="middle" rowspan="9">

<div class="padding_s">

<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})">
<img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})"></a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center" rowspan="9"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:100px;" class="bg_05" align="left" valign="middle">

<div class="padding_s">
ニックネーム
</div>

</td>
<td style="width:1px;" class="bg_01" align="center" rowspan="9"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:363px;" class="bg_02" align="left" valign="middle" colspan="3">

<div class="padding_s">
({$item.nickname})
</div>

</td>
<td style="width:1px;" class="bg_01" align="center" rowspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_05" align="left" valign="middle">
<div class="padding_s">
自己紹介
</div>
</td>
<td class="bg_02" align="left" valign="middle" colspan="3">
<div class="padding_s">
({$item.profile.self_intro.value|t_truncate:36:"":3})
</div>
</td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" align="center" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">
最終ログイン
</div>

</td>
<td class="bg_02" align="left" valign="middle" style="width:100px;">

<div class="padding_s">
({$item.last_login})
</div>

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:262px;" class="bg_03" align="center">

<div class="padding_s">
<a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る"></a>
</div>

</td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="9"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
</div>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({/foreach})
<!--　↑　プロフィール表示ここまで　↑　-->
<!-- ここまで：主内容＞＞メンバープロフィール一覧本体＞＞のループ部分 -->

</div>
<!-- ここまで：＞＞メンバープロフィール一覧本体 -->

<!-- ここから：主内容＞＞メンバー一覧件数表示タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

&nbsp;&nbsp;
({if $pager.page_prev})
<a href="({t_url m=pc a=page_h_search_result})&amp;page=({$pager.page_prev})&amp;({$search_condition})">前を表示</a>
({/if})

({if $pager.total_num})
({$pager.disp_start})件～({$pager.disp_end})件を表示
({/if})

({if $pager.page_next})
<a href="({t_url m=pc a=page_h_search_result})&amp;page=({$pager.page_next})&amp;({$search_condition})">次を表示</a>
({/if})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞メンバー一覧件数表示タブ -->

<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：メンバー一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メンバー一覧****** -->
<!-- ************************************ -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
