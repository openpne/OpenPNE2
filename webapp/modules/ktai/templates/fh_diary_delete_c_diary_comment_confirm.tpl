({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})"><a name="top">({$target_c_diary.subject})</a></font><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
<font color="#({$ktai_color_config.color_24})">({$WORD_DIARY_HALF})ｺﾒﾝﾄの削除</font><br>
</td></tr></table>

このｺﾒﾝﾄを本当に削除しますか?<br>

<hr color="#({$ktai_color_config.border_01})">
({$target_c_diary_comment.r_datetime|date_format:"%m/%d %H:%M"})<br>
({if $target_c_diary_comment.nickname})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_diary_comment.c_member_id})&amp;({$tail})">({$target_c_diary_comment.nickname})</a>({/if})
<br>
({$target_c_diary_comment.body|t_url2a_ktai|nl2br})

<hr color="#({$ktai_color_config.border_01})">
<center>
({t_form m=ktai a=do_fh_diary_delete_c_diary_comment})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_comment_id" value="({$target_c_diary_comment_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form _method=get m=ktai a=page_fh_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
