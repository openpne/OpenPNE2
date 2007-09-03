({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
ﾒｰﾙ受信設定<br>
</td></tr></table>

<a name="setting"></a><br>
({t_form m=ktai a=do_c_home_update_is_receive_mail})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
({if ($c_commu.c_member_id_admin!=$u || $c_commu.c_member_id_sub_admin!=$u)})

<font color="#({$ktai_color_config.font_02})">このｺﾐｭﾆﾃｨの管理者からのﾒｯｾｰｼﾞを：</font><br>
<input type="radio" value="1" name="is_receive_message"({if $is_receive_message}) checked="checked"({/if})>受け取る<br>
<input type="radio" value="0" name="is_receive_message"({if !$is_receive_message}) checked="checked"({/if})>受け取らない<br>
({/if})
({if !$is_unused_ktai_bbs})
<br>
<font color="#({$ktai_color_config.font_02})">このｺﾐｭﾆﾃｨの書き込みをｹｰﾀｲﾒｰﾙで：</font><br>
<input type="radio" value="1" name="is_receive_mail"({if $is_receive_mail}) checked="checked"({/if})>受け取る<br>
<input type="radio" value="0" name="is_receive_mail"({if !$is_receive_mail}) checked="checked"({/if})>受け取らない<br>
({/if})
({if $smarty.const.OPENPNE_ENABLE_PC && !$is_unused_pc_bbs})
<br>
<font color="#({$ktai_color_config.font_02})">このｺﾐｭﾆﾃｨの書き込みをPCﾒｰﾙで：</font><br>
<input type="radio" value="1" name="is_receive_mail_pc"({if $is_receive_mail_pc}) checked="checked"({/if})>受け取る<br>
<input type="radio" value="0" name="is_receive_mail_pc"({if !$is_receive_mail_pc}) checked="checked"({/if})>受け取らない<br>
({/if})
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="設定"><br>
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
