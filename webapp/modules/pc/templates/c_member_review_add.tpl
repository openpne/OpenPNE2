<div id="LayoutC">
<div id="Center">

({* {{{ descriptionBox *})
<div class="dparts descriptionBox"><div class="parts">
<p>掲載したいレビューにチェックを入れて「掲載」をクリックしてください。<br />
掲載したいレビューがない場合は  <a href="({t_url m=pc a=page_h_review_add})">こちら</a> より作成してください</p>
</div></div>
({* }}} *})

({if $c_review_list})
({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>あなたのレビュー一覧</h3></div>
({t_form_block m=pc a=page_c_member_review_add_confirm})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_c_member_review_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_c_member_review_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$c_review_list item=review})
<dl>
<dt>
<a href="({$review.url})" target="_blank"><img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$review.url})" target="_blank">詳細を見る</a></span>
<input type="checkbox" class="input_checkbox" name="c_review_id[]" id="c_review_id-({$review.c_review_id})" value="({$review.c_review_id})" />
<label for="c_review_id-({$review.c_review_id})">このレビューを掲載する</label>
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
({if $review.author})({$review.author})<br />({/if})
</td>
</tr><tr>
<th>レビュー本文</th>
<td>
({$review.body|nl2br})
<p class="operation"><a href="({t_url m=pc a=page_h_review_add_write})&amp;category_id=({$review.c_review_category_id})&amp;asin=({$review.asin})">編集</a></p>
</td>
</tr><tr>
<th>作成日時</th>
<td>({$review.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr><tr>
<th>満足度</th>
<td><img src="({t_img_url_skin filename=satisfaction_level_`$review.satisfaction_level`})" alt="" /></td>
</tr><tr>
<th>カテゴリ</th>
<td>({$review.category_disp})</td>
</tr>
</table>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　掲　載　" /></li>
</ul>
</div>
({/t_form_block})
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
