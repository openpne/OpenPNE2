({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ｱﾙﾊﾞﾑ写真の削除</a></font><br>
</td></tr></table>

この写真を本当に削除しますか?
<hr color="#({$ktai_color_config.border_01})">

<center>
({t_form m=ktai a=do_h_album_image_delete})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_album_image_id" value="({$c_album_image.c_album_image_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai a=page_h_album_image_edit})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_album_image_id" value="({$c_album_image.c_album_image_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
