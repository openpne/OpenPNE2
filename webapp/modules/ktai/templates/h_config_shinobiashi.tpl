({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">忍び足設定</font><br>
</td></tr></table>
他人のページを見たときに、あしあとを残すかどうかを設定することができます。
<hr color="#({$ktai_color_config.border_01})">
<font color="#({$ktai_color_config.font_06})">忍び足設定：</font><br>
({t_form m=ktai a=do_h_config_shinobiashi_update_is_shinobiashi})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="radio" name="is_shinobiashi" value="0"({if !$is_shinobiashi}) checked="checked"({/if})>
あしあとを残す<br>
<input type="radio" name="is_shinobiashi" value="1"({if $is_shinobiashi}) checked="checked"({/if})>
あしあとを残さない<br>
<hr color="#({$ktai_color_config.border_01})">
<center>
<input type="submit" value="変更">
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
