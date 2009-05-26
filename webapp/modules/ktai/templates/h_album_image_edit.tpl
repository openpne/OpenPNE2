({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">
写真の編集</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$album_info.subject})</font><br>
</td></tr></table>
<img src="({t_img_url filename=$c_album_image.image_filename w=180 h=180 f=jpg})"><br>

({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})

({t_form m=ktai a=do_h_album_image_edit})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_album_image_id" value="({$c_album_image.c_album_image_id})">
<font color="#({$ktai_color_config.font_06})">写真説明：</font><br>
<input name="description" value="({$c_album_image.image_description})"><br>
<br>

<center>
<input type="submit" value="登録する"><br>
</center>
</form>
<br>

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">写真の削除</font><br>
</td></tr></table>
ｱﾙﾊﾞﾑから写真を削除します。
<hr color="#({$ktai_color_config.border_01})">
({t_form m=ktai a=page_h_album_image_delete_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_album_image_id" value="({$c_album_image.c_album_image_id})">
<center>
<input type="submit" value="写真を削除する">
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_fh_album_image_show})&amp;target_c_album_image_id=({$c_album_image.c_album_image_id})&amp;({$tail})">写真画面に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
