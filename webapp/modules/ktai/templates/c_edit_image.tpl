({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
ｺﾐｭﾆﾃｨ写真の編集<br>
</td></tr></table>

<center>
({if $c_commu.image_filename})
<img src="({t_img_url filename=$c_commu.image_filename w=120 h=120 f=jpg})" alt="写真"><br>
[<a href="({t_img_url filename=$c_commu.image_filename w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a> | <a href="({t_url m=ktai a=page_c_delete_image_confirm})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">削除</a>]<br>
<br>
({else})
<br>
写真はありません<br>
<br>
({/if})
</center>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨの編集</a><br>

({$inc_ktai_footer|smarty:nodefaults})
