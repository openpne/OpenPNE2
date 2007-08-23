({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">ﾒﾝﾊﾞｰ検索</a></font><br>
</td></tr></table>
<center>
検索結果
<font color="#999966">(({$pager.total_num})件)</font><br>
</center>
<table width="100%">
<tr><td>
<hr color="#b3ceef">
</td></tr>
({foreach from=$target_friend_list item=target_friend})
<tr><td bgcolor="({cycle values="#e0eaef,#ffffff"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_friend.c_member_id})&amp;({$tail})">({$target_friend.nickname|t_truncate:30:""})</a><br>
</td></tr>
({/foreach})
<tr><td>
<hr color="#b3ceef">
</td></tr></table>
({if $pager.page_prev || $pager.page_next})
<center>
({if $pager.page_prev})<a href="({t_url m=ktai a=page_h_friend_find_all})({if $nickname})&amp;nickname=({$nickname|to_sjis|escape:url|smarty:nodefaults})({/if})({if $search_condition})&amp;({$search_condition})({/if})&amp;page=({$pager.page_prev})&amp;({$tail})" accesskey="4">&#xE6E5;前を表示</a> ({/if})
({if $pager.page_next})<a href="({t_url m=ktai a=page_h_friend_find_all})({if $nickname})&amp;nickname=({$nickname|to_sjis|escape:url|smarty:nodefaults})({/if})({if $search_condition})&amp;({$search_condition})({/if})&amp;page=({$pager.page_next})&amp;({$tail})" accesskey="6">&#xE6E7;次を表示</a>({/if})
</center>
({/if})
<br>
<table width="100%">
<tr><td bgcolor="#dddddd" align="center">
ﾒﾝﾊﾞｰ検索<br>
</td></tr></table>
({strip})
({t_form _method=get m=ktai a=page_h_friend_find_all})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
({capture name="nick"})
<font color="#999966">ﾆｯｸﾈｰﾑ：</font><br>
<input type="text" name="nickname" value="({$nickname})"><br>
({/capture})
({capture name="birth"})
<font color="#999966">生年月日：</font><br>
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
({$smarty.capture.birth|smarty:nodefaults})<br>
({$smarty.capture.nick|smarty:nodefaults})<br>
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})

({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})<br>
({/if})

({if !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})<br>
({/if})

({if $profile.disp_search})
<font color="#999966">({$profile.caption})：</font><br>
({if $profile.form_type == 'select' || $profile.form_type == 'radio'})
    <select name="profile[({$profile.name})]">
    <option value="0">指定しない
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})"({if $item.c_profile_option_id == $profiles[$profile.name].c_profile_option_id}) selected({/if})>({$item.value})
    ({/foreach})
    </select>
({elseif $profile.form_type == 'checkbox'})
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
({$smarty.capture.birth|smarty:nodefaults})<br>
({$smarty.capture.nick|smarty:nodefaults})<br>
({else})
({$smarty.capture.nick|smarty:nodefaults})<br>
({$smarty.capture.birth|smarty:nodefaults})<br>
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})<br>({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})<br>({/if})
({/if})
<center>
<input type="submit" value="検索">
<center>
</form>
({/strip})



({$inc_ktai_footer|smarty:nodefaults})
