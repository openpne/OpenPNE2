<div id="LayoutC">
<div id="Center">

({* #1926 *})<!-- ******ここから：メッセージ****** -->
({* #1926 *})<div id="message" class="border_07 bg_02" style="width:600px;">
({* #1926 *})
({* #1926 *})<div class="padding_w_m">
({* #1926 *})
({* #1926 *})<span class="b_b">掲載したいレビューにチェックを入れて「掲載」をクリックしてください。
({* #1926 *})掲載したいレビューがない場合は  <a href="({t_url m=pc a=page_h_review_add})">こちら</a> より作成してください
({* #1926 *})</span>
({* #1926 *})
({* #1926 *})</div>
({* #1926 *})
({* #1926 *})</div>
({* #1926 *})<!-- ******ここまで：メッセージ****** -->
({* unknown *})({if $c_review_list})
({* #1949 *})<!-- ******ここから：あなたのレビュー一覧****** -->
({* #1949 *})({t_form_block m=pc a=page_c_member_review_add_confirm})
({* #1949 *})<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
({* #1949 *})
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({* #1949 *})<tr>
({* #1949 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})</tr>
({* #1949 *})<tr>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td class="bg_01" align="center">
({* #1949 *})<!-- *ここから：あなたのレビュー一覧＞内容* -->
({* #1949 *})({*ここから：header*})
({* #1949 *})<!-- ここから：小タイトル -->
({* #1949 *})<div class="border_01">
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({* #1949 *})<tr>
({* #1949 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1949 *})<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b">あなたのレビュー一覧</span></td>
({* #1949 *})</tr>
({* #1949 *})</table>
({* #1949 *})</div>
({* #1949 *})<!-- ここまで：小タイトル -->
({* #1949 *})({*ここまで：header*})
({* #1949 *})({*ここから：body*})
({* #1949 *})<!-- ここから：主内容 -->
({* #1949 *})<!-- ここから：主内容＞＞レビューリスト件数表示タブ -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:634px;" class="bg_02" align="right" valign="middle">
({* #1949 *})<div style="padding:4px 3px;">
({* #1949 *})
({* #1949 *})({if $is_prev})<a href="({t_url m=pc a=page_c_member_review_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({* #1949 *})({$start_num})件～({$end_num})件を表示<br />
({* #1949 *})({if $is_next})<a href="({t_url m=pc a=page_c_member_review_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：主内容＞＞レビューリスト件数表示タブ -->
({* #1949 *})<!-- ここから：主内容＞＞レビュー内容 -->
({* #1949 *})({foreach from=$c_review_list item=review})
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:180px;" class="bg_03" align="center" valign="top" rowspan="12">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:180px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})<a href="({$review.url})" target="_blank">
({* #1949 *})<img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" /></a>
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s" />
({* #1949 *})
({* #1949 *})<a href="({$review.url})" target="_blank">
({* #1949 *})詳細を見る
({* #1949 *})</a>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s" />
({* #1949 *})
({* #1949 *})<input type="checkbox" name="c_review_id[]" value="({$review.c_review_id})" class="no_bg">
({* #1949 *})<br />このレビューを掲載する
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:180px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:112px;" class="bg_05" align="center" valign="middle">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:112px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})タイトル
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:112px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:338px;" class="bg_02" align="left" valign="middle">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:338px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})<div class="padding_s b_b">
({* #1949 *})
({* #1949 *})({$review.title})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:338px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="center" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})説　　明
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$review.release_date})<br />
({* #1949 *})({$review.manufacturer})<br />
({* #1949 *})({$review.author})<br />
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="center" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})レビュー本文
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})<div class="padding_s lh_120">
({* #1949 *})
({* #1949 *})({$review.body|nl2br})
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_m" />
({* #1949 *})
({* #1949 *})<div style="text-align:right;"><a href="({t_url m=pc a=page_h_review_add_write})&amp;category_id=({$review.c_review_category_id})&amp;asin=({$review.asin})">編集</a></div>
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="center" valign="middle">
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
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="center" valign="middle">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})満 足 度
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left" valign="middle">
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})<img src="({t_img_url_skin filename=satisfaction_level_`$review.satisfaction_level`})" class="icon" />
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_05" align="center" valign="middle">
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
({* #1949 *})<div style="padding:8px 3px;" class="lh_120">
({* #1949 *})
({* #1949 *})({$review.category_disp})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})</td>
({* #1949 *})<td class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})({/foreach})
({* #1949 *})<!-- ここまで：主内容＞＞レビュー内容 -->
({* #1949 *})<!-- ここから：主内容＞＞レビューリスト件数表示タブ -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:634px;" class="bg_02" align="right" valign="middle">
({* #1949 *})<div style="padding:4px 3px;">
({* #1949 *})
({* #1949 *})({if $is_prev})<a href="({t_url m=pc a=page_c_member_review_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({* #1949 *})({$start_num})件～({$end_num})件を表示<br />
({* #1949 *})({if $is_next})<a href="({t_url m=pc a=page_c_member_review_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：主内容＞＞レビューリスト件数表示タブ -->
({* #1949 *})<!-- ここまで：主内容 -->
({* #1949 *})({*ここまで：body*})
({* #1949 *})({*ここから：footer*})
({* #1949 *})<!-- ここから：決定 -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:634px;" class="bg_02" align="left" valign="middle">
({* #1949 *})<div style="text-align:center;" class="padding_w_s">
({* #1949 *})
({* #1949 *})
({* #1949 *})<input type="submit" class="input_submit" value="　掲　　載　">
({* #1949 *})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：決定 -->
({* #1949 *})({*ここまで：footer*})
({* #1949 *})<!-- *ここまで：あなたのレビュー一覧＞＞内容* -->
({* #1949 *})</td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})</tr>
({* #1949 *})<tr>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})</tr>
({* #1949 *})</table>
({* #1949 *})
({* #1949 *})({/t_form_block})
({* #1949 *})<!-- ******ここまで：あなたのレビュー一覧****** -->
({* unknown *})({/if})
({* #1939 *})<!-- ******ここから：コミュニティトップへ****** -->
({* #1939 *})<div class="content_footer" id="link_community_top" align="center">
({* #1939 *})
({* #1939 *})<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1" />&nbsp;
({* #1939 *})<a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]コミュニティトップへ</a>
({* #1939 *})
({* #1939 *})</div>
({* #1939 *})<!-- ******ここまで：コミュニティトップへ****** -->

</div><!-- Center -->
</div><!-- LayoutC -->
