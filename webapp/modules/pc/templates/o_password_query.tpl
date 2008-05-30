<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>パスワード再発行</h3></div>

<div class="partsInfo">
<p>登録したメールアドレスと、秘密の質問・答えを入力してください。<br />登録したものと一致すると、パスワードが登録メールアドレス宛に送信されます。</p>
</div>

({t_form_block m=pc a=do_o_password_query})
<table>
<tr><th>メールアドレス</th><td><input type="text" class="text" name="pc_address" value="" /></td></tr>
<tr><th>秘密の質問</th><td>
<select name="c_password_query_id">
<option value="" selected="selected">選択してください</option>
({foreach from=$c_password_query_list key=key item=item})
<option value="({$key})">({$item})</option>
({/foreach})
</select>
</td></tr>
<tr><th>秘密の答え</th><td><input type="text" class="text" name="c_password_query_answer" value="" /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　送　信　" /></li>
</ul>
</div>
({/t_form_block})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
