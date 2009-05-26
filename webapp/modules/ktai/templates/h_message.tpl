({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">
({if $c_message.c_member_id_to==$u})({if $c_message.is_deleted_to})ごみ箱({else})受信箱({/if})
({else})({if $c_message.is_deleted_from})ごみ箱({else})送信箱({/if})
({/if})
</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾒｯｾｰｼﾞ</font><br>
</td></tr></table>

({if $c_message.c_member_id_to==$u})
<font color="#({$ktai_color_config.font_06})">差出人：</font><a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_from})&amp;({$tail})">({$c_message.c_member_nickname_from})</a><br>
({else})
<font color="#({$ktai_color_config.font_06})">宛先：</font><a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_message.c_member_id_to})&amp;({$tail})">({$c_message.c_member_nickname_to})</a><br>
({/if})

<font color="#({$ktai_color_config.font_06})">日付：</font>({$c_message.r_datetime|date_format:"%y/%m/%d %H:%M"})<br>
<font color="#({$ktai_color_config.font_06})">件名：</font>({$c_message.subject})<br>
<hr color="#({$ktai_color_config.border_01})">
({$c_message.body|t_url2a_ktai|nl2br})
<br>
({if $c_message.image_filename_1})
写真1を見る:[<a href="({t_img_url filename=$c_message.image_filename_1 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_message.image_filename_1 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
({if $c_message.image_filename_2})
写真2を見る:[<a href="({t_img_url filename=$c_message.image_filename_2 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_message.image_filename_2 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
({if $c_message.image_filename_3})
写真3を見る:[<a href="({t_img_url filename=$c_message.image_filename_3 w=120 h=120 f=jpg})">小</a>/<a href="({t_img_url filename=$c_message.image_filename_3 w=$smarty.const.OPENPNE_IMG_KTAI_MAX_WIDTH h=$smarty.const.OPENPNE_IMG_KTAI_MAX_HEIGHT f=jpg})">大</a>]<br>
({/if})
({if $c_message.filename && $smarty.const.OPENPNE_USE_FILEUPLOAD})
ﾌｧｲﾙ名:({$c_message.original_filename})<br>
({/if})

({if $com_url})<a href="({$com_url})">({$WORD_COMMUNITY_HALF})ﾍﾟｰｼﾞ</a><br>({/if})
({if $friend_url})<a href="({$friend_url})">ﾒﾝﾊﾞｰのﾍﾟｰｼﾞ</a><br>({/if})
({if $c_message.is_syoudaku})
<a href="({t_url m=ktai a=page_h_confirm_list})&amp;({$tail})">承認待ちﾘｽﾄ</a><br>
({/if})

({if (!$c_message.is_deleted_from && $c_message.c_member_id_from==$u) || (!$c_message.is_deleted_to && $c_message.c_member_id_to==$u)})
<center>
<hr color="#({$ktai_color_config.border_01})">
({if $prev_c_message_id})
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$prev_c_message_id})&amp;({$tail})" accesskey="4">[i:128]前を表示</a>　
({/if})
({if $next_c_message_id})
<a href="({t_url m=ktai a=page_h_message})&amp;target_c_message_id=({$next_c_message_id})&amp;({$tail})" accesskey="6">[i:130]次を表示</a>
({/if})
</center>
({/if})
({if $c_message.c_member_id_to==$u})
({if $c_message.is_deleted_to})
<hr color="#({$ktai_color_config.border_01})">
[i:145]<a href="({t_url m=ktai a=do_h_message_update_c_message_is_deleted})&amp;c_message_id=({$c_message.c_message_id})&amp;({$tail})">元に戻す</a><br>
[i:56]<a href="({t_url m=ktai a=page_h_message_delete_confirm})&amp;c_message_id=({$c_message.c_message_id})&amp;({$tail})">削除する</a><br>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;({$tail})">ごみ箱</a><br>
({else})
<hr color="#({$ktai_color_config.border_01})">
[i:56]<a href="({t_url m=ktai a=page_h_message_trash_confirm})&amp;c_message_id=({$c_message.c_message_id})&amp;({$tail})">削除する</a><br>
({/if})

({if !$c_message.is_deleted_to})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
[i:106]<font color="#({$ktai_color_config.font_05})">返信を書く</font><br>
</td></tr></table>
({t_form m=ktai a=do_h_message_insert_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_message_id" value="({$c_message.c_message_id})">
<input type="hidden" name="target_c_member_id" value="({$c_message.c_member_id_from})">
({if $msg})<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>({/if})
<font color="#({$ktai_color_config.font_06})">ﾀｲﾄﾙ：</font><br>
<input type="text" name="subject" value="Re:({$c_message.subject})"><br>
<font color="#({$ktai_color_config.font_06})">本文：</font><br>
<textarea rows="6" name="body"></textarea><br>
<center>
<input type="submit" value="送信">
<input type="submit" name="save" value="下書き保存">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_message_box})&amp;box=inbox&amp;({$tail})">受信箱</a><br>
({/if})
({else})
({if $c_message.is_deleted_from})
<hr color="#({$ktai_color_config.border_01})">
[i:145]<a href="({t_url m=ktai a=do_h_message_update_c_message_is_deleted})&amp;c_message_id=({$c_message.c_message_id})&amp;({$tail})">元に戻す</a><br>
[i:56]<a href="({t_url m=ktai a=page_h_message_delete_confirm})&amp;c_message_id=({$c_message.c_message_id})&amp;({$tail})">削除する</a><br>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_message_box})&amp;box=trash&amp;({$tail})">ごみ箱</a><br>
({else})
<hr color="#({$ktai_color_config.border_01})">
[i:56]<a href="({t_url m=ktai a=page_h_message_trash_confirm})&amp;c_message_id=({$c_message.c_message_id})&amp;({$tail})">削除する</a><br>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_message_box})&amp;box=outbox&amp;({$tail})">送信箱</a><br>
({/if})
({/if})
({$inc_ktai_footer|smarty:nodefaults})
