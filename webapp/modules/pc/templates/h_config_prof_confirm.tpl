<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>プロフィール変更</h3><p>(<strong>※</strong>の項目は必須です)</p></div>
<table>
<tr>
<th>検索設定 <strong>※</strong></th>
<td>
({if $prof.is_search_result == '1'})公開({elseif $prof.is_search_result == '0'})公開しない({/if})
</td>
</tr>
({capture name="nick"})
<tr>
<th>({$WORD_NICKNAME}) <strong>※</strong></th>
<td>({$prof.nickname})</td>
</tr>
({/capture})
({capture name="birth"})
<tr>
<th>生まれた年 <strong>※</strong></th>
<td>({$prof.birth_year})年
({if $prof.public_flag_birth_year == 'friend'})
（({$WORD_MY_FRIEND})まで公開）
({elseif $prof.public_flag_birth_year == 'private'})
（公開しない）
({/if})
</td>
</tr>
<tr>
<th>誕生日 <strong>※</strong></th>
<td>({$prof.birth_month})月({$prof.birth_day})日
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
({if $profile.disp_config})
<tr>
<th>({$profile.caption})({if $profile.is_required}) <strong>※</strong>({/if})</th>
<td>
({if $prof.profile[$profile.name].value})

({if $profile.form_type == 'textarea'})
    ({$prof.profile[$profile.name].value|nl2br|t_url2cmd:'profile':$u|t_cmd:'profile'})
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
</table>
<div class="operation">
<ul class="moreInfo button">
<li>
({t_form_block m=pc a=do_h_config_prof})
<input type="hidden" name="mode" value="register" />
<input type="hidden" name="is_search_result" value="({$prof.is_search_result})" />
<input type="hidden" name="nickname" value="({$prof.nickname})" />
<input type="hidden" name="birth_year" value="({$prof.birth_year})" />
<input type="hidden" name="birth_month" value="({$prof.birth_month})" />
<input type="hidden" name="birth_day" value="({$prof.birth_day})" />
<input type="hidden" name="public_flag_birth_year" value="({$prof.public_flag_birth_year})" />
<input type="hidden" name="public_flag_birth_month_day" value="({$prof.public_flag_birth_month_day})" />
({strip})
({foreach from=$prof.profile key=key item=item})
({if is_array($item.c_profile_option_id)})
    ({foreach from=$item.c_profile_option_id item=i})
    ({if $i})
    <input type="hidden" name="profile[({$key})][]" value="({$i})" />
    ({/if})
    ({/foreach})
({elseif $item.c_profile_option_id})
    <input type="hidden" name="profile[({$key})]" value="({$item.c_profile_option_id})" />
({else})
    <input type="hidden" name="profile[({$key})]" value="({$item.value})" />
({/if})
<input type="hidden" name="public_flag[({$key})]" value="({$item.public_flag})" />
({/foreach})
({/strip})
<input type="submit" class="input_submit" value="　確　定　" />
({/t_form_block})
</li>
<li>
({t_form_block m=pc a=do_h_config_prof})
<input type="hidden" name="mode" value="input" />
<input type="hidden" name="is_search_result" value="({$prof.is_search_result})" />
<input type="hidden" name="nickname" value="({$prof.nickname})" />
<input type="hidden" name="birth_year" value="({$prof.birth_year})" />
<input type="hidden" name="birth_month" value="({$prof.birth_month})" />
<input type="hidden" name="birth_day" value="({$prof.birth_day})" />
<input type="hidden" name="public_flag_birth_year" value="({$prof.public_flag_birth_year})" />
<input type="hidden" name="public_flag_birth_month_day" value="({$prof.public_flag_birth_month_day})" />
({strip})
({foreach from=$prof.profile key=key item=item})
({if is_array($item.c_profile_option_id)})
    ({foreach from=$item.c_profile_option_id item=i})
    ({if $i})
    <input type="hidden" name="profile[({$key})][]" value="({$i})" />
    ({/if})
    ({/foreach})
({elseif $item.c_profile_option_id})
    <input type="hidden" name="profile[({$key})]" value="({$item.c_profile_option_id})" />
({else})
    <input type="hidden" name="profile[({$key})]" value="({$item.value})" />
({/if})
<input type="hidden" name="public_flag[({$key})]" value="({$item.public_flag})" />
({/foreach})
({/strip})
<input type="submit" class="input_submit" value="　修　正　" />
({/t_form_block})
</li>
</ul>
</div>
</div></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
