({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">
ｱﾙﾊﾞﾑ表紙の編集</a></font><br>
</td></tr></table>

<img src="({t_img_url filename=$target_c_album.album_cover_image w=180 h=180 f=jpg})"><br>

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">表紙画像の置換え</font><br>
</td></tr></table>
[i:106]<a href="mailto:({$mail_address})?subject=アルバム表紙を添付してね">ﾒｰﾙで表紙画像を投稿</a><br>
ｱﾙﾊﾞﾑ表紙を添付画像と置き換えます。<br>
<font color="#({$ktai_color_config.font_09})">※件名と本文は反映されません</font>

({if $target_c_album.album_cover_image})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">表紙画像の削除</font><br>
</td></tr></table>
ｱﾙﾊﾞﾑの表紙画像を削除します。
<hr color="#({$ktai_color_config.border_01})">
({t_form m=ktai a=page_h_album_cover_image_delete_confirm})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_album_id" value="({$target_c_album.c_album_id})">
<center>
<input type="submit" value="表紙画像を削除する">
</center>
</form>
({/if})

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_fh_album})&amp;target_c_album_id=({$target_c_album.c_album_id})&amp;({$tail})">このｱﾙﾊﾞﾑを見る</a><br>
<a href="({t_url m=ktai a=page_h_album_edit})&amp;target_c_album_id=({$target_c_album.c_album_id})&amp;({$tail})">ｱﾙﾊﾞﾑ編集画面に戻る</a><br>

({$inc_ktai_footer|smarty:nodefaults})
