<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>パスワード再設定</h3></div>

<div class="partsInfo">
<p>新しいパスワードを入力してください</p>
</div>

({t_form_block m=pc a=do_o_password_reset})
<table>
<th>パスワード</th>
<td>
<input type="hidden" name="id" value="({$id})">
<input type="hidden" name="session" value="({$session})">
<input type="password" class="input_password" name="new_password" value="" size="20" />
<p class="caution">※パスワードは6～12文字の半角英数で入力してください。</p>
</td>
</tr><tr>
<th>パスワード確認</th>
<td>
<input type="password" class="input_password" name="new_password2" value="" size="20" />
</td>
</tr>
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
