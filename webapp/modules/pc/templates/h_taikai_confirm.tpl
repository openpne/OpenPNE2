<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>({$smarty.const.SNS_NAME}) 退会</h3></div>
<div class="partsInfo">
<p>
本当に退会してもよろしいですか？<br />
退会する場合は、確認のためパスワードを入力してください。<br />
<br />
管理者になっている({$WORD_COMMUNITY})があれば、副管理者に管理権限が移管されます。また、副管理者がいない場合は参加日時のもっとも早いメンバーに権限が移管されます。
</p>
</div>
({t_form_block m=pc a=do_h_taikai})
<table>
<tr>
<th>パスワード <strong>※</strong></th>
<td>
<input type="password" class="input_pasword" name="password" value="" />
</td>
</tr>
<tr>
<th>退会理由 <strong>※</strong></th>
<td>
<textarea name="reason" rows="8" cols="50"></textarea>
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="退会する" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_h_home})">キャンセルしてホームへ</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
