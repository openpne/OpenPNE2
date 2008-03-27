<div id="LayoutC">
<div id="Center">

({* #1953 *})<!-- ******ここから：レビュー検索・並び替え****** -->
({* #1953 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({* #1953 *})<tr>
({* #1953 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1953 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1953 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1953 *})</tr>
({* #1953 *})<tr>
({* #1953 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1953 *})<td class="bg_05" align="center">
({* #1953 *})({*ここから：header*})
({* #1953 *})<!-- ここから：小タイトル -->
({* #1953 *})<table border="0" cellspacing="0" cellpadding="0" style="width:634px;" class="border_01">
({* #1953 *})<tr>
({* #1953 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1953 *})<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({* #1953 *})レビュー検索・並び替え
({* #1953 *})</span></td>
({* #1953 *})</tr>
({* #1953 *})</table>
({* #1953 *})<!-- ここまで：小タイトル -->
({* #1953 *})({*ここまで：header*})
({* #1953 *})({*ここから：body*})
({* #1953 *})<!-- ここから：主内容 -->
({* #1953 *})<div class="border_01 bg_05">
({* #1953 *})
({* #1953 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1953 *})
({* #1953 *})<table border="0" cellspacing="0" cellpadding="0" style="width:550px;margin:0px auto;" class="border_01">
({* #1953 *})({*********})
({* #1953 *})<tr>
({* #1953 *})<td style="width:548px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1953 *})</tr>
({* #1953 *})({*********})
({* #1953 *})<tr>
({* #1953 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1953 *})<td class="bg_02" valign="middle">
({* #1953 *})
({* #1953 *})({t_form_block m=pc a=page_h_review_search})
({* #1953 *})<table border="0" cellspacing="0" cellpadding="3" style="width:546px;">
({* #1953 *})<!-- ここから：主内容＞再検索フォーム -->
({* #1953 *})<tr>
({* #1953 *})<td style="width:100px;" align="right">
({* #1953 *})
({* #1953 *})<div class="padding_s">
({* #1953 *})
({* #1953 *})並び替え&nbsp;<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon" />
({* #1953 *})
({* #1953 *})</div>
({* #1953 *})
({* #1953 *})</td>
({* #1953 *})<td style="width:440px;">
({* #1953 *})
({* #1953 *})<div class="padding_s">
({* #1953 *})
({* #1953 *})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;category=({$category})&amp;orderby=r_num">登録数順</a>
({* #1953 *})|
({* #1953 *})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;category=({$category})&amp;orderby=r_datetime">作成日順</a>
({* #1953 *})
({* #1953 *})</div>
({* #1953 *})
({* #1953 *})</td>
({* #1953 *})</tr>
({* #1953 *})({*********})
({* #1953 *})<tr>
({* #1953 *})<td valign="top" align="right">
({* #1953 *})
({* #1953 *})<div class="padding_s">
({* #1953 *})
({* #1953 *})キーワード&nbsp;<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon" />
({* #1953 *})
({* #1953 *})</div>
({* #1953 *})
({* #1953 *})</td>
({* #1953 *})<td valign="top">
({* #1953 *})
({* #1953 *})<div class="padding_s">
({* #1953 *})
({* #1953 *})<input type="text" class="text" name="keyword" value="({$keyword})" size="15" />&nbsp;
({* #1953 *})&nbsp;カテゴリ&nbsp;<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon" />
({* #1953 *})<select name="category">
({* #1953 *})<option value="">指定なし</option>
({* #1953 *})({html_options options=$category_disp selected=$category})
({* #1953 *})</select>
({* #1953 *})<input type="submit" class="input_submit" value="　検 索　" />
({* #1953 *})
({* #1953 *})</div>
({* #1953 *})
({* #1953 *})</td>
({* #1953 *})</tr>
({* #1953 *})<!-- ここまで：主内容＞再検索フォーム -->
({* #1953 *})({*********})
({* #1953 *})<!-- ここから：主内容＞レビューを作成するリンク -->
({* #1953 *})<tr>
({* #1953 *})<td align="center" valign="middle" colspan="2">
({* #1953 *})
({* #1953 *})<div class="padding_s">
({* #1953 *})
({* #1953 *})<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1" />
({* #1953 *})<a href="({t_url m=pc a=page_h_review_add})")>レビューを作成する</a>
({* #1953 *})
({* #1953 *})</div>
({* #1953 *})
({* #1953 *})</td>
({* #1953 *})</tr>
({* #1953 *})<!-- ここまで：主内容＞レビューを作成するリンク -->
({* #1953 *})({*********})
({* #1953 *})<tr>
({* #1953 *})<td align="center" valign="middle" colspan="2">
({* #1953 *})
({* #1953 *})<hr>
({* #1953 *})
({* #1953 *})</td>
({* #1953 *})</tr>
({* #1953 *})({********})
({* #1953 *})<!-- ここから：主内容＞カテゴリリンク -->
({* #1953 *})<tr>
({* #1953 *})<td valign="top" align="right">
({* #1953 *})
({* #1953 *})<div class="padding_s">
({* #1953 *})
({* #1953 *})カテゴリ&nbsp;<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon" />
({* #1953 *})
({* #1953 *})</div>
({* #1953 *})
({* #1953 *})</td>
({* #1953 *})<td valign="top">
({* #1953 *})
({* #1953 *})<div class="padding_s">
({* #1953 *})
({* #1953 *})({foreach from=$category_disp key=key item=item})
({* #1953 *})({if $key!=1}) - ({/if})
({* #1953 *})<a href="({t_url m=pc a=page_h_review_search})&amp;category=({$key})">({$item})</a>
({* #1953 *})({/foreach})
({* #1953 *})
({* #1953 *})</div>
({* #1953 *})
({* #1953 *})</td>
({* #1953 *})</tr>
({* #1953 *})<!-- ここまで：主内容＞カテゴリリンク -->
({* #1953 *})({********})
({* #1953 *})</table>
({* #1953 *})({/t_form_block})
({* #1953 *})
({* #1953 *})</td>
({* #1953 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1953 *})</tr>
({* #1953 *})({*********})
({* #1953 *})<tr>
({* #1953 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1953 *})</tr>
({* #1953 *})({*********})
({* #1953 *})</table>
({* #1953 *})
({* #1953 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1953 *})
({* #1953 *})</div>
({* #1953 *})<!-- ここまで：主内容 -->
({* #1953 *})({*ここまで：body*})
({* #1953 *})({*ここから：footer*})
({* #1953 *})<!-- 無し -->
({* #1953 *})({*ここまで：footer*})
({* #1953 *})</td>
({* #1953 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1953 *})</tr>
({* #1953 *})<tr>
({* #1953 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1953 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1953 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1953 *})</tr>
({* #1953 *})</table>
({* #1953 *})<!-- ******ここまで：レビュー検索・並び替え****** -->
({* unknown *})({* if $result *})
({* #1949 *})<!-- ******ここから：検索結果****** -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({* #1949 *})<tr>
({* #1949 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})</tr>
({* #1949 *})<tr>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td align="center">
({* #1949 *})<!-- *ここから：主内容* -->
({* #1949 *})({*ここから：header*})
({* #1949 *})<!-- ここから：小タイトル -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1949 *})<tr>
({* #1949 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1949 *})<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="c_00"><span class="b_b">レビュー一覧</span>&nbsp;&nbsp;***&nbsp;<span class="b_b">
({* #1949 *})({if $total_num})
({* #1949 *})    ({$total_num})
({* #1949 *})({else})
({* #1949 *})    0
({* #1949 *})({/if})
({* #1949 *})件</span>&nbsp;が該当しました。</span></td>
({* #1949 *})</tr>
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：小タイトル -->
({* #1949 *})<!-- ここから：レビュー一覧件数表示タブ -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:634px;" class="bg_02" align="right">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({if $is_prev})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;direc=-1&amp;page=({$page})">前を表示</a> ({/if})
({* #1949 *})({if $total_num})
({* #1949 *})({$start_num})件～({$end_num})件を表示
({* #1949 *})({/if})
({* #1949 *})({if $is_next})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;direc=1&amp;page=({$page})">次を表示</a>({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：レビュー一覧件数表示タブ -->
({* #1949 *})({*ここまで：header*})
({* #1949 *})({*ここから：body*})
({* #1949 *})<!-- *ここから：主内容* -->
({* #1949 *})<!-- *ここから：検索結果内容＞＞商品情報* -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})({foreach from=$result item=item})
({* #1949 *})<!--▼レビュー1つ分ここから-->
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:180px;" class="bg_02" rowspan="7" align="center">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:180px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})<a href="({$item.url})" target="_blank"><img src="({if $item.image_medium})({$item.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" /><br />詳細を見る</a>
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:180px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:70px;" class="bg_03" align="center">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:70px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})タイトル
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:70px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:382px;" class="bg_02">
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:382px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})<span class="b_b">({$item.title})</span>
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})<img src="./skin/dummy.gif" alt="dummy" style="width:382px;height:1px;" class="dummy" />
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:455px;" class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_03" align="center">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})最新レビュー
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$item.body|nl2br})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_03" align="center">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})作成日時
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="left">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({$item.r_datetime2|date_format:"%Y年%m月%d日 %H:%M"})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;height:1px;" class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01" colspan="5"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td class="bg_02" align="right" colspan="3">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">全てのレビューを見る (({$item.write_num|default:0}))</a>
({* #1949 *})({*<a href="({t_url m=pc a=page_h_review_add_write})&amp;category_id=({$item.c_review_category_id})&amp;asin=({$item.asin})">レビューを書く</a>*})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td class="bg_01"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="height:1px;" class="bg_01" colspan="7"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<!--▲レビュー1つ分ここまで-->
({* #1949 *})({/foreach})
({* #1949 *})</table>
({* #1949 *})<!-- *ここまで：検索結果内容＞＞商品情報* -->
({* #1949 *})<!-- *ここまで：主内容* -->
({* #1949 *})({*ここまで：body*})
({* #1949 *})({*ここから：footer*})
({* #1949 *})<!-- ここから：レビュー一覧件数表示タブ -->
({* #1949 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:636px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})<td style="width:634px;" class="bg_02" align="right">
({* #1949 *})
({* #1949 *})<div class="padding_s">
({* #1949 *})
({* #1949 *})({if $is_prev})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;direc=-1&amp;page=({$page})">前を表示</a> ({/if})
({* #1949 *})({if $total_num})
({* #1949 *})({$start_num})件～({$end_num})件を表示
({* #1949 *})({/if})
({* #1949 *})({if $is_next})<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;direc=1&amp;page=({$page})">次を表示</a>({/if})
({* #1949 *})
({* #1949 *})</div>
({* #1949 *})
({* #1949 *})</td>
({* #1949 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})<tr>
({* #1949 *})<td class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1949 *})</tr>
({* #1949 *})({*********})
({* #1949 *})</table>
({* #1949 *})<!-- ここまで：レビュー一覧件数表示タブ -->
({* #1949 *})({*ここから：footer*})
({* #1949 *})</td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})</tr>
({* #1949 *})<tr>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1949 *})</tr>
({* #1949 *})</table>
({* #1949 *})<!-- ******ここまで：検索結果****** -->
({* unknown *})({* /if *})

</div><!-- Center -->
</div><!-- LayoutC -->
