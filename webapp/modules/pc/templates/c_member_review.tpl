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
<p>({$WORD_COMMUNITY})上にあなたが作成したおすすめレビューを掲載することができます。<br />
おすすめレビューの作成は<a href="({t_url m=pc a=page_h_review_add})">こちら</a></p>
</div>
</div></div>
({* }}} *})
({/if})

({if $c_member_review})
({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>メンバーのおすすめレビュー</h3></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_c_member_review})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$c_member_review item=review})
<dl>
<dt>
<a href="({$review.url})" target="_blank"><img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$review.url})" target="_blank">詳細を見る</a></span>
</dt>
<dd>
<table><tr class="title">
<th>タイトル</th>
<td>({$review.title})</td>
</tr><tr>
<th>説明</th>
<td>
({if $review.release_date})({$review.release_date})<br />({/if})
({if $review.manufacturer})({$review.manufacturer})<br />({/if})
({if $review.author})({$review.author})({/if})
</td>
</tr><tr>
<th>掲載日時</th>
<td>({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr><tr>
<th>カテゴリ</th>
<td>({$review.category_disp})</td>
</tr><tr>
<td colspan="2"><p class="operation">
({if $c_commu.c_member_id_admin == $u || $c_commu.c_member_id_sub_admin == $u || $review.c_member_id == $u})
<a href="({t_url m=pc a=page_c_member_review_delete_confirm})&amp;target_c_commu_review_id=({$review.c_commu_review_id})&amp;target_c_commu_id=({$c_commu.c_commu_id})">削除</a> |
({/if})
<a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$review.c_review_id})">他メンバーのレビューを見る</a>
</p></td>
</tr></table>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({/if})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]({$WORD_COMMUNITY})トップへ</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
