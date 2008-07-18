({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_member.nickname})さんのｱﾙﾊﾞﾑ</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$album_info.subject})</font><br>
</td></tr></table>
<img src="({t_img_url filename=$album_info.album_cover_image w=180 h=180 f=jpg})"><br>
<font color="#({$ktai_color_config.font_06})">説明文:</font><br>
({$album_info.description|t_url2a_ktai|nl2br})<br>
(({if $album_info.public_flag == "public"})全員に公開({elseif $album_info.public_flag == "friend"})({$WORD_MY_FRIEND_HALF})まで公開({elseif $album_info.public_flag == "private"})公開しない({/if}))<br>
<br>
<a href="({t_url m=ktai a=page_fh_album_image_list})&amp;target_c_album_id=({$album_info.c_album_id})&amp;({$tail})">写真一覧</a>
<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})&amp;({$tail})">({$target_member.nickname})さんのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
