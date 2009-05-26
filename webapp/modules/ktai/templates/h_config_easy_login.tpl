({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">設定変更</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">かんたんﾛｸﾞｲﾝ設定</font><br>
</td></tr></table>
({if $msg})
<font color="#({$ktai_color_config.font_09})">({$msg})</font><br>
<br>
({/if})

({if $is_registered})

<font color="#({$ktai_color_config.font_09})">かんたんﾛｸﾞｲﾝ設定済みです。</font><br>

<hr color="#({$ktai_color_config.border_01})">

変更するには
({/if})

ﾊﾟｽﾜｰﾄﾞを入力して、設定ﾎﾞﾀﾝを押してください。<br>
<br>
({t_form _attr='utn' m=ktai a=do_h_config_easy_login})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ﾊﾟｽﾜｰﾄﾞ：</font><br>
<input type="text" name="password" istyle="3" mode="alphabet" value=""><br>
<center>
({if $is_registered})
<input type="submit" name="update" value="変更">
({if $smarty.const.IS_GET_EASY_ACCESS_ID != 2 && $smarty.const.IS_GET_EASY_ACCESS_ID != 3})
<input type="submit" name="delete" value="削除">
({/if})
<br>
({else})
<input type="submit" name="update" value="携帯情報送信"><br>
({/if})
</center>
</form>

<hr color="#({$ktai_color_config.border_01})">

<font color="#({$ktai_color_config.font_09})">※一部機種では携帯の個体識別番号を送信できないためご利用になれません｡</font><br>
<a href="({t_url m=ktai a=page_o_whatis_easy_login})">&gt;&gt;かんたんﾛｸﾞｲﾝとは</a>

<hr color="#({$ktai_color_config.border_01})">

[i:90]<a href="({t_url m=ktai a=page_h_config})&amp;({$tail})">設定変更</a><br>

({$inc_ktai_footer|smarty:nodefaults})
