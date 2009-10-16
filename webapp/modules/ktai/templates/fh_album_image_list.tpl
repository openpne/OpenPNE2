({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_member.nickname})さんのｱﾙﾊﾞﾑ</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$album_info.subject})</font><br>
</td></tr></table>

({if $type == 'h'})
[i:106]<a href="mailto:({$mail_address})?body=件名に写真の説明を書いてね">写真を追加</a><br>
<font color="#({$ktai_color_config.font_09})">※ﾒｰﾙ投稿では絵文字が反映されません</font>
<hr color="#({$ktai_color_config.border_01})">
({/if})

({if $total_num})

縮小写真を表示<br>
({t_form _method=get m=ktai a=page_fh_album_image_list})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_album_id" value="({$album_info.c_album_id})">
<input type="hidden" name="page" value="({$page})">
<input type="hidden" name="desc" value="({$desc})">
<input type="radio" value="1" name="is_thumbnail"({if $is_thumbnail}) checked="checked"({/if})>する　
<input type="radio" value="0" name="is_thumbnail"({if !$is_thumbnail}) checked="checked"({/if})>しない<br>
<input type="submit" value="表示を変更">
</form>

({if !$desc})
<a href="({t_url m=ktai a=page_fh_album_image_list})&amp;target_c_album_id=({$album_info.c_album_id})&amp;is_thumbnail=({$is_thumbnail})&amp;desc=1&amp;({$tail})">写真を新しい順に並べ替える</a>
({else})
<a href="({t_url m=ktai a=page_fh_album_image_list})&amp;target_c_album_id=({$album_info.c_album_id})&amp;is_thumbnail=({$is_thumbnail})&amp;desc=0&amp;({$tail})">写真を古い順に並べ替える</a>
({/if})

<hr color="#({$ktai_color_config.border_01})">

<center>
写真(全({$total_num})件)<br>
({$start})～({$end})件目を表示
</center>

<table width="100%">
({foreach from=$album_image_list item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">

<a href="({t_url m=ktai a=page_fh_album_image_show})&amp;target_c_album_image_id=({$item.c_album_image_id})&amp;({$tail})">
({if $is_thumbnail})
<img src="({t_img_url filename=$item.image_filename w=76 h=76})" align="left" /> 
({/if})
({$item.image_description})</a><br>
({if $type == 'h'})
[<a href="({t_url m=ktai a=page_h_album_image_edit})&amp;target_c_album_image_id=({$item.c_album_image_id})&amp;({$tail})">編集</a>]<br>
({/if})

</td></tr>
({/foreach})
</table>
({if $is_prev || $is_next})
<center>
<a name="pager"></a>
({if $is_prev})<a href="({t_url m=ktai a=page_fh_album_image_list})&amp;target_c_album_id=({$album_info.c_album_id})&amp;page=({$page-1})&amp;is_thumbnail=({$is_thumbnail})&amp;desc=({$desc})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>({/if})
({if $is_prev && $is_next})&nbsp;({/if})
({if $is_next})<a href="({t_url m=ktai a=page_fh_album_image_list})&amp;target_c_album_id=({$album_info.c_album_id})&amp;page=({$page+1})&amp;is_thumbnail=({$is_thumbnail})&amp;desc=({$desc})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>({/if})
<br>
</center>
({/if})
({else})
写真はありません。<br>
({/if})

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_fh_album})&amp;target_c_album_id=({$album_info.c_album_id})&amp;({$tail})">ｱﾙﾊﾞﾑのﾄｯﾌﾟ</a><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_member.c_member_id})&amp;({$tail})">({$target_member.nickname})さんのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
