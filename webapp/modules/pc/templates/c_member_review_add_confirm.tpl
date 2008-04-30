<div id="LayoutC">
<div id="Center">

({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>以下のレビューを掲載しますか？</h3></div>

({foreach from=$c_member_review item=review})
<dl>
<dt><a href="({$review.url})" target="_blank"><img src="({if $review.image_medium})({$review.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a></dt>
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
<td>({$review.body|nl2br})</td>
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

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_member_review_insert_c_commu_review})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
({foreach from=$c_review_id item=item})
<input type="hidden" name="c_review_id[]" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="　は　い　" />
({/t_form_block})
</li>
<li>
({t_form_block _method=get m=pc a=page_c_member_review_add})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="　いいえ　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})">[({$c_commu.name})]({$WORD_COMMUNITY})トップへ</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
