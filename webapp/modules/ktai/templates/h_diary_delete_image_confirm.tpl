({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$WORD_DIARY_HALF})の編集</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$target_c_diary.subject})</font><br>
</td></tr></table>

この写真を本当に削除しますか?
<hr color="#({$ktai_color_config.border_01})">

<center>
<img src="({t_img_url filename=$target_image_filename w=120 h=120 f=jpg})" alt="写真1"><br>
[<a href="({t_img_url filename=$target_image_filename w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
</center>

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=do_h_diary_delete_image})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary.c_diary_id})">
<input type="hidden" name="img_num" value="({$img_num})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai a=page_h_diary_edit_image})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary.c_diary_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
