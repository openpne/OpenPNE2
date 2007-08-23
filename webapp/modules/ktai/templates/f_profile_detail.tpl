({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$target_c_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ﾌﾟﾛﾌｨｰﾙ詳細<br>
</td></tr></table>

({strip})
({capture name="birth"})
({if $target_c_member.age !== NULL})<font color="#999966">年齢：</font><br>({$target_c_member.age})歳<br>({/if})
({if $target_c_member.birth_month && $target_c_member.birth_day})
<br><font color="#999966">誕生日：</font><br>({$target_c_member.birth_month})月({$target_c_member.birth_day})日<br>
({/if})
({/capture})

({foreach from=$target_c_member.profile key=key item=item})

({if $item.form_type != 'textarea'})

({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
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

({if !$_cnt_nick && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})

({if !$_cnt_birth && $profile_list[$key].sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({if $item.value && $item.form_type != 'textarea'})
	<br><font color="#999966">({$item.caption})：</font><br>
({/if})

({if $item.form_type == 'checkbox'})
    ({$item.value|@t_implode:", "})
({else})
    ({$item.value})
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
({/strip})
<br>
({foreach from=$target_c_member.profile key=key item=item})
({if $item.form_type == 'textarea'})
<font color="#999966">({$item.caption})：</font><br>
({$item.value|t_url2a_ktai|nl2br})<br>
<br>
({/if})
({/foreach})

<hr color="#0d6ddf">
({if $relation.friend==0})
({if $relation.wait==0})
%%i140%%<a href="({t_url m=ktai a=page_f_link_request})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})に加える</a><br>
({/if})
({/if})
%%i136%%<a href="({t_url m=ktai a=do_f_bookmark_add_insert_c_bookmark})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">お気に入りに追加</a><br>
%%i90%%<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>
({$inc_ktai_footer|smarty:nodefaults})
