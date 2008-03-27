<div id="LayoutC">
<div id="Center">

({if $type == "h"})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>レビューを書く</h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_h_review_add})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="レビューを書く" /></li>
</ul>
({/t_form_block})
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_review_search})">全体のレビュー一覧を見る</a></li>
<li><a href="({t_url m=pc a=page_h_review_clip_list})">クリップを見る</a></li>
</ul>
</div>
</div></div>
({* }}} *})
({/if})

({if $c_review_list})

({* {{{ *})
({* #1949 *})<!-- ******ここから：レビュー一覧****** -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({* #1949 *})<tr>
({* #1949 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})</tr>
({* #1949 *})<tr>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td class="bg_01" align="center">
({* #1949 *})<!-- *ここから：レビュー一覧＞内容* -->
({* #1949 *})({*ここから：header*})
({* #1949 *})<!-- ここから：小タイトル -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1949 *})<tr>
({* #1949 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1949 *})<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* #1949 *})({$c_member.nickname})さんのレビュー一覧
({* #1949 *})</span></td>
({* #1949 *})</tr>
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：小タイトル -->
({* #1949 *})({*ここまで：header*})
({* #1949 *})({*ここから：body*})
({* #1949 *})<!-- ここから：主内容 -->
({* #1949 *})<!-- ここから：主内容＞＞件数表示終わり -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:634px;" class="bg_02" align="right" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({if $is_prev})<a href="({t_url m=pc a=page_fh_review_list_member})&amp;target_c_member_id=({$c_member.c_member_id})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({* #1949 *})({$start_num})件～({$end_num})件を表示
({* #1949 *})({if $is_next})<a href="({t_url m=pc a=page_fh_review_list_member})&amp;target_c_member_id=({$c_member.c_member_id})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：主内容＞＞件数表示終わり -->
({* #1949 *})<!-- ここから：主内容＞＞レビュー表示 -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})({foreach from=$c_review_list item=review})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:180px;" class="bg_02" align="center" valign="top" rowspan="11">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:180px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})<a href="({$review.url})" target="_blank"><img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" /><br />詳細を見る</a>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:180px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:100px;" class="bg_05" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:100px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})タイトル
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:100px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:352px;" class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:352px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$review.title})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:352px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})説明
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$review.release_date})<br />
({* #1949 *})({$review.manufacturer})<br />
({* #1949 *})({$review.author})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})レビュー
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s lh_120">
({* #1949 *})
({* #1949 *})({$review.body|nl2br})
({* #1949 *})
({* #1949 *})<div style="text-align:right;">
({* #1949 *})
({* #1949 *})<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$review.c_review_id})">全てのレビューを見る(({$review.write_num}))</a>
({* #1949 *})
({* #1949 *})({if $type == "h"})|<a href="({t_url m=pc a=page_h_review_add_write})&amp;category_id=({$review.c_review_category_id})&amp;asin=({$review.asin})">編集</a><br />({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})作成日時
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})満足度
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})<img src="({t_img_url_skin filename=satisfaction_level_`$review.satisfaction_level`})" class="icon" />
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})カテゴリ
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$review.category_disp})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})({/foreach})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：主内容＞＞レビュー表示 -->
({* #1949 *})<!-- ここから：主内容＞＞件数表示終わり -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:634px;" class="bg_02" align="right" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({if $is_prev})<a href="({t_url m=pc a=page_fh_review_list_member})&amp;target_c_member_id=({$c_member.c_member_id})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({* #1949 *})({$start_num})件～({$end_num})件を表示
({* #1949 *})({if $is_next})<a href="({t_url m=pc a=page_fh_review_list_member})&amp;target_c_member_id=({$c_member.c_member_id})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：主内容＞＞件数表示終わり -->
({* #1949 *})<!-- ここまで：主内容 -->
({* #1949 *})({*ここまで：body*})
({* #1949 *})({*ここから：footer*})
({* #1949 *})<!-- 無し -->
({* #1949 *})({*ここまで：footer*})
({* #1949 *})<!-- *ここまで：レビュー一覧＞＞内容* -->
({* #1949 *})</td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})</tr>
({* #1949 *})<tr>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})</tr>
({* #1949 *})</table>
({* #1949 *})<!-- ******ここまで：レビュー一覧****** -->
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$c_member.nickname})さんのレビュー一覧</h3></div>
<div class="block">
<p>まだレビューがありません。</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
