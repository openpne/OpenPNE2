<div id="LayoutC">
<div id="Center">

({* {{{ reviewList *})
<div class="dparts reviewList"><div class="parts">
<div class="partsHeading"><h3>レビュー</h3></div>
({t_form_block m=pc a=do_h_review_edit_update_c_review_comment})
<input type="hidden" name="c_review_comment_id" value="({$c_review_comment.c_review_comment_id})" />

<dl>
<dt>
<a href="({$c_review_comment.url})" target="_blank"><img src="({if $c_review_comment.image_medium})({$c_review_comment.image_medium})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="" /></a>
<span><a href="({$c_review_comment.url})" target="_blank">詳細を見る</a></span>
</dt>
<dd>
<table><tr class="title">
<th>タイトル</th>
<td>({$c_review_comment.title})</td>
</tr><tr>
<th>説明</th>
<td>
({if $c_review_comment.release_date})({$c_review_comment.release_date})<br />({/if})
({if $c_review_comment.manufacturer})({$c_review_comment.manufacturer})<br />({/if})
({if $c_review_comment.author})({$c_review_comment.author})({/if})
</td>
</tr><tr>
<th>レビュー</th>
<td><textarea name="body" rows="8" cols="40">({$c_review_comment.body})</textarea></td>
</tr><tr>
<th>満足度</th>
<td>
<select name="satisfaction_level">
({html_options options=$satisfaction selected=$c_review_comment.satisfaction_level})
</select>
</td>
</tr></table>
</dd>
</dl>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　登　録　" /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})

({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>このレビューを削除する</h3></div>
<div class="block">
({t_form_block m=pc a=page_h_review_delete_confirm})
<input type="hidden" name="c_review_comment_id" value="({$c_review_comment.c_review_comment_id})" />
<input type="hidden" name="asin" value="({$c_review_comment.asin})" />
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
