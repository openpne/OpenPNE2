<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>PCメールアドレス登録</h3></div>

<div class="partsInfo">
<p>
登録済みの({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})ログインID({else})携帯メールアドレス({/if})とパスワード、登録したいPCメールアドレスを入力してください。
</p>
</div>

({t_form_block m=pc a=do_o_regist_pc_address})
<table>
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})
<tr>
<th>ログインID</th>
<td>
<input type="text" class="input_text" name="pneid" value="({$requests.pneid})" size="40" />
</td>
</tr>
({else})
<tr>
<th>携帯メールアドレス</th>
<td>
<input type="text" class="input_text" name="ktai_address" value="({$requests.ktai_address})" size="40" />
</td>
</tr>
({/if})
<tr>
<th>パスワード</th>
<td>
<input type="password" class="input_password" name="password" value="" size="20" />
</td>
</tr><tr>
<th>PCメールアドレス</th>
<td>
<input type="text" class="input_text" name="pc_address" value="({$requests.pc_address})" size="40" />
<p class="caution">
※メールアドレスは公開されません。
</p>
</td>
</tr><tr>
<th>PCメールアドレス確認</th>
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
