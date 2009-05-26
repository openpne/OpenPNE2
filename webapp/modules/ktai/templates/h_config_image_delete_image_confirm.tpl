({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾌﾟﾛﾌｨｰﾙ写真削除</font><br>
</td></tr></table>

この写真を本当に削除しますか?<br>

<hr color="#({$ktai_color_config.border_01})">
<center>
({if $img_num == 1})
<img src="({t_img_url filename=$c_member.image_filename_1 w=120 h=120 f=jpg noimg=no_image f=jpg})" alt="写真1"><br>
[<a href="({t_img_url filename=$c_member.image_filename_1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({elseif $img_num == 2})
<img src="({t_img_url filename=$c_member.image_filename_2 w=120 h=120 f=jpg noimg=no_image f=jpg})" alt="写真2"><br>
[<a href="({t_img_url filename=$c_member.image_filename_2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({elseif $img_num == 3})
<img src="({t_img_url filename=$c_member.image_filename_3 w=120 h=120 f=jpg noimg=no_image f=jpg})" alt="写真3"><br>
[<a href="({t_img_url filename=$c_member.image_filename_3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
</center>

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=do_h_config_image_delete_image})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="img_num" value="({$img_num})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai a=page_h_config_image})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
