<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>携帯登録用メールアドレス確認</h3></div>

<div class="partsInfo">
<p>
以下の携帯メールアドレス宛てに携帯登録用のURLを送信します。<br />
<br />
※ここで入力したメールアドレスは他のメンバーには公開されません<br />
※ドメイン指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのメールを受信できるように指定してください
</p>
</div>

<table>
<tr><th>携帯メールアドレス<span class="caution">※</span></th><td>({$ktai_address})</td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_o_regist_ktai_address})
<input type="hidden" name="sid" value="({$sid})" />
<input type="hidden" name="ktai_address" value="({$ktai_address})" />
<input type="submit" class="input_submit" value="　送　信　" />
({/t_form_block})
</li><li>
({t_form_block m=pc a=page_o_regist_ktai_address})
<input type="hidden" name="sid" value="({$sid})" />
<input type="hidden" name="ktai_address" value="({$ktai_address})" />
<input type="submit" class="input_submit" value="　修　正　" />
({/t_form_block})
</li>
</ul>
</div>

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
