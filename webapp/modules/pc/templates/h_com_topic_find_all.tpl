<div id="LayoutC">
<div id="Center">

({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

({* {{{ searchFormBox *})
({* #1932 *})<table border="0" cellspacing="0" cellpadding="0" style="width:650px;margin:0px auto;" class="border_07">
({* #1932 *})<tr>
({* #1932 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1932 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1932 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1932 *})</tr>
({* #1932 *})<tr>
({* #1932 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1932 *})<td class="bg_01" align="center">
({* #1932 *})<!-- *ここから：トピック検索＞内容* -->
({* #1932 *})({*ここから：header*})
({* #1932 *})<!-- ここから：小タイトル -->
({* #1932 *})<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
({* #1932 *})<tr>
({* #1932 *})<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy" /></td>
({* #1932 *})<td style="width:600px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">トピック検索</span></td>
({* #1932 *})</tr>
({* #1932 *})</table>
({* #1932 *})<!-- ここまで：小タイトル -->
({* #1932 *})({*ここまで：header*})
({* #1932 *})({*ここから：body*})
({* #1932 *})<!-- ここから：主内容 -->
({* #1932 *})<div class="border_01 bg_05" align="center">
({* #1932 *})
({* #1932 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1932 *})
({* #1932 *})<table border="0" cellspacing="0" cellpadding="0" style="width:562px;margin:0px auto;">
({* #1932 *})({*********})
({* #1932 *})<tr>
({* #1932 *})<td style="width:562px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1932 *})</tr>
({* #1932 *})({*********})
({* #1932 *})<tr>
({* #1932 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1932 *})<td style="width:560px;" class="bg_02" align="left" valign="middle">
({* #1932 *})<div style="padding:4px 3px;">
({* #1932 *})
({* #1932 *})<!-- ここから：主内容＞＞検索 -->
({* #1932 *})
({* #1932 *})({t_form_block _method=get m=pc a=page_h_com_topic_find_all})
({* #1932 *})
({* #1932 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1932 *})
({* #1932 *})キーワード<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon" />
({* #1932 *})
({* #1932 *})<input type="text" class="text" name="keyword" size="15" value="({$keyword})">
({* #1932 *})<input type="submit" class="input_submit" value=" 検 索 ">
({* #1932 *})<br />
({* #1932 *})
({* #1932 *})絞りこみ<img src="({t_img_url_skin filename=icon_arrow_2})" class="icon" />
({* #1932 *})
({* #1932 *})<a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=all&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">すべて</a>
({* #1932 *})|
({* #1932 *})<a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=topic&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">トピック</a>
({* #1932 *})|
({* #1932 *})<a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=event&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">イベント</a>
({* #1932 *})
({* #1932 *})({/t_form_block})
({* #1932 *})
({* #1932 *})<!-- ここまで：主内容＞＞検索 -->
({* #1932 *})
({* #1932 *})</div>
({* #1932 *})</td>
({* #1932 *})<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1932 *})</tr>
({* #1932 *})({*********})
({* #1932 *})<tr>
({* #1932 *})<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot" /></td>
({* #1932 *})</tr>
({* #1932 *})({*********})
({* #1932 *})</table>
({* #1932 *})
({* #1932 *})<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l" />
({* #1932 *})
({* #1932 *})</div>
({* #1932 *})<!-- ここまで：主内容 -->
({* #1932 *})({*ここまで：body*})
({* #1932 *})({*ここから：footer*})
({* #1932 *})<!-- 無し -->
({* #1932 *})({*ここまで：footer*})
({* #1932 *})<!-- *ここまで：トピック検索＞＞内容* -->
({* #1932 *})</td>
({* #1932 *})<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1932 *})</tr>
({* #1932 *})<tr>
({* #1932 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1932 *})<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1932 *})<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square" /></td>
({* #1932 *})</tr>
({* #1932 *})</table>
({* }}} *})

({if $c_commu_topic_search_list})
({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>トピック一覧</h3><p>*** ({$total_num|default:'0'})件が該当しました。</p></div>

({if $total_num})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;direc=-1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;direc=1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">次を表示</a></p>({/if})
</div>
({/if})

<div class="block">
({foreach from=$c_commu_topic_search_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})"><img src="({t_img_url filename=$item.commu_image w=76 h=76 noimg=no_logo_small})" alt="" /></a></td>
<th>トピック名</th><td>({$item.name}) (({$item.max_number}))</td>
</tr><tr>
<th>コミュニティ名</th><td>({$item.commu_name})</td>
</tr><tr>
<th>本文</th><td>({$item.body|t_truncate:36:"":3})</td>
</tr><tr>
<th>投稿日</th><td class="operation"><span class="text">({$item.max_datetime|date_format:"%m月%d日 %H:%M"})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({if $total_num})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;direc=-1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;direc=1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">次を表示</a></p>({/if})
</div>
({/if})

</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
