({$inc_ktai_header|smarty:nodefaults})

<center>({$target_c_member.nickname})さんのプロフィール写真</center>
<hr>
({if $target_c_member.image_filename})
<img src="({t_img_url filename=$target_c_member.image_filename w=120 h=120 f=jpg})"><br>
[<a href="({t_img_url filename=$target_c_member.image_filename f=jpg})">大</a>]<br>
({if ($target_c_member.image_filename_1!=$target_c_member.image_filename)&&$target_c_member.image_filename_1})
その他の写真:[<a href="({t_img_url filename=$target_c_member.image_filename_1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$target_c_member.image_filename_1 f=jpg})">大</a>]<br>
({/if})
({if ($target_c_member.image_filename_2!=$target_c_member.image_filename)&&$target_c_member.image_filename_2})
その他の写真:[<a href="({t_img_url filename=$target_c_member.image_filename_2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$target_c_member.image_filename_2 f=jpg})">大</a>]<br>
({/if})
({if ($target_c_member.image_filename_3!=$target_c_member.image_filename)&&$target_c_member.image_filename_3})
その他の写真:[<a href="({t_img_url filename=$target_c_member.image_filename_3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$target_c_member.image_filename_3 f=jpg})">大</a>]<br>
({/if})
({/if})

<hr>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_member.c_member_id})&amp;({$tail})">({$target_c_member.nickname})さんのﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})