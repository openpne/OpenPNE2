({$inc_ktai_header|smarty:nodefaults})
<table width="100%">
<tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">承認･要請中ﾘｽﾄ</a></font><br>
</td></tr></table>

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
({/if})
<table width="100%">

<tr><td bgcolor="#({$ktai_color_config.bg_05})">
<font color="#({$ktai_color_config.color_25})">承認待ち</font><br>
</td></tr>

<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_h_confirm_list1})&amp;({$tail})">({$WORD_FRIEND_HALF})ﾘﾝｸ承認待ち</a><br>
<a href="({t_url m=ktai a=page_h_confirm_list2})&amp;({$tail})">({$WORD_COMMUNITY_HALF})参加承認待ち</a><br>
<a href="({t_url m=ktai a=page_h_confirm_list3})&amp;({$tail})">({$WORD_COMMUNITY_HALF})管理者交代承認待ち</a><br>
<a href="({t_url m=ktai a=page_h_confirm_list4})&amp;({$tail})">({$WORD_COMMUNITY_HALF})副管理者承認待ち</a><br>
</tr>
</table>

<table width="100%">

<tr><td bgcolor="#({$ktai_color_config.bg_08})">
<font color="#({$ktai_color_config.color_25})">要請中</font><br>
</td></tr>

<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<a href="({t_url m=ktai a=page_h_confirm_list5})&amp;({$tail})">({$WORD_FRIEND_HALF})ﾘﾝｸ要請中</a><br>
<a href="({t_url m=ktai a=page_h_confirm_list6})&amp;({$tail})">({$WORD_COMMUNITY_HALF})要請中<br>
<a href="({t_url m=ktai a=page_h_confirm_list7})&amp;({$tail})">({$WORD_COMMUNITY_HALF})管理者交代要請中</a><br>
<a href="({t_url m=ktai a=page_h_confirm_list8})&amp;({$tail})">({$WORD_COMMUNITY_HALF})副管理者要請中</a><br>
</tr>
</table>

({$inc_ktai_footer|smarty:nodefaults})
