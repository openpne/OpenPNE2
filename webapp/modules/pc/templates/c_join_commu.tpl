<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>この({$WORD_COMMUNITY})に参加</h3></div>

<div class="block">
<p>({$c_commu.name|default:""})に本当に参加しますか?</p>
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_inc_join_c_commu})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="参加する" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_c_home})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<input type="submit" class="input_submit" value="参加しない" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
