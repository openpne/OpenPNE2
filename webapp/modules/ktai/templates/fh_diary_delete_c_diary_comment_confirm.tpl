({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$target_c_diary.subject})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
日記ｺﾒﾝﾄの削除<br>
</td></tr></table>

このｺﾒﾝﾄを本当に削除しますか?<br>

<hr color="#0d6ddf">
({$target_c_diary_comment.r_datetime|date_format:"%m/%d %H:%M"})<br>
({if $target_c_diary_comment.nickname})<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$target_c_diary_comment.c_member_id})&amp;({$tail})">({$target_c_diary_comment.nickname})</a>({/if})
<br>
({$target_c_diary_comment.body|t_url2a_ktai|nl2br})

<hr color="#0d6ddf">
<center>
({t_form m=ktai a=do_fh_diary_delete_c_diary_comment})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_comment_id" value="({$target_c_diary_comment_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form m=ktai a=page_fh_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
