({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">PCﾒｰﾙｱﾄﾞﾚｽ登録</font><br>
</td></tr></table>
以下の欄にPCﾒｰﾙｱﾄﾞﾚｽを入力してください。<br>
<hr color="#({$ktai_color_config.border_01})">
({t_form m=ktai a=do_h_pc_send_insert_c_pc_address_pre})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">PCﾒｰﾙｱﾄﾞﾚｽ：</font><br>
<input type="text" name="pc_address" istyle="3" mode="alphabet" maxlength="100"><br>
<hr color="#({$ktai_color_config.border_01})">
<font color="#({$ktai_color_config.font_06})">
※届いたﾒｰﾙに記載してあるURLにｱｸｾｽして、ﾊﾟｽﾜｰﾄﾞを入力すると登録が完了します。<br>
※既にPCﾒｰﾙｱﾄﾞﾚｽが登録されている場合、新しいﾒｰﾙｱﾄﾞﾚｽに変更されます。
</font>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="送信">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>
({$inc_ktai_footer|smarty:nodefaults})