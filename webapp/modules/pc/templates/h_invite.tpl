<div id="LayoutC">
<div id="Center">

({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
({* {{{ simpleBox *})
<div class="dparts simpleBox"><div class="parts">
<div class="partsHeading"><h3>友人を({$smarty.const.SNS_NAME})に招待する</h3></div>
<div class="block">
<p>現在、新規登録を停止しています。</p>
</div>
</div></div>
({* }}} *})
({else})
({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>友人を({$smarty.const.SNS_NAME})に招待する</h3></div>
<div class="partsInfo">
<p>「({$smarty.const.SNS_NAME})」に招待したい方のメールアドレスを記入してください。</p>
</div>
({t_form_block m=pc a=page_h_invite_confirm})
<table>
<tr>
<th>友人のメールアドレス</th>
<td>
<input type="text" class="input_text" name="mail" value="({$requests.mail})" size="40" />
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PC})
<p class="caution">※携帯メールアドレスには招待を送ることができません。</p>
({elseif $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_KTAI})
<p class="caution">※PCメールアドレスには招待を送ることができません。</p>
({/if})
</td>
</tr>
<tr>
<th>メッセージ (任意)</th>
<td>
<textarea name="message" rows="5" cols="40">({$requests.message})</textarea>
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
<li><input type="submit" class="input_submit" value="確認画面" /></li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})
({/if})

({if $inviting_member || $k_inviting_member})
({* {{{ recentList *})
<div class="dparts recentList"><div class="parts">
<div class="partsHeading"><h3>招待中メールアドレス一覧</h3></div>

 ({t_form_block m=pc a=do_h_invite_delete_member})
<input type="hidden" name="c_member_id[]" value="({$item.c_member_pre_id})" />

({foreach from=$inviting_member item=item})
<dl>
<dt>({$item.r_date|date_format:"%Y年%m月%d日"})</dt>
<dd><input type="checkbox" class="input_checkbox" name="c_member_id[]" id="c_member_id-({$item.c_member_pre_id})" value="({$item.c_member_pre_id})" /> <label for="c_member_id-({$item.c_member_pre_id})">({$item.regist_address})</label></dd>
</dl>
({/foreach})

({foreach from=$k_inviting_member item=item})
<dl>
<dt>({$item.r_datetime|date_format:"%Y年%m月%d日"})</dt>
<dd><input type="checkbox" class="input_checkbox" name="c_member_ktai_id[]" id="c_member_id-({$item.c_member_pre_id})" value="({$item.c_member_ktai_pre_id})" /> <label for="c_member_id-({$item.c_member_pre_id})">({$item.ktai_address})</label></dd>
</dl>
({/foreach})

<div class="operation">
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="　削  除　" /></li>
</ul>
</div>

({/t_form_block})
</div></div>
({* }}} *})
({/if})

</div><!-- Center -->
</div><!-- LayoutC -->
