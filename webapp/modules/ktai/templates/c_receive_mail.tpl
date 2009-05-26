({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$c_commu.name})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾒｰﾙ受信設定</font><br>
</td></tr></table>

この({$WORD_COMMUNITY_HALF})から送られてくるﾒｰﾙ・ﾒｯｾｰｼﾞの受信設定をします。<br>

<hr color="#({$ktai_color_config.border_01})">

({t_form m=ktai a=do_c_home_update_is_receive_mail})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
({if ($c_commu.c_member_id_admin!=$u && $c_commu.c_member_id_sub_admin!=$u)})
<font color="#({$ktai_color_config.font_06})">管理者からのﾒｯｾｰｼﾞ：</font><br>
<input type="radio" value="1" name="is_receive_message"({if $is_receive_message}) checked="checked"({/if})>受け取る<br>
<input type="radio" value="0" name="is_receive_message"({if !$is_receive_message}) checked="checked"({/if})>受け取らない<br>
<br>
({/if})
({if !$is_unused_ktai_bbs})
<font color="#({$ktai_color_config.font_06})">書き込みをｹｰﾀｲﾒｰﾙで：</font><br>
<input type="radio" value="1" name="is_receive_mail"({if $is_receive_mail}) checked="checked"({/if})>受け取る<br>
<input type="radio" value="0" name="is_receive_mail"({if !$is_receive_mail}) checked="checked"({/if})>受け取らない<br>
<br>
({/if})
({if $smarty.const.OPENPNE_ENABLE_PC && !$is_unused_pc_bbs && $is_registered_pc_address})
<font color="#({$ktai_color_config.font_06})">書き込みをPCﾒｰﾙで：</font><br>
<input type="radio" value="1" name="is_receive_mail_pc"({if $is_receive_mail_pc}) checked="checked"({/if})>受け取る<br>
<input type="radio" value="0" name="is_receive_mail_pc"({if !$is_receive_mail_pc}) checked="checked"({/if})>受け取らない<br>
<br>
({/if})
<center>
<input type="submit" value="設定"><br>
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">
<a href="({t_url m=ktai a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_COMMUNITY_HALF})ﾄｯﾌﾟ</a><br>

({$inc_ktai_footer|smarty:nodefaults})
