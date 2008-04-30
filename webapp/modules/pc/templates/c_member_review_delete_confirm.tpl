<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>削除してよろしいですか？</h3></div>

<div class="block">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_c_member_review_delete})
<input type="hidden" name="target_c_commu_id" value="({$c_commu_id})" />
<input type="hidden" name="target_c_commu_review_id" value="({$c_commu_review_id})" />
<input type="submit" class="input_submit" value="　削　除　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_c_member_review})
<input type="hidden" name="target_c_commu_id" value="({$c_commu_id})" />
<input type="submit" class="input_submit" value="キャンセル" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
