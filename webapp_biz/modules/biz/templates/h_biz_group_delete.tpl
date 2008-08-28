<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>グループ削除</h3></div>
<div class="block">
<p>本当に削除しますか？</p>
<ul class="moreInfo button">
<li>
({t_form_block m=biz a=do_h_biz_group_delete})
<input type="hidden" name="target_id" value="({$target_id})" />
<input type="submit" class="input_submit" value="　は　い　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=biz a=page_g_home})
<input type="hidden" name="target_c_commu_id" value="({$target_id})" />
<input type="submit" class="input_submit" value="　いいえ　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
