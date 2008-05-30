<div id="LayoutC">
<div id="Center">

({* {{{ infoBox *})
<div class="dparts infoBox"><div class="parts">
<p>クリップ機能で自分のページに保存することができます。</p>
<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_review_clip_add})&amp;c_review_id=({$c_review.c_review_id})">クリップに追加する</a></li>
</ul>
</div></div>
({* }}} *})

({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>概要</h3></div>

<dl>
<dt>
<a href="({$c_review.url})" target="_blank"><img src="({if $c_review.image_medium})({$c_review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$c_review.url})" target="_blank">詳細を見る</a></span>
</dt>
<dd>
<table><tr class="title">
<th>タイトル</th>
<td>({$c_review.title})</td>
</tr><tr>
<th>説明</th>
<td>
({if $c_review.release_date})({$c_review.release_date})<br />({/if})
({if $c_review.manufacturer})({$c_review.manufacturer})<br />({/if})
({if $c_review.author})({$c_review.author})({/if})
<p class="operation"><a href="({t_url m=pc a=page_h_review_add_write})&amp;category_id=({$c_review.c_review_category_id})&amp;asin=({$c_review.asin})">レビューを書く</a></p>
</td>
</tr><tr>
<th>カテゴリ</th>
<td>({$c_review.category_disp})</td>
</tr></table>
</dd>
</dl>

</div></div>
({* }}} *})

({if $c_review_list})
({* {{{ searchResultList *})
<div class="dparts searchResultList"><div class="parts">
<div class="partsHeading"><h3>全レビュー</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$c_review.c_review_id})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$c_review.c_review_id})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

<div class="block">
({foreach from=$c_review_list item=review})
<div class="ditem"><div class="item"><table><tr>
<td class="photo" rowspan="4"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$review.c_member_id})"><img src="({t_img_url filename=$review.image_filename w=76 h=76 noimg=no_image})" alt="" /></a></td>
<th>({$WORD_NICKNAME})</th><td>({$review.nickname})</td>
</tr><tr>
<th>レビュー</th><td>({$review.body|nl2br})</td>
</tr><tr>
<th>満足度</th><td><img src="({t_img_url_skin filename=satisfaction_level_`$review.satisfaction_level`})" alt="" /></td>
</tr><tr class="operation">
<th>作成日時</th><td><span class="text">({$review.r_datetime|date_format:"%m月%d日 %H:%M"})</span> <span class="moreInfo"><a href="({t_url m=pc a=page_fh_review_list_member})&amp;target_c_member_id=({$review.c_member_id})">このメンバーのレビューを見る</a></span></td>
</tr></table></div></div>
({/foreach})
</div>

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_review_search})">全体のレビュー一覧を見る</a><br /></li>
<li><a href="({t_url m=pc a=page_fh_review_list_member})">自分のレビュー一覧を見る</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
