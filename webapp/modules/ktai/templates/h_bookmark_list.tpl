({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">お気に入り</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾒﾝﾊﾞｰﾘｽﾄ</font><br>
</td></tr></table>

({if $c_members_num==0})
お気に入り登録はありません。
({else})

<center>
({$pager.start})件～({$pager.end})件を表示<br>
</center>

<hr color="#({$ktai_color_config.border_02})">
<table width="100%">
({foreach from=$c_members item=c_member})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">({$c_member.nickname})</a>
[<a href="({t_url m=ktai a=do_f_bookmark_delete_delete_c_bookmark})&amp;target_c_member_id=({$c_member.c_member_id})&amp;({$tail})">削除</a>]
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
</table>

({if $is_prev || $is_next})
<center>
({if $is_prev})<a href="({t_url m=ktai a=page_h_bookmark_list})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_h_bookmark_list})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
({/if})
({$inc_ktai_footer|smarty:nodefaults})
