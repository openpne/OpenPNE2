<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>本当に削除しますか？</h3></div>
<div class="block">
<ul class="moreInfo button">
<li>
({t_form_block m=biz a=do_s_delete_shisetsu})
<input type="hidden" name="target_id" value="({$target_id})" />
<input type="submit" class="input_submit" value="　は　い　" />
({/t_form_block})
</li><li>
({t_form_block m=biz a=page_s_list})
<input type="submit" class="input_submit" value="　いいえ　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
