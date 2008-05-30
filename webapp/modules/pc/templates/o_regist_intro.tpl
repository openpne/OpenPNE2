<div id="LayoutC">
<div id="Center">

({* {{{ descriptionBox *})
<div class="dparts descriptionBox"><div class="parts">
<div class="partsHeading"><h3>会員登録</h3></div>
<div class="block">
<p>サービスを利用するには、以下の規約を遵守してください。<br />利用者ご本人により会員規約に同意のうえ、登録手続きを進めてください。</p>
</div>
</div></div>
({* }}} *})

({* {{{ descriptionBox *})
<div class="dparts descriptionBox"><div class="parts">
<div class="partsHeading"><h3>利用規約</h3></div>
<div class="block">
<p>
({if $c_siteadmin != ""})
({$c_siteadmin|t_url2a|nl2br})
({else})
利用規約は、ただいま準備中です。
({/if})
</p>
</div>
</div></div>
({* }}} *})

({* {{{ buttonLine *})
<div class="parts buttonLine">
({t_form_block m=pc a=page_o_regist_prof})
<input type="hidden" name="mode" value="input" />
<input type="hidden" name="sid" value="({$sid})" />
<input type="submit" class="input_submit" value="同意して登録手続きへ" />
({/t_form_block})
</div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
