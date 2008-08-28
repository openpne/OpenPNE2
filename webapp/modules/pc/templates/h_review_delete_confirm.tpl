<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>本当に削除しますか？</h3></div>

<div class="block">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_review_edit_delete_c_review_comment})
<input type="hidden" name="c_review_comment_id" value="({$c_review_comment_id})" />
<input type="submit" class="input_submit" value="　は　い　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_h_review_edit})
<input type="hidden" name="c_review_comment_id" value="({$c_review_comment_id})" />
<input type="hidden" name="asin" value="({$asin})" />
<input type="submit" class="input_submit" value="　いいえ　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
