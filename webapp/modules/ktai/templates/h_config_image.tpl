({$inc_ktai_header|smarty:nodefaults})

<center>プロフィール写真設定</center>
<hr>
({if $c_member.image_filename})
現在のメイン写真:<br>
<img src="({t_img_url filename=$c_member.image_filename w=120 h=120 f=jpg})"><br>
<br>
({if $c_member.image_filename_1})
写真1:[<a href="({t_img_url filename=$c_member.image_filename_1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_member.image_filename_1 f=jpg})">大</a>]
({if $c_member.image_filename_1==$c_member.image_filename})
[<font color="red">現在のメイン</font>]
({else})
[<a href="({t_url m=ktai a=do_h_config_image_change_main_image})&amp;img_num=1&amp;({$tail})">メインにする</a>]
({/if})
[<a href="({t_url m=ktai a=page_h_config_image_delete_image_confirm})&amp;img_num=1&amp;({$tail})">削除</a>]<br>
({/if})
({if $c_member.image_filename_2})
写真2:[<a href="({t_img_url filename=$c_member.image_filename_2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_member.image_filename_2 f=jpg})">大</a>]
({if $c_member.image_filename_2==$c_member.image_filename})
[<font color="red">現在のメイン</font>]
({else})
[<a href="({t_url m=ktai a=do_h_config_image_change_main_image})&amp;img_num=2&amp;({$tail})">メインにする</a>]
({/if})
[<a href="({t_url m=ktai a=page_h_config_image_delete_image_confirm})&amp;img_num=2&amp;({$tail})">削除</a>]<br>
({/if})
({if $c_member.image_filename_3})
写真3:[<a href="({t_img_url filename=$c_member.image_filename_3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_member.image_filename_3 f=jpg})">大</a>]
({if $c_member.image_filename_3==$c_member.image_filename})
[<font color="red">現在のメイン</font>]
({else})
[<a href="({t_url m=ktai a=do_h_config_image_change_main_image})&amp;img_num=3&amp;({$tail})">メインにする</a>]
({/if})
[<a href="({t_url m=ktai a=page_h_config_image_delete_image_confirm})&amp;img_num=3&amp;({$tail})">削除</a>]<br>
({/if})

({else})
現在、プロフィール写真は登録されていません。<br>
({/if})
<br>
({if $c_member.image_filename_1&&$c_member.image_filename_2&&$c_member.image_filename_3})
登録できる画像は三枚までです。<br>
新しく登録する場合は登録画像を削除してください。<br>
({else})
以下のアドレスに写真を添付して送信してください。<br>
<a href="mailto:({$mail_address})">メール送信</a><br>
({/if})
<hr>

({$inc_ktai_footer|smarty:nodefaults})