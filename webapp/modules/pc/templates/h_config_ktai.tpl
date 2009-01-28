<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>携帯メールアドレスを登録する</h3></div>
<div class="partsInfo">
<p>携帯メールアドレスを登録すると、携帯から({$WORD_DIARY})・({$WORD_COMMUNITY})・あしあとの閲覧・書き込みなどがおこなえます。登録手順は以下の通りです。</p>
<ol>
<li>１．以下の欄に携帯メールアドレスを記入して「送信」ボタンを押してください。</li>
<li>２．記入したメールアドレス宛に「({$SNS_NAME})」よりメールが届きます。</li>
<li>３．メール内に記載されたURLよりアクセスして、ログインしてください。</li>
</ol>
<p>※ドメイン指定受信を設定されている方は、「({$smarty.const.ADMIN_EMAIL})」からのメールを受信できるように指定してください。</p>
<p>※既に携帯メールアドレスが登録されている場合、新しいメールアドレスに変更されます。</p>
</div>
({t_form_block m=pc a=do_h_config_ktai_send})
<table>
<tr>
<th>携帯メールアドレス</th>
<td>
<input type="text" class="input_text" name="ktai_address" value="({$form_val.mail})" size="40" />
</td>
</tr>
</table>
<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　送　信　" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({if $ktai && ($smarty.const.IS_GET_EASY_ACCESS_ID != 3 && $smarty.const.IS_GET_EASY_ACCESS_ID != 2)})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>登録携帯メールアドレスを削除する</h3></div>
<div class="block">
<p>現在登録されている携帯メールアドレスを削除します</p>
({t_form_block m=pc a=page_h_delete_ktai})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削　除　" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
