<div id="LayoutC">
<div id="Center">

({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>トピック検索</h3></div>
<div class="item">

({t_form_block _method=get m=pc a=page_h_com_topic_find_all})
<p class="form">
<label for="keyword">キーワード</label>
<input type="text" class="text" name="keyword" id="keyword" size="15" value="({$keyword})" />
<input type="submit" class="input_submit" value="　検　索　" />
</p>

<p class="form">
<span class="label">絞りこみ</span>
<a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=all&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">すべて</a>
|
<a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=topic&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">トピック</a>
|
<a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;type=event&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})">イベント</a>
</p>
({/t_form_block})

</div>
</div></div>
({* }}} *})

({if $total_num})
({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>トピック一覧</h3><p>*** ({$total_num|default:'0'})件が該当しました。</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;page=({$page-1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_com_topic_find_all})&amp;page=({$page+1})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;type=({$search_val_list.type})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$c_commu_topic_search_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})"><img src="({t_img_url filename=$item.commu_image w=76 h=76 noimg=no_logo_small})" alt="" /></a></td>
<th>トピック名</th><td>({$item.name}) (({$item.max_number}))({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3}) <img src="({t_img_url_skin filename=icon_camera})" alt="" />({/if})</td>
</tr><tr>
<th>({$WORD_COMMUNITY})名</th><td>({$item.commu_name})</td>
</tr><tr>
<th>本文</th><td>({$item.body|t_truncate:36:"":3})</td>
</tr><tr class="operation">
<th>投稿日</th><td><span class="text">({$item.max_datetime|date_format:"%m月%d日 %H:%M"})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_c_topic_detail})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>トピック一覧</h3></div>
<div class="block">
<p>該当するトピックはありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
