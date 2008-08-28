<div id="LayoutC">
<div id="Center">

({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>グループ検索</h3></div>
<div class="item">

({t_form_block _method=get m=biz a=page_h_biz_group_find_all})
<p class="form">
<label for="keyword">キーワード</label><input type="text" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" />
<input type="submit" class="input_submit" value="　検　索　" />
<a href="({t_url m=pc a=page_h_diary_list_all})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">({$WORD_DIARY})検索</a>
 | <a href="({t_url m=pc a=page_h_com_find_all})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">({$WORD_COMMUNITY})検索</a>
({if $smarty.const.USE_EXTRA_SERVICE})
 | <a href="http://www.google.com/search?hl=ja&amp;lr=lang_ja&amp;q=({$smarty.capture.keyword_url|smarty:nodefaults})" target="_blank">ウェブ検索</a>
({/if})
</p>
({/t_form_block})

<ul class="moreInfo">
<li><a href="({t_url m=biz a=page_h_biz_group_add})">新規作成</a> (作成の前に、似たグループがないかご確認ください)</li>
</ul>

</div>
</div></div>
({* }}} *})

({if $total_num})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>グループ一覧</h3><p>*** ({$total_num})件が該当しました。</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=biz a=page_h_biz_group_find_all})&amp;page=({$page-1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=biz a=page_h_biz_group_find_all})&amp;page=({$page+1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$c_commu_search_list item=c_commu_search})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$c_commu_search.biz_group_id})"><img src="({t_img_url filename=$c_commu_search.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>グループ名</th><td>({$c_commu_search.name})</td>
</tr><tr>
<th>メンバー数</th><td>({$c_commu_search.count})人</td>
</tr><tr>
<th>説明文</th><td>({$c_commu_search.info})</td>
</tr><tr class="operation">
<th></th><td><span class="moreInfo"><a href="({t_url m=biz a=page_g_home})&amp;target_c_commu_id=({$c_commu_search.biz_group_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})
</div></div>
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>グループ一覧</h3></div>
<div class="block">
<p>該当するグループがありません。</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
