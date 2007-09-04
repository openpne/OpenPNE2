({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_02})" align="center">
ｱｸｾｽﾌﾞﾛｯｸ設定<br>
</td></tr></table>
ｱｸｾｽをﾌﾞﾛｯｸするﾒﾝﾊﾞｰのIDを指定します。<br>
<br>
({if $msg})
<font color="#({$ktai_color_config.font_04})">({$msg})</font><br>
<br>
({/if})

({t_form m=ktai a=do_h_config_access_block_update})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
({foreach from=$c_member_id_block item=item})
<font color="#({$ktai_color_config.font_02})">ID：</font><br><input type="text" name="c_member_id_block[]" value="({$item})"><br>
({/foreach})
<font color="#({$ktai_color_config.font_02})">ID：</font><br><input type="text" name="c_member_id_block[]" value=""><br>

<center>
<input type="submit" value="変更"><br>
</center>

</form>

<hr color="#({$ktai_color_config.border_01})">

%%i90%%<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
