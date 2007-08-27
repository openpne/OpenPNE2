({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
ﾌﾟﾛﾌｨｰﾙ写真設定<br>
</td></tr></table>
<center>
({if $c_member.image_filename})
({if $c_member.image_filename_1})
<img src="({t_img_url filename=$c_member.image_filename_1 w=120 h=120 f=jpg})" alt="画像１"><br>
[<a href="({t_img_url filename=$c_member.image_filename_1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
[<a href="({t_url m=ktai a=page_h_config_image_delete_image_confirm})&amp;img_num=1&amp;({$tail})">削除</a>|
({if $c_member.image_filename_1==$c_member.image_filename})
<font color="#({$ktai_color_config.font_02})">現在のﾒｲﾝ</font>]<br>
({else})
<a href="({t_url m=ktai a=do_h_config_image_change_main_image})&amp;img_num=1&amp;({$tail})">ﾒｲﾝにする</a>]<br>
({/if})
<br>
({/if})

({if $c_member.image_filename_2})
<img src="({t_img_url filename=$c_member.image_filename_2 w=120 h=120 f=jpg})" alt="画像２"><br>
[<a href="({t_img_url filename=$c_member.image_filename_2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
[<a href="({t_url m=ktai a=page_h_config_image_delete_image_confirm})&amp;img_num=2&amp;({$tail})">削除</a>|
({if $c_member.image_filename_2==$c_member.image_filename})
<font color="#({$ktai_color_config.font_02})">現在のﾒｲﾝ</font>]<br>
({else})
<a href="({t_url m=ktai a=do_h_config_image_change_main_image})&amp;img_num=2&amp;({$tail})">ﾒｲﾝにする</a>]<br>
({/if})
<br>
({/if})

({if $c_member.image_filename_3})
<img src="({t_img_url filename=$c_member.image_filename_3 w=120 h=120 f=jpg})" alt="画像３"><br>
[<a href="({t_img_url filename=$c_member.image_filename_3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
[<a href="({t_url m=ktai a=page_h_config_image_delete_image_confirm})&amp;img_num=3&amp;({$tail})">削除</a>|
({if $c_member.image_filename_3==$c_member.image_filename})
<font color="#({$ktai_color_config.font_02})">現在のﾒｲﾝ</font>]<br>
({else})
<a href="({t_url m=ktai a=do_h_config_image_change_main_image})&amp;img_num=3&amp;({$tail})">ﾒｲﾝにする</a>]<br>
({/if})
<br>
({/if})

({else})
現在、ﾌﾟﾛﾌｨｰﾙ写真は登録されていません。<br>
({/if})
</center>
<hr color="#({$ktai_color_config.border_01})">
({if $c_member.image_filename_1&&$c_member.image_filename_2&&$c_member.image_filename_3})
登録できる画像は三枚までです。<br>
新しく登録する場合は登録画像を削除してください。<br>
({else})
以下のｱﾄﾞﾚｽに写真を添付して送信してください。<br>
%%i68%%<a href="mailto:({$mail_address})">ﾒｰﾙ送信</a><br>
({/if})
({$inc_ktai_footer|smarty:nodefaults})
