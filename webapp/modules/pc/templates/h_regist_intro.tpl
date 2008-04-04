<div id="LayoutC">
<div id="Center">

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>会員登録</h3></div>
<div class="block">
<p>サービスを利用するには、以下の規約を遵守してください。<br />利用者ご本人により会員規約に同意のうえ、登録手続きを進めてください。</p>
</div>
</div></div>
({* }}} *})

({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>利用規約</h3></div>
<div class="block">
({if $c_siteadmin != ""})
<p>({$c_siteadmin|t_url2a|nl2br})</p>
({else})
<p>利用規約は、ただいま準備中です。</p>
({/if})
</div>
</div></div>
({* }}} *})

({* {{{ buttonLine *})
<div class="parts buttonLine">
({t_form_block m=pc a=page_h_regist_prof})
<input type="hidden" name="mode" value="input" />
<input type="submit" class="input_submit" value="同意して登録手続きへ" />
({/t_form_block})
</div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
