<div id="LayoutC">
<div id="Center">

({if $pager.total_num})

({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>検索結果一覧</h3><p>*** ({$pager.total_num})名が該当しました。</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $pager.page_prev})<p class="prev"><a href="({t_url m=pc a=page_h_search_result})&amp;page=({$pager.page_prev})&amp;({$search_condition})">前を表示</a></p>({/if})
<p class="number">({$pager.disp_start})件～({$pager.disp_end})件を表示</p>
({if $pager.page_next})<p class="next"><a href="({t_url m=pc a=page_h_search_result})&amp;page=({$pager.page_next})&amp;({$search_condition})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$target_friend_list item=item})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="3"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td>({$item.nickname})</td>
</tr><tr>
<th>自己紹介</th><td>({$item.profile.self_intro.value|t_truncate:36:"":3})</td>
</tr><tr class="operation">
<th>最終ログイン</th><td><span class="text">({$item.last_login})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id})"><img src="({t_img_url_skin filename=button_shosai})" alt="詳細を見る" /></a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({else})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>メンバー検索</h3></div>
<div class="block">
<p>該当するメンバーはいませんでした。</p>
</div>
</div></div>
({* }}} *})

({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
