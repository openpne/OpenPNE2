<div id="LayoutC">
<div id="Center">

({* {{{ searchFormBox *})
<div class="dparts searchFormBox"><div class="parts">
<div class="partsHeading"><h3>レビュー検索・並び替え</h3></div>
<div class="item">

({t_form_block m=pc a=page_h_review_search})
<p class="form">
<span class="label">並び替え</span>
<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;category=({$category})&amp;orderby=r_num">登録数順</a>
|
<a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})&amp;category=({$category})&amp;orderby=r_datetime">作成日順</a>
</p>

<p class="form">
<label for="keyword">キーワード</label>
<input type="text" class="text" name="keyword" id="keyword" value="({$keyword})" size="15" />
<label for="category">カテゴリ</label>
<select name="category" id="category">
<option value="">指定なし</option>
({html_options options=$category_disp selected=$category})
</select>
<input type="submit" class="input_submit" value="　検　索　" />
</p>
({/t_form_block})

<ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_review_add})">レビューを作成する</a></li>
</ul>

<div class="block">
<dl class="category">
<dt><span class="label">カテゴリ</span></dt>
<dd><p>
({foreach from=$category_disp key=key item=item})
({if $key!=1}) - ({/if})
<a href="({t_url m=pc a=page_h_review_search})&amp;category=({$key})">({$item})</a>
({/foreach})
</p></dd>
</dl>
</div>

</div>
</div></div>
({* }}} *})

({if $total_num})
({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>レビュー一覧</h3><p>*** ({$total_num})件が該当しました。</p></div>

({capture name=pager})({strip})
<div class="pagerRelative">
({if $is_prev})<p class="prev"><a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;page=({$page-1})">前を表示</a></p>({/if})
<p class="number">({$start_num})件～({$end_num})件を表示</p>
({if $is_next})<p class="next"><a href="({t_url m=pc a=page_h_review_search})&amp;keyword=({$keyword})&amp;category=({$category})&amp;orderby=({$orderby})&amp;page=({$page+1})">次を表示</a></p>({/if})
</div>
({/strip})({/capture})
({$smarty.capture.pager|smarty:nodefaults})

({foreach from=$result item=item})
<dl>
<dt>
<a href="({$item.url})" target="_blank"><img src="({if $item.image_medium})({$item.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$item.url})" target="_blank">詳細を見る</a></span>
</dt>
<dd>
<table><tr class="title">
<th>タイトル</th>
<td>({$item.title})</td>
</tr><tr>
<th>最新レビュー</th>
<td>
({$item.body|nl2br})
<p class="operation"><a href="({t_url m=pc a=page_h_review_list_product})&amp;c_review_id=({$item.c_review_id})">全てのレビューを見る (({$item.write_num|default:0}))</a></p>
</td>
</tr><tr>
<th>作成日時</th>
<td>({$item.r_datetime2|date_format:"%Y年%m月%d日 %H:%M"})</td>
</tr></table>
</dd>
</dl>
({/foreach})

({$smarty.capture.pager|smarty:nodefaults})

</div></div>
({* }}} *})
({else})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>レビュー一覧</h3></div>
<div class="block">
<p>該当するレビューはありません。</p>
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
