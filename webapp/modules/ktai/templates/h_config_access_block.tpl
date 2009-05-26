({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ｱｸｾｽﾌﾞﾛｯｸ設定</font><br>
</td></tr></table>
ｱｸｾｽをﾌﾞﾛｯｸするﾒﾝﾊﾞｰのIDを指定します。<br>
<br>
({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})

({t_form m=ktai a=do_h_config_access_block_update})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
({foreach from=$c_member_id_block item=item})
<font color="#({$ktai_color_config.font_06})">ID：</font><br><input type="text" name="c_member_id_block[({$item})]" value="({$item})" istyle="4" mode="numeric"><br>
({/foreach})
<font color="#({$ktai_color_config.font_06})">ID：</font><br><input type="text" name="c_member_id_block[]" value="" istyle="4" mode="numeric"><br>

<center>
<input type="submit" value="変更"><br>
</center>

</form>

<hr color="#({$ktai_color_config.border_01})">

[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
