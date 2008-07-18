<div id="LayoutC">
<div id="Center">

({* {{{ yesNoButtonBox *})
<div class="dparts yesNoButtonBox"><div class="parts">
<div class="partsHeading"><h3>({$WORD_DIARY})公開範囲の一括設定します</h3></div>

<div class="block">
({t_form_block m=pc a=do_h_set_public_flag_all})
<input type="hidden" name="public_flag_diary_all" value="({$public_flag_diary_all})" />
<p>設定内容 ： ({if $public_flag_diary_all == 'private'})公開しない({elseif $public_flag_diary_all == 'friend'})({$WORD_MY_FRIEND})まで公開({else})全員に公開({/if})</p>
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" name="ok" value="一括設定" /></li>
<li><input type="submit" class="input_submit" value="キャンセル" /></li>
</ul>
({/t_form_block})
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
