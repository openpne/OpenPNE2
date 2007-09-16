({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">ｺﾐｭﾆﾃｨの編集</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
({$c_commu.name})<br>
</td></tr></table>

この写真を本当に削除しますか？
<hr color="#({$ktai_color_config.border_01})">

<center>
<img src="({t_img_url filename=$c_commu.image_filename w=120 h=120 f=jpg})" alt="写真"><br>
[<a href="({t_img_url filename=$c_commu.image_filename w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
</center>

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=do_c_edit_image_delete_c_commu_image})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<input type="submit" value="は　い">
</form>

({t_form m=ktai a=page_c_edit})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<input type="submit" value="いいえ">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
