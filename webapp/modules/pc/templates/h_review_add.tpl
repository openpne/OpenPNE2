<div id="LayoutC">
<div id="Center">

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>レビューを書く</h3></div>
<div class="item">

<p class="desc">レビューを書きたい商品を検索します。<br />
キーワードを入力し、該当するカテゴリを選択してください。</p>

({t_form_block m=pc a=page_h_review_add})
<input type="hidden" name="search_flag" value="1" />
<p class="form">
<label for="keyword">キーワード</label> <input type="text" class="text" name="keyword" id="keyword" value="({$keyword})" size="15" />
<label for="category_id">カテゴリ</label> <select name="category_id" id="category_id">
<option value="" selected="selected">選択</option>
({html_options options=$category_disp selected=$category_id})
</select>
<input type="submit" class="input_submit" name="button" value="　検　索　" />
</p>
({/t_form_block})

</div>
</div></div>
({* }}} *})

({if $search_result})
({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>({$keyword})の検索結果</h3><p>*** ({$total_num})件が該当しました。</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_review_add})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;search_flag=1&amp;category_id=({$category_id})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_review_add})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;search_flag=1&amp;category_id=({$category_id})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$search_result item=product key=key})
<dl>
<dt>
<a href="({$product.DetailPageURL})" target="_blank"><img src="({if $product.MediumImage})({$product.MediumImage.URL})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$product.DetailPageURL})" target="_blank">詳細を見る</a></span>
</dt>
<dd>
<table><tr class="title">
<th>タイトル</th>
<td>({$product.ItemAttributes.Title})</td>
</tr><tr>
<th>説明</th>
<td>
({if $product.ItemAttributes.PublicationDate})({$product.ItemAttributes.PublicationDate})<br />({/if})
({if $product.ItemAttributes.Manufacturer})({$product.ItemAttributes.Manufacturer})<br />({/if})
({$product.artist})({$product.author})
<p class="operation"><a href="({t_url m=pc a=page_h_review_add_write})&amp;category_id=({$category_id})&amp;asin=({$product.ASIN})">レビューを書く</a></p>
</td>
</tr>
</table>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})

({elseif $keyword == ""})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>検索結果</h3></div>
<div class="block">
</div>
</div></div>
({* }}} *})

({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>({$keyword})の検索結果</h3></div>
<div class="block">
<p>該当する商品はありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
