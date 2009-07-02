<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>パスワード再設定</h3></div>

<div class="partsInfo">
({if $smarty.const.IS_PASSWORD_QUERY_ANSWER})
<p>登録したメールアドレスと、秘密の質問・答えを入力してください。<br />パスワードを再設定するためのURLが登録メールアドレス宛に送信されます。</p>
({else})
<p>登録したメールアドレスを入力してください。<br />パスワードを再設定するためのURLが登録メールアドレス宛に送信されます。</p>
({/if})
</div>

({t_form_block m=pc a=do_o_password_query})
<table>
<tr><th>メールアドレス</th><td><input type="text" class="text" name="pc_address" value="" /></td></tr>
({if $smarty.const.IS_PASSWORD_QUERY_ANSWER})
<tr><th>秘密の質問</th><td>
<select name="c_password_query_id">
<option value="" selected="selected">選択してください</option>
({foreach from=$c_password_query_list key=key item=item})
<option value="({$key})">({$item})</option>
({/foreach})
</select>
</td></tr>
<tr><th>秘密の答え</th><td><input type="text" class="text" name="c_password_query_answer" value="" /></td></tr>
({/if})
({if $smarty.const.OPENPNE_USE_CAPTCHA})
<tr>
<th>確認キーワード</th>
<td>
<p><img src="./cap.php?rand=({math equation="rand(0,99999999)"})" alt="確認キーワード" /></p>
<p>※上に表示されているキーワードをご記入下さい。</p>
<input type="text" class="input_text" name="captcha" value="" size="30" />
</td>
</tr>
({/if})
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
