<div id="LayoutC">
<div id="Center">

({capture name="keyword_url"})({$keyword|escape:url|smarty:nodefaults})({/capture})

({* {{{ searchFormBox *})
({* #1932 *})<div class="dparts searchFormBox"><div class="parts">
({* #1932 *})<div class="partsHeading"><h3>コミュニティ検索・並び替え</h3></div>
({* #1932 *})<table>
({* #1932 *})<tr>
({* #1932 *})<td style="width:560px;padding:10px;" class="bg_02" align="left" valign="middle">
({* #1932 *})<div style="padding:4px 3px;">
({* #1932 *})
({* #1932 *})({t_form_block _method=get m=pc a=page_h_com_find_all})
({* #1932 *})並び替え<img src="({t_img_url_skin filename=icon_arrow_2})" alt="" />
({* #1932 *})<a href="({t_url m=pc a=page_h_com_find_all})&amp;val_order=count&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;category_id=({$search_val_list.category_id})">メンバー数順</a>
({* #1932 *})|
({* #1932 *})<a href="({t_url m=pc a=page_h_com_find_all})&amp;val_order=r_datetime&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;category_id=({$search_val_list.category_id})">作成日順</a>
({* #1932 *})<br />
({* #1932 *})キーワード<img src="({t_img_url_skin filename=icon_arrow_2})" alt="" />
({* #1932 *})<input type="text" class="input_text" name="keyword" value="({$keyword})" size="15" />
({* #1932 *})&nbsp;カテゴリ<img src="({t_img_url_skin filename=icon_arrow_2})" alt="" />
({* #1932 *})<select name="category_id">
({* #1932 *})<option value="0">指定なし</option>
({* #1932 *})({foreach from=$c_commu_category_list item=parent})
({* #1932 *})({foreach from=$parent item=item})
({* #1932 *})<option value="({$item.c_commu_category_id})"({if $item.c_commu_category_id == $search_val_list.category_id}) selected="selected"({/if})>({$item.name})</option>
({* #1932 *})({/foreach})
({* #1932 *})({/foreach})
({* #1932 *})</select>
({* #1932 *})<input type="submit" class="input_submit" value=" 検 索 " />
({* #1932 *})({/t_form_block})
({* #1932 *})
({* #1932 *})<div style="text-align:left;padding:3px;padding-left:160px;">
({* #1932 *})<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1" /><a href="({t_url m=pc a=page_h_com_add})">新規作成</a>&nbsp;(作成の前に、似たコミュニティがないかご確認ください)&nbsp;&nbsp;
({* #1932 *})</div>
({* #1932 *})<div style="text-align:left;padding:3px;padding-left:160px;">
({* #1932 *})<img src="./skin/dummy.gif" alt="dummy" class="icon arrow_1" /><a href="({t_url m=pc a=page_h_com_topic_find_all})">トピック検索</a>
({* #1932 *})</div>
({* #1932 *})
({* #1932 *})<hr />
({* #1932 *})
({* #1932 *})カテゴリ<img src="({t_img_url_skin filename=icon_arrow_2})" alt="" />
({* #1932 *})<table border="0" cellspacing="0" cellpadding="0" style="width:532px;">
({* #1932 *})({foreach from=$c_commu_category_parent_list item=item_parent})
({* #1932 *})<tr>
({* #1932 *})<td style="width:70px;border:none;" valign="top">
({* #1932 *})<div style="text-align:left;padding:3px;" class="b_b">
({* #1932 *})({$item_parent.name})
({* #1932 *})</div>
({* #1932 *})</td>
({* #1932 *})<td style="width:1em;border:none;" align="center" valign="top">
({* #1932 *})<div style="text-align:left;padding:3px;">：</div>
({* #1932 *})</td>
({* #1932 *})<td style="border:none;" valign="top">
({* #1932 *})<div style="text-align:left;padding:3px;">
({* #1932 *})({foreach name=cccl from=$c_commu_category_list[$item_parent.c_commu_category_parent_id] item=item_cat})
({* #1932 *})<a href="({t_url m=pc a=page_h_com_find_all})&amp;order=r_datetime&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;category_id=({$item_cat.c_commu_category_id})">({$item_cat.name})(({$item_cat.count_commu_category}))</a>
({* #1932 *})({if !$smarty.foreach.cccl.last}) - ({/if})
({* #1932 *})({/foreach})
({* #1932 *})</div>
({* #1932 *})</td>
({* #1932 *})</tr>
({* #1932 *})({/foreach})
({* #1932 *})</table>
({* #1932 *})
({* #1932 *})</div>
({* #1932 *})</td>
({* #1932 *})</tr>
({* #1932 *})</table>
({* #1932 *})</div></div>
({* }}} *})

({if $c_commu_search_list})
({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>コミュニティ一覧</h3><p>*** ({$total_num|default:'0'})件が該当しました。</p></div>

({if $start_num != $end_num})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_com_find_all})&amp;direc=-1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_com_find_all})&amp;direc=1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">次を表示</a></p>({/if})
</div>
({/if})

<div class="block">
({foreach from=$c_commu_search_list item=c_commu_search})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu_search.c_commu_id})"><img src="({t_img_url filename=$c_commu_search.image_filename w=76 h=76 noimg=no_logo_small})" alt="" /></a></td>
<th>コミュニティ名</th><td>({$c_commu_search.name})</td>
</tr><tr>
<th>メンバー数</th><td>({$c_commu_search.count_commu_member})人</td>
</tr><tr>
<th>説明文</th><td>({$c_commu_search.info|t_truncate:36:"":3})</td>
</tr><tr>
<th>カテゴリ</th><td class="operation"><span class="text">({$c_commu_search.c_commu_category_name})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu_search.c_commu_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({if $start_num != $end_num})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_com_find_all})&amp;direc=-1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_com_find_all})&amp;direc=1&amp;page=({$page})&amp;keyword=({$smarty.capture.keyword_url|smarty:nodefaults})&amp;val_order=({$search_val_list.val_order})&amp;category_id=({$search_val_list.category_id})">次を表示</a></p>({/if})
</div>
({/if})

</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
