<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>新規登録</h3></div>
<div class="partsInfo">
<p>
メールアドレス({if $smarty.const.OPENPNE_USE_CAPTCHA})と確認キーワード({/if})を入力してください。<br />
入力されたメールアドレス宛に ({$SNS_NAME}) の招待状が送信されます。
</p>
</div>
({t_form_block m=pc a=do_o_public_invite})
<table>
<tr>
<th>メールアドレス</th>
<td>
<input type="text" class="input_text" name="pc_address" value="" size="40" />
</td>
</tr>
<tr>
<th>メールアドレス(確認)</th>
<td>
<input type="text" class="input_text" name="pc_address2" value="" size="40" />
</td>
</tr>
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
