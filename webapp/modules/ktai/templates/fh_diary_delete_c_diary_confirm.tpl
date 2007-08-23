({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#0d6ddf">
<font color="#eeeeee"><a name="top">({$target_c_diary.subject})</a></font><br>
</td></tr>
<tr><td bgcolor="#dddddd" align="center">
日記の削除<br>
</td></tr></table>

この日記を本当に削除しますか?<br>

<hr color="#0d6ddf">
<center>
({t_form m=ktai a=do_fh_diary_delete_c_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary_id})">
<input type="submit" value="　は　い　"><br>
</form>

({t_form m=ktai a=page_fh_diary})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<input type="hidden" name="target_c_diary_id" value="({$target_c_diary_id})">
<input type="submit" value="　いいえ　">
</form>
</center>

({$inc_ktai_footer|smarty:nodefaults})
