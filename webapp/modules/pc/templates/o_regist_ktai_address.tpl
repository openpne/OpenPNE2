<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>携帯登録用メールアドレス入力</h3></div>

({t_form_block m=pc a=page_o_regist_ktai_address_confirm})
<input type="hidden" name="sid" value="({$sid})" />

<div class="partsInfo">
<p>
({$smarty.const.SNS_NAME})に参加するには、携帯登録が必要です。<br />
ここで入力した携帯メールアドレス宛てに携帯登録用のURLを送信します。<br />
<br />
※ここで入力したメールアドレスは他のメンバーには公開されません<br />
※ドメイン指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのメールを受信できるように指定してください
</p>
</div>

<table>
<tr><th>携帯メールアドレス<span class="caution">※</span></th><td><input type="text" class="text" name="ktai_address" value="({$ktai_address})" size="40" /></td></tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="確認画面へ" /></li>
</ul>
</div>
({/t_form_block})

</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
