({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ﾌﾟﾛﾌｨｰﾙ写真削除<br>
</td></tr></table>

この写真を本当に削除しますか?<br>

<hr color="#0d6ddf">	
<center>
({if $img_num == 1})
<img src="({t_img_url filename=$c_member.image_filename_1 w=120 h=120 f=jpg noimg=no_image})" alt="画像1"><br>
[<a href="({t_img_url filename=$c_member.image_filename_1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({elseif $img_num == 2})
<img src="({t_img_url filename=$c_member.image_filename_2 w=120 h=120 f=jpg noimg=no_image})" alt="画像2"><br>
[<a href="({t_img_url filename=$c_member.image_filename_2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({elseif $img_num == 3})
<img src="({t_img_url filename=$c_member.image_filename_3 w=120 h=120 f=jpg noimg=no_image})" alt="画像3"><br>
[<a href="({t_img_url filename=$c_member.image_filename_3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
</center>

<hr color="#0d6ddf">
<center>
({t_form m=ktai a=do_h_config_image_delete_image})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="img_num" value="({$img_num})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form m=ktai a=page_h_config_image})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
