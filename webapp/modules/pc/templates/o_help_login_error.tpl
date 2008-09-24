<div id="LayoutC">
<div id="Center">

({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>パスワードを忘れた方</h3></div>
<div class="block">
<p>パスワードを再発行する必要があります。<br />
以下のボタンをクリックし、パスワード再発行ページにて手続きをおこなってください。</p>

({t_form_block m=pc a=page_o_password_query})
<ul class="moreInfo button">
<li><input type="submit" value="パスワード再発行ページへ" class="input_submit" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})

({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>携帯から「({$smarty.const.SNS_NAME})」を利用している方</h3></div>
<div class="block">
<p>PC版を利用するには、PCメールアドレスの登録が必要です。<br />
以下のボタンをクリックし、PCメールアドレスの登録手続きをおこなってください。</p>

({t_form_block m=pc a=page_o_regist_pc_address})
<ul class="moreInfo button">
<li><input type="submit" value="PCメールアドレス登録ページへ" class="input_submit" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
