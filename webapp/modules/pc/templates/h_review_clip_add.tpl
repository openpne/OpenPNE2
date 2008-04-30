<div id="LayoutC">
<div id="Center">

({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>以下のアイテムをクリップしますか？</h3></div>

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
</td>
</tr><tr>
<th>カテゴリ</th>
<td>({$c_review.category_disp})</td>
</tr>
</table>
</dd>
</dl>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_review_clip_add_insert_c_review_clip})
<input type="hidden" name="c_review_id" value="({$c_review.c_review_id})" />
<input type="submit" class="input_submit" value="　は　い　" />
({/t_form_block})
</li>
<li>
({t_form_block _method=get m=pc a=page_h_review_list_product})
<input type="hidden" name="c_review_id" value="({$c_review.c_review_id})" />
<input type="submit" class="input_submit" value="  いいえ　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
