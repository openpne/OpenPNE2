({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">ﾒｯｾｰｼﾞ</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">ﾒｯｾｰｼﾞをごみ箱へ移動</font><br>
</td></tr></table>

このﾒｯｾｰｼﾞをごみ箱に本当に移動しますか?<br>

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=do_h_message_update_c_message_is_deleted})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="c_message_id" value="({$c_message_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai a=page_h_message})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_message_id" value="({$c_message_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
