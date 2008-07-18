({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ********************************** -->
<!-- ******ここから：レビューを書く****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：レビューを書く＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">レビューを書く</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<div style="width:636px;" class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<div style="width:558px;margin:0px auto;" class="border_01 bg_09">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:540px;">
({*********})
<tr>
<td style="width:540px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:538px;" class="bg_02" align="center" valign="middle">

<div style="padding:10px;">

({t_form _method=get m=pc a=page_h_review_add})
<input type="submit" class="submit" value="　　レビューを書く　　">
</form>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<div style="width:190px;margin:0px auto;text-align:left;">

<div>

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_h_review_search})">全体のレビュー一覧を見る</a>

</div>

<div>

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">
<a href="({t_url m=pc a=page_fh_review_list_member})">自分のレビュー一覧を見る</a>

</div>

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

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：レビューを書く＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：レビューを書く****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ******************************************** -->
<!-- ******ここから：クリップしたレビュー一覧****** -->
({t_form m=pc a=do_h_review_clip_list_delete_c_review_clip})
<input type="hidden" name="sessid" value="({$PHPSESSID})">

<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：クリップしたレビュー一覧＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">クリップしたレビュー一覧</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
({if $c_review_clip_list})
<!-- ここから：主内容＞＞件数表示タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_02" align="right" valign="middle">

<div class="padding_s">

({if $is_prev})<a href="({t_url m=pc a=page_h_review_clip_list})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({$start_num})件～({$end_num})件を表示
({if $is_next})<a href="({t_url m=pc a=page_h_review_clip_list})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞件数表示タブ -->
({/if})
<!-- ここから：主内容＞＞クリップしたレビュー一覧本体 -->
<div class="border_01 bg_05" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if $c_review_clip_list})

<!-- ここから：主内容＞＞クリップしたレビュー一覧本体＞＞のループ部分 -->
({foreach from=$c_review_clip_list item=review})
<div class="border_01 bg_09" style="width:562px;margin:0px auto;" align="center">
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;">
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:180px;" class="bg_03" align="center" valign="middle" rowspan="7">

<div style="padding:6px;">

<a href="({$review.url})" target="_blank">
<img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})"><br>
詳細を見る</a><br>
<input type="checkbox" name="c_review_clips[]" value="({$review.c_review_id})" class="no_bg">

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:85px;" class="bg_05" align="left" valign="middle">

<div class="padding_s">

タイトル

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:281px;" class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$review.title})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:369px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

追加日時

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_05" align="left" valign="middle">

<div class="padding_s">

カテゴリ

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="left" valign="middle">

<div class="padding_s">

({$review.category_disp})

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="height:1px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td class="bg_02" align="right" valign="middle" colspan="3">

<div class="padding_s">

<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$review.c_review_id})">全てのレビューを見る (({$review.write_num|default:"0"}))</a>

</div>

</td>
<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
</div>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({/foreach})
<!-- ここまで：主内容＞＞クリップしたレビュー一覧本体＞＞のループ部分 -->

({else})

<!-- ここから：主内容＞＞クリップしたレビュー一覧本体＞＞レビューが無い場合 -->
<div style="width:524px;margin:0px auto;" class="bg_02" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

まだ何もありません。

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容＞＞クリップしたレビュー一覧本体＞＞レビューが無い場合 -->

({/if})

</div>
<!-- ここまで：＞＞クリップしたレビュー一覧本体 -->
({if $c_review_clip_list})
<!-- ここから：主内容＞＞件数表示タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_02" align="right" valign="middle">

<div class="padding_s">

({if $is_prev})<a href="({t_url m=pc a=page_h_review_clip_list})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({$start_num})件～({$end_num})件を表示
({if $is_next})<a href="({t_url m=pc a=page_h_review_clip_list})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
<!-- ここまで：主内容＞＞件数表示タブ -->
({/if})
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
({if $c_review_clip_list})
<!-- ここから：フッター -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({*********})
<tr>
<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:632px;" class="bg_03" align="center" valign="middle">

<div class="padding_s">

<input type="hidden" name="post_key" value="f2e6dc7bcbcc05553aced92ad973913d">
<input type="submit" class="submit" value="　削　　除　">

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
<!-- ここまで：フッター -->
({/if})
({*ここまで：footer*})
<!-- *ここまで：クリップしたレビュー一覧＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

</form>
<!-- ******ここまで：クリップしたレビュー一覧****** -->
<!-- ******************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
