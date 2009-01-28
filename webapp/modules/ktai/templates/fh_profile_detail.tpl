({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_c_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾌﾟﾛﾌｨｰﾙ詳細</font><br>
</td></tr></table>

({strip})
({capture name="birth"})
({if $target_c_member.age !== NULL})<font color="#({$ktai_color_config.font_06})">年齢：</font><br>({$target_c_member.age})歳<br>({/if})
({if $is_h && $target_c_member.public_flag_birth_year == 'friend'})<font color="#({$ktai_color_config.font_09})">※({$WORD_MY_FRIEND_HALF})まで公開</font><br>({/if})
({if $target_c_member.birth_month && $target_c_member.birth_day})
<br><font color="#({$ktai_color_config.font_06})">誕生日：</font><br>({$target_c_member.birth_month})月({$target_c_member.birth_day})日<br>
({if $is_h && $target_c_member.public_flag_birth_month_day == 'friend'})<font color="#({$ktai_color_config.font_09})">※({$WORD_MY_FRIEND_HALF})まで公開</font><br>({/if})
({/if})
({/capture})

({foreach from=$target_c_member.profile key=key item=item})

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

({if $item.value})
<br>
<font color="#({$ktai_color_config.font_06})">({$item.caption})：</font><br>

({if $item.form_type == 'checkbox' && $item.value !== ''})
    ({$item.value|@t_implode:", "})
({elseif $item.form_type == 'textarea'})
    ({$item.value|t_url2a_ktai|nl2br})
({else})
    ({$item.value})
({/if})
<br>
({if $is_h && $item.public_flag == 'friend'})<font color="#({$ktai_color_config.font_09})">※({$WORD_MY_FRIEND_HALF})まで公開</font><br>({/if})
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

({if $target_c_member.c_member_id != $u})
<hr color="#({$ktai_color_config.border_01})">
({if $relation.friend==0})
({if $relation.wait==0})
[i:140]<a href="({t_url m=ktai a=page_f_link_request})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})に加える</a><br>
({/if})
({/if})
[i:136]<a href="({t_url m=ktai a=do_f_bookmark_add_insert_c_bookmark})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">お気に入りに追加</a><br>
[i:90]<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>
({/if})
({$inc_ktai_footer|smarty:nodefaults})
