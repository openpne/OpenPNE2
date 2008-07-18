({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_COMMUNITY_HALF})写真の編集</font><br>
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
({if $c_commu.image_filename})
すでに写真が1枚登録されています。新しい写真を登録する場合は今の写真を削除してください。<br>
({else})
以下のﾒｰﾙｱﾄﾞﾚｽに写真を添付して送信してください。<br>
<font color="#({$ktai_color_config.font_06})">※写真は1枚以上登録できません</font><br>
<font color="#({$ktai_color_config.font_06})">※ﾀｲﾄﾙと本文は反映されません</font><br>
<a href="mailto:({$mail_address})">ﾒｰﾙ送信</a><br>
({/if})
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})の編集</a><br>

({$inc_ktai_footer|smarty:nodefaults})
