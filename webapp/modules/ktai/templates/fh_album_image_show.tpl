({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_member.nickname})さんのｱﾙﾊﾞﾑ</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$album_info.subject})</font><br>
</td></tr></table>

({if $c_album_image_id_prev || $c_album_image_id_next})
<center>
<a name="pager"></a>
({if $c_album_image_id_prev})<a href="({t_url m=ktai a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_image_id_prev})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $c_album_image_id_prev && $c_album_image_id_next})&nbsp;({/if})
({if $c_album_image_id_next})<a href="({t_url m=ktai a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_image_id_next})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})

<img src="({t_img_url filename=$c_album_image.image_filename w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})"><br>
<font color="#({$ktai_color_config.font_06})">写真説明:</font><br>
({$c_album_image.image_description|t_url2a_ktai|nl2br})<br>
({if $type == 'h'})
[<a href="({t_url m=ktai a=page_h_album_image_edit})&amp;target_c_album_image_id=({$c_album_image.c_album_image_id})&amp;({$tail})">編集</a>]<br>
[<a href="({t_url m=ktai a=do_h_album_cover_image_copy})&amp;target_c_album_image_id=({$c_album_image.c_album_image_id})&amp;({$tail})">この写真をｱﾙﾊﾞﾑの表紙にする</a>]<br>
({/if})

({if $c_album_image_id_prev || $c_album_image_id_next})
<center>
<a name="pager"></a>
({if $c_album_image_id_prev})<a href="({t_url m=ktai a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_image_id_prev})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $c_album_image_id_prev && $c_album_image_id_next})&nbsp;({/if})
({if $c_album_image_id_next})<a href="({t_url m=ktai a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_image_id_next})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_fh_album_image_list})&amp;target_c_album_id=({$album_info.c_album_id})&amp;({$tail})">ｱﾙﾊﾞﾑの写真一覧</a><br>
<a href="({t_url m=ktai a=page_fh_album})&amp;target_c_album_id=({$album_info.c_album_id})&amp;({$tail})">ｱﾙﾊﾞﾑのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
