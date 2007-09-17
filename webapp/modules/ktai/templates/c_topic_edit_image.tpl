({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
({if !$c_topic.event_flag})ﾄﾋﾟｯｸ({else})ｲﾍﾞﾝﾄ({/if})写真の編集<br>
</td></tr></table>

<center>
({if $c_topic.image_filename1 || $c_topic.image_filename2 || $c_topic.image_filename3})
({if $c_topic.image_filename1})
<img src="({t_img_url filename=$c_topic.image_filename1 w=120 h=120 f=jpg})" alt="写真"><br>
[<a href="({t_img_url filename=$c_topic.image_filename1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a> | <a href="({t_url m=ktai a=page_c_topic_delete_image_confirm})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;img_num=1&amp;({$tail})">削除</a>]<br>
<br>
({/if})
({if $c_topic.image_filename2})
<img src="({t_img_url filename=$c_topic.image_filename2 w=120 h=120 f=jpg})" alt="写真"><br>
[<a href="({t_img_url filename=$c_topic.image_filename2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a> | <a href="({t_url m=ktai a=page_c_topic_delete_image_confirm})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;img_num=2&amp;({$tail})">削除</a>]<br>
<br>
({/if})
({if $c_topic.image_filename3})
<img src="({t_img_url filename=$c_topic.image_filename3 w=120 h=120 f=jpg})" alt="写真"><br>
[<a href="({t_img_url filename=$c_topic.image_filename3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a> | <a href="({t_url m=ktai a=page_c_topic_delete_image_confirm})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;img_num=3&amp;({$tail})">削除</a>]<br>
<br>
({/if})
({else})
<br>
写真はありません<br>
<br>
({/if})
</center>

<hr color="#({$ktai_color_config.border_01})">
({if !$c_topic.event_flag})
[i:90]<a href="({t_url m=ktai a=page_c_topic_edit})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;({$tail})">ﾄﾋﾟｯｸの編集</a><br>
({else})
[i:90]<a href="({t_url m=ktai a=page_c_event_edit})&amp;target_c_commu_topic_id=({$c_topic.c_commu_topic_id})&amp;({$tail})">ｲﾍﾞﾝﾄの編集</a><br>
({/if})

({$inc_ktai_footer|smarty:nodefaults})
