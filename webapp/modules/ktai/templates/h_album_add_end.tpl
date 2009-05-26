({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">
ｱﾙﾊﾞﾑの作成完了</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$target_c_album.subject})</font><br>
</td></tr></table>

({if $album_limit})
[i:220]<font color="#({$ktai_color_config.font_09})">容量制限のお知らせ</font><br>
あなたの残りの容量は、合計({$limit_size})KBです。
<hr color="#({$ktai_color_config.border_01})">
({/if})

[i:106]<a href="mailto:({$mail_address})">ﾒｰﾙで写真を投稿</a><br>
写真(1枚目のみ)をｱﾙﾊﾞﾑに登録します。<br>
({$image_max})KB以内のGIF･JPEG･PNGが登録可能です。<br>
ﾒｰﾙの件名に写真の説明を記入してください。<br>
<font color="#({$ktai_color_config.font_09})">※ﾒｰﾙ投稿では絵文字が反映されません</font>

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_fh_album_image_list})&amp;target_c_album_id=({$target_c_album.c_album_id})&amp;({$tail})">ｱﾙﾊﾞﾑの写真一覧</a><br>
<a href="({t_url m=ktai a=page_fh_album})&amp;target_c_album_id=({$target_c_album.c_album_id})&amp;({$tail})">ｱﾙﾊﾞﾑの表紙</a><br>

({$inc_ktai_footer|smarty:nodefaults})
