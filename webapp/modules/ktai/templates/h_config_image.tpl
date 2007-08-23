({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
ﾌﾟﾛﾌｨｰﾙ写真設定<br>
</td></tr></table>
<center>
({if $c_member.image_filename})
({if $c_member.image_filename_1})
<img src="({t_img_url filename=$c_member.image_filename_1 w=120 h=120 f=jpg})" alt="画像１"><br>
[<a href="({t_img_url filename=$c_member.image_filename_1 f=jpg})">大</a>]<br>
[<a href="({t_url m=ktai a=page_h_config_image_delete_image_confirm})&amp;img_num=1&amp;({$tail})">削除</a>|
({if $c_member.image_filename_1==$c_member.image_filename})
<font color="#999966">現在のﾒｲﾝ</font>]<br>
({else})
<a href="({t_url m=ktai a=do_h_config_image_change_main_image})&amp;img_num=1&amp;({$tail})">ﾒｲﾝにする</a>]<br>
({/if})
<br>
({/if})

({if $c_member.image_filename_2})
<img src="({t_img_url filename=$c_member.image_filename_2 w=120 h=120 f=jpg})" alt="画像２"><br>
[<a href="({t_img_url filename=$c_member.image_filename_2 f=jpg})">大</a>]<br>
[<a href="({t_url m=ktai a=page_h_config_image_delete_image_confirm})&amp;img_num=2&amp;({$tail})">削除</a>|
({if $c_member.image_filename_2==$c_member.image_filename})
<font color="#999966">現在のﾒｲﾝ</font>]<br>
({else})
<a href="({t_url m=ktai a=do_h_config_image_change_main_image})&amp;img_num=2&amp;({$tail})">ﾒｲﾝにする</a>]<br>
({/if})
<br>
({/if})

({if $c_member.image_filename_3})
<img src="({t_img_url filename=$c_member.image_filename_3 w=120 h=120 f=jpg})" alt="画像３"><br>
[<a href="({t_img_url filename=$c_member.image_filename_3 f=jpg})">大</a>]<br>
[<a href="({t_url m=ktai a=page_h_config_image_delete_image_confirm})&amp;img_num=3&amp;({$tail})">削除</a>|
({if $c_member.image_filename_3==$c_member.image_filename})
<font color="#999966">現在のﾒｲﾝ</font>]<br>
({else})
<a href="({t_url m=ktai a=do_h_config_image_change_main_image})&amp;img_num=3&amp;({$tail})">ﾒｲﾝにする</a>]<br>
({/if})
<br>
({/if})

({else})
現在、ﾌﾟﾛﾌｨｰﾙ写真は登録されていません。<br>
({/if})
</center>
<hr color="#0d6ddf">
({if $c_member.image_filename_1&&$c_member.image_filename_2&&$c_member.image_filename_3})
登録できる画像は三枚までです。<br>
新しく登録する場合は登録画像を削除してください。<br>
({else})
以下のｱﾄﾞﾚｽに写真を添付して送信してください。<br>
&#xE681;<a href="mailto:({$mail_address})">ﾒｰﾙ送信</a><br>
({/if})
({$inc_ktai_footer|smarty:nodefaults})
