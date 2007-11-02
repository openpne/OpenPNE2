({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_c_member.nickname})さん</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾌﾟﾛﾌｨｰﾙ写真</font><br>
</td></tr></table>

<center>
({if $target_c_member.image_filename})
<img src="({t_img_url filename=$target_c_member.image_filename w=120 h=120 f=jpg})" alt="ﾒｲﾝ写真"><br>
[<a href="({t_img_url filename=$target_c_member.image_filename w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
<br>
({if ($target_c_member.image_filename_1!=$target_c_member.image_filename)&&$target_c_member.image_filename_1})
<img src="({t_img_url filename=$target_c_member.image_filename_1 w=120 h=120 f=jpg})" alt="写真1"><br>
[<a href="({t_img_url filename=$target_c_member.image_filename_1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
<br>
({/if})
({if ($target_c_member.image_filename_2!=$target_c_member.image_filename)&&$target_c_member.image_filename_2})
<img src="({t_img_url filename=$target_c_member.image_filename_2 w=120 h=120 f=jpg})" alt="写真2"><br>
[<a href="({t_img_url filename=$target_c_member.image_filename_2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
<br>
({/if})
({if ($target_c_member.image_filename_3!=$target_c_member.image_filename)&&$target_c_member.image_filename_3})
<img src="({t_img_url filename=$target_c_member.image_filename_3 w=120 h=120 f=jpg})" alt="写真3"><br>
[<a href="({t_img_url filename=$target_c_member.image_filename_3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
<br>
({/if})
({/if})
</center>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
