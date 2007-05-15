({$inc_ktai_header|smarty:nodefaults})

<center><font color="orange">ﾒﾝﾊﾞｰ検索</font></center>
<hr><br>

({strip})
({t_form _method=get m=ktai a=page_h_friend_find_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
検索条件<br>

({capture name="nick"})
ﾆｯｸﾈｰﾑ <input type="text" name="nickname" value="({$nickname})"><br>
({/capture})
({capture name="birth"})
生年月日
<input type="text" name="birth_year" value="({$cond.birth_year})" size="4" maxlength="4" istyle="4" mode="numeric">年
<input type="text" name="birth_month" value="({$cond.birth_month})" size="2" maxlength="4" istyle="4" mode="numeric">月
<input type="text" name="birth_day" value="({$cond.birth_day})" size="2" maxlength="4" istyle="4" mode="numeric">日<br>
({/capture})

({foreach from=$profile_list item=profile})

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

({if $profile.disp_search})
({$profile.caption})
({if $profile.form_type == 'select' || $profile.form_type == 'radio'})
    <select name="profile[({$profile.name})]">
    <option value="0">指定しない
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})"({if $item.c_profile_option_id == $profiles[$profile.name].c_profile_option_id}) selected({/if})>({$item.value})
    ({/foreach})
    </select>
({elseif $profile.form_type == 'checkbox'})
({* 単一選択パターン *})
    <select name="profile[({$profile.name})]">
    <option value="0">指定しない
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})"({if $item.c_profile_option_id == $profiles[$profile.name].c_profile_option_id}) selected({/if})>({$item.value})
    ({/foreach})
    </select>
({elseif $profile.form_type == 'text' || $profile.form_type == 'textlong' || $profile.form_type == 'textarea'})
    <input name="profile[({$profile.name})]" type="text" value="({$profiles[$profile.name].value})">
({/if})
<br>
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

<input type="submit" value="検索">
</form>
({/strip})

<hr>
検索結果(({$pager.total_num})件)<br>
({foreach from=$target_friend_list item=target_friend})
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_friend.c_member_id})&amp;({$tail})">({$target_friend.nickname})</a><br>
({/foreach})

({if $pager.page_prev || $pager.page_next})
<br>
({if $pager.page_prev})<a href="({t_url m=ktai a=page_h_friend_find_all})({if $nickname})&amp;nickname=({$nickname|to_sjis|escape:url|smarty:nodefaults})({/if})({if $search_condition})&amp;({$search_condition})({/if})&amp;page=({$pager.page_prev})&amp;({$tail})">前へ</a> ({/if})
({if $pager.page_next})<a href="({t_url m=ktai a=page_h_friend_find_all})({if $nickname})&amp;nickname=({$nickname|to_sjis|escape:url|smarty:nodefaults})({/if})({if $search_condition})&amp;({$search_condition})({/if})&amp;page=({$pager.page_next})&amp;({$tail})">次へ</a>({/if})

({/if})
<br>
<hr>

({$inc_ktai_footer|smarty:nodefaults})
