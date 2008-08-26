({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})

({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if $is_c_commu_member})
<!-- ********************************************* -->
<!-- ******ここから：おすすめレビューを掲載する****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：おすすめレビューを掲載する＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">[({$c_commu.name})] おすすめレビューを掲載する</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞内容外枠 -->
<div class="bg_05 border_01" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:564px;margin:0px auto;">
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;height:6px;" class="bg_09" colspan="3"><img src="./skin/dummy.gif" alt="dummy" style="width:562px;height:6px;" class="dummy"></td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:6px;" class="bg_09"><img src="./skin/dummy.gif" alt="dummy" style="width:6px;height:1px;" class="dummy"></td>
<td style="width:550px;" align="center">
<!-- ここから：主内容＞＞内容外枠＞＞内容そのもの -->

<table border="0" cellspacing="0" cellpadding="0" style="width:550px;">
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:548px;" class="bg_02" align="left" valign="middle">

<div style="padding:10px 40px;text-align:center;">

({t_form _method=get m=pc a=page_c_member_review_add})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<input type="submit" class="submit" value="　レビューを掲載する　">
</form>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

コミュニティ上にあなたが作成したおすすめレビューを掲載することができます。
おすすめレビューの作成は<a href="({t_url m=pc a=page_h_review_add})">こちら</a>

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>

<!-- ここまで：主内容＞＞内容外枠＞＞内容そのもの -->
</td>
<td style="width:6px;" class="bg_09"><img src="./skin/dummy.gif" alt="dummy" style="width:6px;height:1px;" class="dummy"></td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;height:6px;" class="bg_09" colspan="3"><img src="./skin/dummy.gif" alt="dummy" style="width:562px;height:6px;" class="dummy"></td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容＞＞内容外枠 -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：おすすめレビューを掲載する＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：おすすめレビューを掲載する****** -->
<!-- ********************************************* -->
({/if})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({if $c_member_review})

<!-- ********************************************* -->
<!-- ******ここから：メンバーのおすすめレビュー****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
<!-- *ここから：メンバーのおすすめレビュー＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<div class="border_01">
<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">メンバーのおすすめレビュー</span></td>
</tr>
</table>
</div>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞レビューリスト件数表示タブ -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="right" valign="middle">
<div style="padding:4px 3px;">

({if $is_prev})<a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({$start_num})件～({$end_num})件を表示<br>
({if $is_next})<a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})

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
<!-- ここまで：主内容＞＞レビューリスト件数表示タブ -->
<!-- ここから：主内容＞＞レビュー内容外枠 -->
<div class="bg_05 border_01" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;height:6px;" class="bg_09" colspan="3"><img src="./skin/dummy.gif" alt="dummy" style="width:562px;height:6px;" class="dummy"></td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:6px;" class="bg_09"><img src="./skin/dummy.gif" alt="dummy" style="width:6px;height:1px;" class="dummy"></td>
<td style="width:550px;" align="center">
<!-- ここから：主内容＞＞レビュー内容外枠＞＞レビュー内容 -->

({foreach from=$c_member_review item=review})
<table border="0" cellspacing="0" cellpadding="0" style="width:550px;padding:0px auto;">
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:190px;" class="bg_03" align="center" valign="top" rowspan="9">

<img src="./skin/dummy.gif" alt="dummy" style="width:190px;height:1px;" class="dummy">

<div class="padding_s">

<a href="({$review.url})" target="_blank">
<img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})"></a>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">

<a href="({$review.url})" target="_blank">
詳細を見る
</a>

</div>

<img src="./skin/dummy.gif" alt="dummy" style="width:190px;height:1px;" class="dummy">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:71px;" class="bg_05" align="center" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" style="width:71px;height:1px;" class="dummy">

<div class="padding_s">

タイトル

</div>

<img src="./skin/dummy.gif" alt="dummy" style="width:71px;height:1px;" class="dummy">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:286px;" class="bg_02" align="left" valign="middle">

<img src="./skin/dummy.gif" alt="dummy" style="width:286px;height:1px;" class="dummy">

<div class="padding_s b_b">

({$review.title})

</div>

<img src="./skin/dummy.gif" alt="dummy" style="width:286px;height:1px;" class="dummy">

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:358px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:71px;" class="bg_05"  align="center" valign="middle">

<div class="padding_s">

説　　明

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:286px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

({$review.release_date})<br>
({$review.manufacturer})<br>
({$review.artist})({$review.author})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:360px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:71px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

掲載日時

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:286px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:360px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:71px;" class="bg_05" align="center" valign="middle">

<div class="padding_s">

カテゴリ

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:286px;" class="bg_02" align="left" valign="middle">
<div class="padding_s">

({$review.category_disp})

</div>
</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:360px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:358px;" class="bg_02" align="right" valign="middle" colspan="3">

<div class="padding_s">

({if $c_commu.c_member_id_admin     == $u
||   $c_commu.c_member_id_sub_admin == $u
||   $review.c_member_id            == $u
})
<a href="({t_url m=pc a=page_c_member_review_delete_confirm})&amp;target_c_commu_review_id=({$review.c_commu_review_id})&amp;target_c_commu_id=({$c_commu.c_commu_id})">削除</a>&nbsp;
({/if})
<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$review.c_review_id})">他メンバーのレビューを見る</a>&nbsp;

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
({/foreach})

<!-- ここまで：主内容＞＞レビュー内容外枠＞＞レビュー内容 -->
</td>
<td style="width:6px;" class="bg_09"><img src="./skin/dummy.gif" alt="dummy" style="width:6px;height:1px;" class="dummy"></td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:562px;height:6px;" class="bg_09" colspan="3"><img src="./skin/dummy.gif" alt="dummy" style="width:562px;height:6px;" class="dummy"></td>
<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

</div>
<!-- ここまで：主内容＞＞レビュー内容外枠 -->
<!-- ここから：主内容＞＞レビューリスト件数表示タブ -->
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

({if $is_prev})<a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({$start_num})件～({$end_num})件を表示<br>
({if $is_next})<a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})

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
<!-- ここまで：主内容＞＞レビューリスト件数表示タブ -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：メンバーのおすすめレビュー＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>
<!-- ******ここまで：メンバーのおすすめレビュー****** -->
<!-- ********************************************* -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({/if})

<!-- **************************************** -->
<!-- ******ここから：コミュニティトップへ****** -->
<div id="link_community_top" align="center">

<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1">&nbsp;
<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]コミュニティトップへ</a>

</div>
<!-- ******ここまで：コミュニティトップへ****** -->
<!-- **************************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
