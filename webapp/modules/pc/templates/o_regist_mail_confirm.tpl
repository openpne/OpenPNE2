<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>メールアドレス登録</h3></div>

({t_form_block m=pc a=do_o_regist_mail})
<input type="hidden" name="sid" value="({$sid})" />
<input type="hidden" name="username" value="({$username})" />

<div class="partsInfo">
<p>メールアドレスの登録をおこないます。<br />パスワードを入力してください。</p>
</div>

<table>
<tr><th>メールアドレス</th><td>({$pc_address})<br /><span class="caution">※メールアドレスは公開されません。</span></td></tr>
<tr><th>パスワード</th><td><input type="password" name="password" class="text" /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　変　更　" /></li>
</ul>
</div>
({/t_form_block})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
