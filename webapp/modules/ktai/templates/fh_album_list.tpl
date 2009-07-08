({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_member.nickname})さんのｱﾙﾊﾞﾑ</a></font><br>
</td></tr>
</table>

({if $type == 'h'})
[i:68]<a href="({t_url m=ktai a=page_h_album_edit})&amp;({$tail})">ｱﾙﾊﾞﾑを追加</a>
<hr color="#({$ktai_color_config.border_01})">
({/if})

({if $total_num})
<center>
ｱﾙﾊﾞﾑ(全({$total_num})件)<br>
({$start})～({$end})件目を表示
</center>
<table width="100%">
({foreach from=$album_list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
({$item.r_datetime|date_format:"%Y/%m/%d %H:%M"})
({if $type == 'h'})
 [<a href="({t_url m=ktai a=page_h_album_edit})&amp;target_c_album_id=({$item.c_album_id})&amp;({$tail})">編集</a>]
({/if})
<br>
<a href="({t_url m=ktai a=page_fh_album})&amp;target_c_album_id=({$item.c_album_id})&amp;({$tail})">({$item.subject})</a>
<br>
({if $item.public_flag == "public"})
(全員に公開)
({elseif $item.public_flag == "friend"})
(({$WORD_MY_FRIEND_HALF})まで公開)
({elseif $item.public_flag == "private"})
(公開しない)
({/if})
</td></tr>
({/foreach})
</table>
({if $is_prev || $is_next})
<center>
<a name="pager"></a>
({if $is_prev})<a href="({t_url m=ktai a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page-1})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_album_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page+1})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
({else})
ｱﾙﾊﾞﾑはありません。<br>
({/if})

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})&amp;({$tail})">({$target_member.nickname})さんのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
