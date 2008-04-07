({* unknown *})<div id="LayoutC">
({* unknown *})<div id="Center">
({* unknown *})
({* unknown *})({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})
({* unknown *})
({* unknown *})({* {{{ searchFormBox *})
({* unknown *})<div class="dparts searchFormBox"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>グループ検索</h3></div>
({* unknown *})<div class="item">
({* unknown *})
({* unknown *})({t_form_block _method=get m=biz a=page_h_biz_group_find_all})
({* unknown *})<p class="form">
({* unknown *})<label for="keyword">キーワード</label><input type="text" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" />
({* unknown *})<input type="submit" class="input_submit" value=" 検 索 " />
({* unknown *})<a href="({t_url m=pc a=page_h_diary_list_all})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">日記検索</a>
({* unknown *}) | <a href="({t_url m=pc a=page_h_com_find_all})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">コミュニティ検索</a>
({* unknown *})({if $smarty.const.USE_EXTRA_SERVICE})
({* unknown *}) | <a href="http://www.google.com/search?hl=ja&amp;lr=lang_ja&amp;q=({$smarty.capture.keyword_url|smarty:nodefaults})" target="_blank">ウェブ検索</a>
({* unknown *})({/if})
({* unknown *})</p>
({* unknown *})({/t_form_block})
({* unknown *})
({* unknown *})<ul class="moreInfo">
({* unknown *})<li><a href="({t_url m=biz a=page_h_biz_group_add})">新規作成</a> (作成の前に、似たグループがないかご確認ください)</li>
({* unknown *})</ul>
({* unknown *})
({* unknown *})</div>
({* unknown *})</div></div>
({* unknown *})({* }}} *})
({* unknown *})
({* unknown *})({if $total_num})
({* unknown *})
({* unknown *})({* {{{ searchResultList *})
({* unknown *})<div class="dparts searchResultList"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>グループ一覧</h3><p>*** ({$total_num})件が該当しました。</p></div>
({* unknown *})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})<p class="prev"><a href="({t_url m=biz a=page_h_biz_group_find_all})&amp;direc=-1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">前を表示</a></p>({/if})
({* unknown *})<p class="number">({$start_num})件～({$end_num})件を表示</p>
({* unknown *})({if $is_next})<p class="next"><a href="({t_url m=biz a=page_h_biz_group_find_all})&amp;direc=1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">次を表示</a></p>({/if})
({* unknown *})</div>
({* unknown *})
({* unknown *})<div class="block">
({* unknown *})({foreach from=$c_commu_search_list item=c_commu_search})
({* unknown *})<div class="ditem"><div class="item"><table><tr>
({* unknown *})<td class="photo" rowspan="4"><a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$c_commu_search.biz_group_id})"><img src="({t_img_url filename=$c_commu_search.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
({* unknown *})<th>グループ名</th><td>({$c_commu_search.name})</td>
({* unknown *})</tr><tr>
({* unknown *})<th>メンバー数</th><td>({$c_commu_search.count})人</td>
({* unknown *})</tr><tr>
({* unknown *})<th>説明文</th><td>({$c_commu_search.info})</td>
({* unknown *})</tr><tr class="operation">
({* unknown *})<th></th><td><span class="moreInfo"><a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$c_commu_search.biz_group_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="" /></a></span></td>
({* unknown *})</tr></table></div></div>
({* unknown *})({/foreach})
({* unknown *})</div>
({* unknown *})
({* unknown *})<div class="pagerRelative">
({* unknown *})({if $is_prev})<p class="prev"><a href="({t_url m=biz a=page_h_biz_group_find_all})&amp;direc=-1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">前を表示</a></p>({/if})
({* unknown *})<p class="number">({$start_num})件～({$end_num})件を表示</p>
({* unknown *})({if $is_next})<p class="next"><a href="({t_url m=biz a=page_h_biz_group_find_all})&amp;direc=1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">次を表示</a></p>({/if})
({* unknown *})</div>
({* unknown *})
({* unknown *})</div></div>
({* unknown *})({* }}} *})
({* unknown *})
({* unknown *})({else})
({* unknown *})
({* unknown *})({* {{{ simpleBox *})
({* unknown *})<div class="dparts simpleBox"><div class="parts">
({* unknown *})<div class="partsHeading"><h3>グループ一覧</h3></div>
({* unknown *})<div class="block">
({* unknown *})<p>該当するグループがありません。</p>
({* unknown *})</div>
({* unknown *})</div></div>
({* unknown *})({* }}} *})
({* unknown *})
({* unknown *})({/if})
({* unknown *})
({* unknown *})</div><!-- Center -->
({* unknown *})</div><!-- LayoutC -->
