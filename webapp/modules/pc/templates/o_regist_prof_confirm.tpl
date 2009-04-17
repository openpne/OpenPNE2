<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>プロフィール確認</h3></div>
<div class="partsInfo">
({if $smarty.const.IS_SNS_ENTRY_CONFIRM})
<p>以下の内容で管理者に申請します。確認のうえ、参加申請ボタンをクリックしてください。</p>
({else})
<p>以下の内容で登録します。確認のうえ、登録ボタンをクリックしてください。</p>
({/if})
</div>
<table>
({if $smarty.const.OPENPNE_AUTH_MODE == 'pneid'})
<tr>
<th>ログインID <strong>※</strong></th>
<td>({$prof.login_id})</td>
</tr>
({/if})
({capture name="nick"})
<tr>
<th>({$WORD_NICKNAME}) <strong>※</strong></th>
<td>({$prof.nickname})</td>
</tr>
({/capture})
({capture name="birth"})
<tr>
<th>生まれた年 <strong>※</strong></th>
<td>
({$prof.birth_year})年
({if $prof.public_flag_birth_year == 'friend'})
（({$WORD_MY_FRIEND})まで公開）
({elseif $prof.public_flag_birth_year == 'private'})
（公開しない）
({/if})
</td>
</tr>
<tr>
<th>誕生日 <strong>※</strong></th>
<td>
({$prof.birth_month})月({$prof.birth_day})日
({if $prof.public_flag_birth_month_day == 'friend'})
（({$WORD_MY_FRIEND})まで公開）
({elseif $prof.public_flag_birth_month_day == 'private'})
（公開しない）
({/if})
</td>
</tr>
({/capture})
({foreach from=$profile_list item=profile})
({strip})

({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_nick"})
({counter assign="_cnt_birth"})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})

({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})

({if !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({/strip})
({if $profile.disp_regist})
<tr>
<th>({$profile.caption})({if $profile.is_required}) <strong>※</strong>({/if})</th>
<td>
({if $prof.profile[$profile.name].value})

({if $profile.form_type == 'textarea'})
    ({$prof.profile[$profile.name].value|nl2br|t_url2cmd:'profile'|t_cmd:'profile'})
({elseif $profile.form_type == 'checkbox'})
    ({$prof.profile[$profile.name].value|@t_implode:", "})
({else})
    ({$prof.profile[$profile.name].value})
({/if})

({if $prof.profile[$profile.name].public_flag == 'friend'})
（({$WORD_MY_FRIEND})まで公開）
({elseif $prof.profile[$profile.name].public_flag == 'private'})
（公開しない）
({/if})

({/if})
</td>
</tr>
({/if})
({/foreach})
({if !$_cnt_nick && !$_cnt_birth})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/if})
<tr>
<th>PCメールアドレス <strong>※</strong></th>
<td>({$pc_address})</td>
</tr>
<tr>
<th>パスワード <strong>※</strong></th>
<td>（表示しません）</td>
</tr>
({if $smarty.const.IS_PASSWORD_QUERY_ANSWER})
<tr>
<th>秘密の質問 <strong>※</strong></th>
<td>({$password_query_name})</td>
</tr>
<tr>
<th>質問の答え <strong>※</strong></th>
<td>({$prof.c_password_query_answer})</td>
</tr>
({/if})
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_o_regist_prof})
<input type="hidden" name="mode" value="register" />
<input type="hidden" name="sid" value="({$sid})" />
({if $smarty.const.IS_SNS_ENTRY_CONFIRM })
<input type="submit" class="input_submit" value="　参加申請　" />
({else})
<input type="submit" class="input_submit" value="　登　録　" />
({/if})
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=do_o_regist_prof})
<input type="hidden" name="mode" value="input" />
<input type="hidden" name="sid" value="({$sid})" />
<input type="submit" class="input_submit" value="　修　正　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
