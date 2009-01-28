({$inc_ktai_header|smarty:nodefaults})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">予定登録</a></font><br>
</td></tr></table>
時刻以外は必須です。<br>
携帯からは繰り返し機能は使用できません。<br>
携帯からは詳細は登録できません。
<hr color="#({$ktai_color_config.border_01})">
({if $msg})
<font color="#({$ktai_color_config.font_09})">※({$msg})</font><br>
<br>
({/if})
({t_form m=ktai_biz a=do_fhg_biz_schedule_add})
<input type="hidden" name="ksid" value="({$PHPSESSID})">

<font color="#({$ktai_color_config.font_06})">予定日：</font><br>
<input type="text" name="sc_b_year" maxlength="2" size="2" value="({$now.year})" istyle="4" mode="numeric">年
<input type="text" name="sc_b_month" maxlength="2" size="2" value="({$now.month})" istyle="4" mode="numeric">月
<input type="text" name="sc_b_date" maxlength="2" size="2" value="({$now.day})" istyle="4" mode="numeric">日<br>
<br>
<font color="#({$ktai_color_config.font_06})">時刻：</font><br>
<input type="text" name="sc_b_hour" maxlength="2" size="2" istyle="4" mode="numeric">時
<input type="text" name="sc_b_minute" maxlength="2" size="2" istyle="4" mode="numeric">分
～
<input type="text" name="sc_f_hour" maxlength="2" size="2" istyle="4" mode="numeric">時
<input type="text" name="sc_f_minute" maxlength="2" size="2" istyle="4" mode="numeric">分<br>
<br>
<font color="#({$ktai_color_config.font_06})">ﾀｲﾄﾙ：</font><br>
<input type="text" name="sc_title"><br>
<br>
<input type="hidden" name="biz_group_id" value="0">
<input type="hidden" name="public_flag" value="public">
<font color="#({$ktai_color_config.font_06})">参加者：</font><br>
<select name="sc_j_mem">
<option value="my">({if $is_f})({$WORD_FRIEND_HALF})({else})自分({/if})のみ</option>
<option value="">全ﾕｰｻﾞｰ
({foreach item=nm from=$jgroup name=join})
<option value="({$nm.biz_group_id})">({$nm.name})
({/foreach})
</select><br>
<br>
<font color="#({$ktai_color_config.font_06})">公開範囲：</font><br>
<input type="radio" name="public_flag" value="public" checked>全体に公開<br>
<input type="radio" name="public_flag" value="private">参加者のみに公開<br><br>
<center>
<input type="hidden" name="target_id" value="({$t_id})">
<input type="submit" name="entry" value="登録する">
</center>
</form>
<hr color="#({$ktai_color_config.border_01})">
[i:90]<a href="({t_url m=ktai_biz a=page_fh_calendar_week})&amp;target_id=({$t_id})&amp;({$tail})">週間ｶﾚﾝﾀﾞｰ</a><br>
({$inc_ktai_footer|smarty:nodefaults})
