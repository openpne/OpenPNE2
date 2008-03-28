<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>PCメールアドレス登録</h3></div>

<div class="partsInfo">
<p>PCメールアドレスの登録をおこないます。<br />パスワードを入力してください。<br />※既にPCメールアドレスが登録されている場合、新しいメールアドレスに変更されます。</p>
</div>

({t_form_block m=pc a=do_o_login2_change_mail})
<input type="hidden" name="sid" value="({$sid})" />
<input type="hidden" name="username" value="({$username})" />
<table>
<tr><th>メールアドレス</th><td>({$pc_address})<br /><p class="caution">※メールアドレスは公開されません。</p></td></tr>
<tr><th>パスワード</th><td><input type="password" name="password" class="text" /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　登　録　" /></li>
</ul>
</div>
({/t_form_block})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
