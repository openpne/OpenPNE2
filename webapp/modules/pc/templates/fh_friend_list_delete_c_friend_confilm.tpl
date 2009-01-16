<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>本当に({$WORD_MY_FRIEND})から外しますか？</h3></div>

<div class="block">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_fh_friend_list_delete_c_friend})
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})" />
<input type="submit" class="input_submit" value="　外　す　" />
({/t_form_block})
</li><li>
({t_form_block _method=get m=pc a=page_h_manage_friend})
<input type="submit" class="input_submit" value="キャンセル" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
