({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ********************************** -->
<!-- ******ここから：レビュー検索・並び替え****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_05" align="center">
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
レビュー検索・並び替え
</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div class="border_01 bg_05">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;" class="border_01">
({*********})
<tr>
<td style="width:548px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" valign="middle">

({t_form m=pc a=page_h_review_search})
<table border="0" cellspacing="0" cellpadding="3" style="width:546px;">
<!-- ここから：主内容＞再検索フォーム -->
<tr>
<td style="width:100px;" align="right">

<div class="padding_s">

並び替え&nbsp;<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">

</div>

</td>
<td style="width:440px;">

<div class="padding_s">

<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;category=({$category})&amp;orderby=r_num">登録数順</a>
|
<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;category=({$category})&amp;orderby=r_datetime">作成日順</a>

</div>

</td>
</tr>
({*********})
<tr>
<td valign="top" align="right">

<div class="padding_s">

キーワード&nbsp;<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">

</div>

</td>
<td valign="top">

<div class="padding_s">

<input type="text" class="text" name="keyword" value="({$keyword})" size="15">&nbsp;
&nbsp;カテゴリ&nbsp;<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">
<select name="category">
<option value="">指定なし</option>
({html_options options=$category_disp selected=$category})
</select>
<input type="submit" class="submit" value="　検 索　">

</div>

</td>
</tr>
<!-- ここまで：主内容＞再検索フォーム -->
({*********})
<!-- ここから：主内容＞レビューを作成するリンク -->
<tr>
<td align="center" valign="middle" colspan="2">

<div class="padding_s">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_review_add})")>レビューを作成する</a>

</div>

</td>
</tr>
<!-- ここまで：主内容＞レビューを作成するリンク -->
({*********})
<tr>
<td align="center" valign="middle" colspan="2">

<hr>

</td>
</tr>
({********})
<!-- ここから：主内容＞カテゴリリンク -->
<tr>
<td valign="top" align="right">

<div class="padding_s">

カテゴリ&nbsp;<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon">

</div>

</td>
<td valign="top">

<div class="padding_s">

({foreach from=$category_disp key=key item=item})
({if $key!=1}) - ({/if})
<a href="({t_url m=pc a=page_h_review_search})&amp;category=({$key})">({$item})</a>
({/foreach})

</div>

</td>
</tr>
<!-- ここまで：主内容＞カテゴリリンク -->
({********})
</table>
</form>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：レビュー検索・並び替え****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({* if $result *})
<!-- ************************************ -->
<!-- ******ここから：検索結果****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td align="center">
<!-- *ここから：主内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="c_00"><span class="b_b">レビュー一覧</span>&nbsp;&nbsp;***&nbsp;<span class="b_b">
({if $total_num})
    ({$total_num})
({else})
    0
({/if})
件</span>&nbsp;が該当しました。</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
<!-- ここから：レビュー一覧件数表示タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="right">

<div class="padding_s">

({if $is_prev})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;direc=-1&amp;page=({$page})">前を表示</a> ({/if})
({if $total_num})
({$start_num})件～({$end_num})件を表示
({/if})
({if $is_next})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;direc=1&amp;page=({$page})">次を表示</a>({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：レビュー一覧件数表示タブ -->
({*ここまで：header*})
({*ここから：body*})
<!-- *ここから：主内容* -->
<!-- *ここから：検索結果内容＞＞商品情報* -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
({foreach from=$result item=item})
<!--▼レビュー1つ分ここから-->
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:180px;" class="bg_02" rowspan="7" align="center">

<img src="./skin/dummy.gif" alt="dummy" style="width:180px;height:1px;" class="dummy">

<div class="padding_s">

<a href="({$item.url})" target="_blank"><img src="({if $item.image_medium})({$item.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})"><br>詳細を見る</a>

</div>

<img src="./skin/dummy.gif" alt="dummy" style="width:180px;height:1px;" class="dummy">

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:70px;" class="bg_03" align="center">

<img src="./skin/dummy.gif" alt="dummy" style="width:70px;height:1px;" class="dummy">

<div class="padding_s">

タイトル

</div>

<img src="./skin/dummy.gif" alt="dummy" style="width:70px;height:1px;" class="dummy">

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:382px;" class="bg_02">

<img src="./skin/dummy.gif" alt="dummy" style="width:382px;height:1px;" class="dummy">

<div class="padding_s">

<span class="b_b">({$item.title})</span>

</div>

<img src="./skin/dummy.gif" alt="dummy" style="width:382px;height:1px;" class="dummy">

</td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:455px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_03" align="center">

<div class="padding_s">

最新レビュー

</div>

</td>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left">

<div class="padding_s">

({$item.body|nl2br})

</div>

</td>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_03" align="center">

<div class="padding_s">

作成日時

</div>

</td>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left">

<div class="padding_s">

({$item.r_datetime2|date_format:"%Y年%m月%d日 %H:%M"})
</div>

</td>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="right" colspan="3">

<div class="padding_s">
<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">全てのレビューを見る (({$item.write_num|default:0}))</a>
({*<a href="({t_url m=pc a=page_h_review_add_write})&amp;category_id=({$item.c_review_category_id})&amp;asin=({$item.asin})">レビューを書く</a>*})

</div>

</td>
<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<!--▲レビュー1つ分ここまで-->
({/foreach})
</table>
<!-- *ここまで：検索結果内容＞＞商品情報* -->
<!-- *ここまで：主内容* -->
({*ここまで：body*})
({*ここから：footer*})
<!-- ここから：レビュー一覧件数表示タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="right">

<div class="padding_s">

({if $is_prev})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;direc=-1&amp;page=({$page})">前を表示</a> ({/if})
({if $total_num})
({$start_num})件～({$end_num})件を表示
({/if})
({if $is_next})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;direc=1&amp;page=({$page})">次を表示</a>({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：レビュー一覧件数表示タブ -->
({*ここから：footer*})
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：検索結果****** -->
<!-- ************************************ -->
({* /if *})


<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
