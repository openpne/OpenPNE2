<div id="LayoutC">
<div id="Center">

({* {{{ infoButtonBox  *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>レビューを書く</h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_h_review_add})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="レビューを書く" />
</ul>
({/t_form_block})
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_review_search})">全体のレビュー一覧を見る</a></li>
<li><a href="({t_url m=pc a=page_fh_review_list_member})">自分のレビュー一覧を見る</a></li>
</ul>
</div>
</div></div>
({* }}} *})

({* {{{ *})
({* #1949 *})<!-- ******ここから：クリップしたレビュー一覧****** -->
({* #1949 *})({t_form_block m=pc a=do_h_review_clip_list_delete_c_review_clip})
({* #1949 *})
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({* #1949 *})<tr>
({* #1949 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1949 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1949 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1949 *})</tr>
({* #1949 *})<tr>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1949 *})<td class="bg_01" align="center">
({* #1949 *})<!-- *ここから：クリップしたレビュー一覧＞内容* -->
({* #1949 *})({*ここから：header*})
({* #1949 *})<!-- ここから：小タイトル -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1949 *})<tr>
({* #1949 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1949 *})<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">クリップしたレビュー一覧</span></td>
({* #1949 *})</tr>
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：小タイトル -->
({* #1949 *})({*ここまで：header*})
({* #1949 *})({*ここから：body*})
({* #1949 *})<!-- ここから：主内容 -->
({* #1949 *})({if $c_review_clip_list})
({* #1949 *})<!-- ここから：主内容＞＞件数表示タブ -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td style="width:632px;" class="bg_02" align="right" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({if $is_prev})<a href="({t_url m=pc a=page_h_review_clip_list})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({* #1949 *})({$start_num})件～({$end_num})件を表示
({* #1949 *})({if $is_next})<a href="({t_url m=pc a=page_h_review_clip_list})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：主内容＞＞件数表示タブ -->
({* #1949 *})({/if})
({* #1949 *})<!-- ここから：主内容＞＞クリップしたレビュー一覧本体 -->
({* #1949 *})<div class="border_01 bg_05" align="center">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1949 *})
({* #1949 *})({if $c_review_clip_list})
({* #1949 *})
({* #1949 *})<!-- ここから：主内容＞＞クリップしたレビュー一覧本体＞＞のループ部分 -->
({* #1949 *})({foreach from=$c_review_clip_list item=review})
({* #1949 *})<div class="border_01 bg_09" style="width:562px;margin:0px auto;" align="center">
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td style="width:180px;" class="bg_03" align="center" valign="middle" rowspan="7">
({* #1949 *})
({* #1949 *})<div style="padding:6px;">
({* #1949 *})
({* #1949 *})<a href="({$review.url})" target="_blank">
({* #1949 *})<img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})"><br>
({* #1949 *})詳細を見る</a><br>
({* #1949 *})<input type="checkbox" name="c_review_clips[]" value="({$review.c_review_id})" class="no_bg">
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td style="width:85px;" class="bg_05" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})タイトル
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td style="width:281px;" class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$review.title})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td style="width:369px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td class="bg_05" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})追加日時
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td style="height:1px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td class="bg_05" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})カテゴリ
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$review.category_disp})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td style="height:1px;" class="bg_01" align="center" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td class="bg_02" align="right" valign="middle" colspan="3">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$review.c_review_id})">全てのレビューを見る (({$review.write_num|default:"0"}))</a>
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m">
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1949 *})({/foreach})
({* #1949 *})<!-- ここまで：主内容＞＞クリップしたレビュー一覧本体＞＞のループ部分 -->
({* #1949 *})
({* #1949 *})({else})
({* #1949 *})
({* #1949 *})<!-- ここから：主内容＞＞クリップしたレビュー一覧本体＞＞レビューが無い場合 -->
({* #1949 *})<div style="width:524px;margin:0px auto;" class="bg_02" align="center">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1949 *})
({* #1949 *})まだ何もありません。
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})<!-- ここまで：主内容＞＞クリップしたレビュー一覧本体＞＞レビューが無い場合 -->
({* #1949 *})
({* #1949 *})({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})<!-- ここまで：＞＞クリップしたレビュー一覧本体 -->
({* #1949 *})({if $c_review_clip_list})
({* #1949 *})<!-- ここから：主内容＞＞件数表示タブ -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td style="width:632px;" class="bg_02" align="right" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({if $is_prev})<a href="({t_url m=pc a=page_h_review_clip_list})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({* #1949 *})({$start_num})件～({$end_num})件を表示
({* #1949 *})({if $is_next})<a href="({t_url m=pc a=page_h_review_clip_list})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：主内容＞＞件数表示タブ -->
({* #1949 *})({/if})
({* #1949 *})<!-- ここまで：主内容 -->
({* #1949 *})({*ここまで：body*})
({* #1949 *})({*ここから：footer*})
({* #1949 *})({if $c_review_clip_list})
({* #1949 *})<!-- ここから：フッター -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})<td style="width:632px;" class="bg_03" align="center" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})<input type="hidden" name="post_key" value="f2e6dc7bcbcc05553aced92ad973913d">
({* #1949 *})<input type="submit" class="input_submit" value="　削　　除　">
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：フッター -->
({* #1949 *})({/if})
({* #1949 *})({*ここまで：footer*})
({* #1949 *})<!-- *ここまで：クリップしたレビュー一覧＞＞内容* -->
({* #1949 *})</td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1949 *})</tr>
({* #1949 *})<tr>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1949 *})</tr>
({* #1949 *})</table>
({* #1949 *})
({* #1949 *})({/t_form_block})
({* #1949 *})<!-- ******ここまで：クリップしたレビュー一覧****** -->
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
