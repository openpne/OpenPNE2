<div id="LayoutC">
<div id="Center">

({if $is_c_commu_member})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>おすすめレビューを掲載する</h3></div>
<div class="block">
({t_form_block _method=get m=pc a=page_c_member_review_add})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="レビューを掲載する" /></li>
</ul>
({/t_form_block})
<p>コミュニティ上にあなたが作成したおすすめレビューを掲載することができます。<br />
おすすめレビューの作成は<a href="({t_url m=pc a=page_h_review_add})">こちら</a></p>
</div>
</div></div>
({* }}} *})
({/if})

({if $c_member_review})
({* {{{ *})
({* #1935 *})<!-- ******ここから：メンバーのおすすめレビュー****** -->
({* #1935 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({* #1935 *})<tr>
({* #1935 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1935 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1935 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1935 *})</tr>
({* #1935 *})<tr>
({* #1935 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1935 *})<td class="bg_01" align="center">
({* #1935 *})<!-- *ここから：メンバーのおすすめレビュー＞内容* -->
({* #1935 *})({*ここから：header*})
({* #1935 *})<!-- ここから：小タイトル -->
({* #1935 *})<div class="border_01">
({* #1935 *})<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({* #1935 *})<tr>
({* #1935 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
({* #1935 *})<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b">メンバーのおすすめレビュー</span></td>
({* #1935 *})</tr>
({* #1935 *})</table>
({* #1935 *})</div>
({* #1935 *})<!-- ここまで：小タイトル -->
({* #1935 *})({*ここまで：header*})
({* #1935 *})({*ここから：body*})
({* #1935 *})<!-- ここから：主内容 -->
({* #1935 *})<!-- ここから：主内容＞＞レビューリスト件数表示タブ -->
({* #1935 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:634px;" class="bg_02" align="right" valign="middle">
({* #1935 *})<div style="padding:4px 3px;">
({* #1935 *})
({* #1935 *})({if $is_prev})<a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({* #1935 *})({$start_num})件～({$end_num})件を表示<br />
({* #1935 *})({if $is_next})<a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})</table>
({* #1935 *})<!-- ここまで：主内容＞＞レビューリスト件数表示タブ -->
({* #1935 *})<!-- ここから：主内容＞＞レビュー内容外枠 -->
({* #1935 *})<div class="bg_05 border_01" align="center">
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1935 *})
({* #1935 *})<table border="0" cellspacing="0" cellpadding="0" style="width:564px;">
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:562px;height:6px;" class="bg_09" colspan="3"><img src="./skin/dummy.gif" alt="dummy" style="width:562px;height:6px;" class="dummy"></td>
({* #1935 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:6px;" class="bg_09"><img src="./skin/dummy.gif" alt="dummy" style="width:6px;height:1px;" class="dummy"></td>
({* #1935 *})<td style="width:550px;" align="center">
({* #1935 *})<!-- ここから：主内容＞＞レビュー内容外枠＞＞レビュー内容 -->
({* #1935 *})
({* #1935 *})({foreach from=$c_member_review item=review})
({* #1935 *})<table border="0" cellspacing="0" cellpadding="0" style="width:550px;padding:0px auto;">
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:190px;" class="bg_03" align="center" valign="top" rowspan="9">
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" style="width:190px;height:1px;" class="dummy">
({* #1935 *})
({* #1935 *})<div class="padding_s">
({* #1935 *})
({* #1935 *})<a href="({$review.url})" target="_blank">
({* #1935 *})<img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})"></a>
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_s">
({* #1935 *})
({* #1935 *})<a href="({$review.url})" target="_blank">
({* #1935 *})詳細を見る
({* #1935 *})</a>
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" style="width:190px;height:1px;" class="dummy">
({* #1935 *})
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:71px;" class="bg_05" align="center" valign="middle">
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" style="width:71px;height:1px;" class="dummy">
({* #1935 *})
({* #1935 *})<div class="padding_s">
({* #1935 *})
({* #1935 *})タイトル
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" style="width:71px;height:1px;" class="dummy">
({* #1935 *})
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:286px;" class="bg_02" align="left" valign="middle">
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" style="width:286px;height:1px;" class="dummy">
({* #1935 *})
({* #1935 *})<div class="padding_s b_b">
({* #1935 *})
({* #1935 *})({$review.title})
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" style="width:286px;height:1px;" class="dummy">
({* #1935 *})
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:358px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:71px;" class="bg_05"  align="center" valign="middle">
({* #1935 *})
({* #1935 *})<div class="padding_s">
({* #1935 *})
({* #1935 *})説　　明
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:286px;" class="bg_02" align="left" valign="middle">
({* #1935 *})<div class="padding_s">
({* #1935 *})
({* #1935 *})({$review.release_date})<br />
({* #1935 *})({$review.manufacturer})<br />
({* #1935 *})({$review.artist})({$review.author})
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:360px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:71px;" class="bg_05" align="center" valign="middle">
({* #1935 *})
({* #1935 *})<div class="padding_s">
({* #1935 *})
({* #1935 *})掲載日時
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:286px;" class="bg_02" align="left" valign="middle">
({* #1935 *})<div class="padding_s">
({* #1935 *})
({* #1935 *})({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:360px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:71px;" class="bg_05" align="center" valign="middle">
({* #1935 *})
({* #1935 *})<div class="padding_s">
({* #1935 *})
({* #1935 *})カテゴリ
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:286px;" class="bg_02" align="left" valign="middle">
({* #1935 *})<div class="padding_s">
({* #1935 *})
({* #1935 *})({$review.category_disp})
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:360px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:358px;" class="bg_02" align="right" valign="middle" colspan="3">
({* #1935 *})
({* #1935 *})<div class="padding_s">
({* #1935 *})
({* #1935 *})({if $c_commu.c_member_id_admin     == $u
||   $c_commu.c_member_id_sub_admin == $u
||   $review.c_member_id            == $u
})
({* #1935 *})<a href="({t_url m=pc a=page_c_member_review_delete_confirm})&amp;target_c_commu_review_id=({$review.c_commu_review_id})&amp;target_c_commu_id=({$c_commu.c_commu_id})">削除</a>&nbsp;
({* #1935 *})({/if})
({* #1935 *})<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$review.c_review_id})">他メンバーのレビューを見る</a>&nbsp;
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:550px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})</table>
({* #1935 *})({/foreach})
({* #1935 *})
({* #1935 *})<!-- ここまで：主内容＞＞レビュー内容外枠＞＞レビュー内容 -->
({* #1935 *})</td>
({* #1935 *})<td style="width:6px;" class="bg_09"><img src="./skin/dummy.gif" alt="dummy" style="width:6px;height:1px;" class="dummy"></td>
({* #1935 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:562px;height:6px;" class="bg_09" colspan="3"><img src="./skin/dummy.gif" alt="dummy" style="width:562px;height:6px;" class="dummy"></td>
({* #1935 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:564px;height:1px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})</table>
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1935 *})
({* #1935 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})<!-- ここまで：主内容＞＞レビュー内容外枠 -->
({* #1935 *})<!-- ここから：主内容＞＞レビューリスト件数表示タブ -->
({* #1935 *})<table border="0" cellspacing="0" cellpadding="0" style="width:634px;">
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:634px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})<td style="width:632px;" class="bg_02" align="right" valign="middle">
({* #1935 *})<div style="padding:4px 3px;">
({* #1935 *})
({* #1935 *})({if $is_prev})<a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=-1&amp;page=({$page})">＜前</a> ({/if})
({* #1935 *})({$start_num})件～({$end_num})件を表示<br />
({* #1935 *})({if $is_next})<a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;direc=1&amp;page=({$page})">次＞</a>({/if})
({* #1935 *})
({* #1935 *})</div>
({* #1935 *})</td>
({* #1935 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})<tr>
({* #1935 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
({* #1935 *})</tr>
({* #1935 *})({*********})
({* #1935 *})</table>
({* #1935 *})<!-- ここまで：主内容＞＞レビューリスト件数表示タブ -->
({* #1935 *})<!-- ここまで：主内容 -->
({* #1935 *})({*ここまで：body*})
({* #1935 *})({*ここから：footer*})
({* #1935 *})<!-- 無し -->
({* #1935 *})({*ここまで：footer*})
({* #1935 *})<!-- *ここまで：メンバーのおすすめレビュー＞＞内容* -->
({* #1935 *})</td>
({* #1935 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1935 *})</tr>
({* #1935 *})<tr>
({* #1935 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1935 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1935 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
({* #1935 *})</tr>
({* #1935 *})</table>
({* #1935 *})<!-- ******ここまで：メンバーのおすすめレビュー****** -->
({* }}} *})
({/if})

({* #1939 *})<div class="parts">
({* #1939 *})<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1" /><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]コミュニティトップへ</a>
({* #1939 *})</div>

</div><!-- Center -->
</div><!-- LayoutC -->
